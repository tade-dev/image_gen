import 'dart:convert';
import 'dart:developer';

import 'package:app/core/db/local_cache.dart';
import 'package:app/core/model/ranv_model.dart';
import 'package:app/features/data/models/chat_error_model.dart';
import 'package:app/features/data/models/gen_image_model.dart';
import 'package:app/features/data/models/recent_prompt_model.dart';
import 'package:app/features/domain/usecase/chat_u.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
part 'image_gen_state.dart';
part 'image_gen_cubit.freezed.dart';


@lazySingleton
class ImageGenCubit extends Cubit<ImageGenState> {

  GenerateImageUsecase generateImageUsecase;

  ImageGenCubit(
    this.generateImageUsecase
  ) : super(const ImageGenState()) {
    getRecentImages();
    getRecentConversations();
  }

  var uuid = const Uuid();

  updatePromptString(v) {
    emit(state.copyWith(
      promptString: v,
    ));
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat("d MMM yyyy • h:mm a").format(dateTime);
  }

  clearPrompt() {
    emit(state.copyWith(
      promptString: '',
    ));
  }

  getRecentPromptMessages(List<Message> messages) {
    emit(state.copyWith(
      promptMessages: messages
    ));
  }

  clearPromptMessage() {
    emit(state.copyWith(
      promptMessages: []
    ));
  }

  generateImage({String? prompt, String? conversationId}) async {
    final messageId = uuid.v4();
    
    emit(state.copyWith(
      generateImageStatus: FormzSubmissionStatus.inProgress,
      chatErrorModel: null,
      genImage: null,
      currentMessageId: messageId,
    ));

    final newPromptMessage = Message(
      id: messageId,
      createdAt: DateTime.now().toString(),
      body: prompt ?? state.promptString,
      attachments: [],
    );
    
    final currentConversationId = conversationId ?? 
      (state.activeConversationId ?? uuid.v4());
    
    if (state.activeConversationId == currentConversationId) {
      final updatedMessages = [newPromptMessage, ...?state.promptMessages];
      emit(state.copyWith(
        promptMessages: updatedMessages,
      ));
    } else {
      emit(state.copyWith(
        promptMessages: [newPromptMessage],
        activeConversationId: currentConversationId,
      ));
    }
    
    var payload = RequestParams(
      prompt: prompt ?? state.promptString,
      numberOfImages: 4,
    );

    var resp = await generateImageUsecase(payload);

    resp.fold(
      (l) {
        emit(state.copyWith(
          generateImageStatus: FormzSubmissionStatus.failure,
          promptError: l.message
        ));
      },
      (r) {
        int index = state.promptMessages?.indexWhere((p) => p.id == messageId) ?? -1;
        
        Message updatedMessage = Message(
          id: messageId,
          createdAt: DateTime.now().toString(),
          body: prompt ?? state.promptString,
          attachments: r.data?.map((e) => e.url ?? "").toList() ?? [],
        );

        List<Message> updatedMessages = [...(state.promptMessages ?? [])];
        if (index != -1) {
          updatedMessages[index] = updatedMessage;
        } else {
          updatedMessages.insert(0, updatedMessage);
        }
        
        int conversationIndex = state.recentsPrompts?.indexWhere(
          (conv) => conv.id == currentConversationId
        ) ?? -1;
        
        List<RecentPromptModel> updatedRecentPrompts = [...?state.recentsPrompts];
        
        if (conversationIndex != -1) {
          RecentPromptModel updatedConversation = RecentPromptModel(
            id: currentConversationId,
            createdAt: updatedRecentPrompts[conversationIndex].createdAt,
            lastUpdatedAt: DateTime.now().toString(),
            messages: updatedMessages
          );
          updatedRecentPrompts[conversationIndex] = updatedConversation;
        } else {
          RecentPromptModel newConversation = RecentPromptModel(
            id: currentConversationId,
            createdAt: DateTime.now().toString(),
            lastUpdatedAt: DateTime.now().toString(),
            messages: updatedMessages
          );
          updatedRecentPrompts.insert(0, newConversation);
        }

        emit(state.copyWith(
          generateImageStatus: FormzSubmissionStatus.success,
          genImage: r,
          genImageData: r.data,
          promptError: null,
          recentImages: [
            ...?r.data?.map((e) => e.url ?? ""),
            ...state.recentImages,
          ],
          promptMessages: updatedMessages,
          recentsPrompts: updatedRecentPrompts,
          activeConversationId: currentConversationId,
        ));

        log("Current conversation ID: $currentConversationId");
        log("Updated messages: ${updatedMessages.length}");
        log("Recent prompts count: ${updatedRecentPrompts.length}");
        
        // await GeneratedImagesCache().setGeneratedImagesCache(state.recentImages);
      }
    );
  }

  startNewConversation() {
    emit(state.copyWith(
      activeConversationId: null,
      promptMessages: [],
      promptString: '',
    ));
  }

  loadConversation(String conversationId) {
    final conversationIndex = state.recentsPrompts?.indexWhere(
      (conv) => conv.id == conversationId
    ) ?? -1;
    
    if (conversationIndex != -1 && state.recentsPrompts != null) {
      final conversation = state.recentsPrompts![conversationIndex];
      
      emit(state.copyWith(
        activeConversationId: conversationId,
        promptMessages: conversation.messages,
      ));
    }
  }

  reGenerateImage({required String messageId, String? newPrompt}) async {
    int messageIndex = state.promptMessages?.indexWhere((message) => message.id == messageId) ?? -1;
    
    if (messageIndex == -1 || state.promptMessages == null) {
      log("Cannot regenerate: message not found");
      return;
    }
    
    final originalMessage = state.promptMessages![messageIndex];
    
    final promptToUse = newPrompt ?? originalMessage.body;
    
    log("Regenerating image with prompt: $promptToUse");
    
    final newMessageId = uuid.v4();
    
    emit(state.copyWith(
      generateImageStatus: FormzSubmissionStatus.inProgress,
      chatErrorModel: null,
      genImage: null,
      promptError: null,
      currentMessageId: newMessageId,
    ));
    
    final regeneratingMessage = Message(
      id: newMessageId,
      createdAt: DateTime.now().toString(),
      body: promptToUse,
      attachments: [],
      isRegenerating: true,
    );
    
    List<Message> updatedMessages = [...(state.promptMessages ?? [])];
    updatedMessages[messageIndex] = regeneratingMessage;
    
    emit(state.copyWith(
      promptMessages: updatedMessages,
    ));
    
    var payload = RequestParams(
      prompt: promptToUse,
      numberOfImages: 4,
    );

    var resp = await generateImageUsecase(payload);

    resp.fold(
      (l) {
        updatedMessages[messageIndex] = originalMessage;
        
        emit(state.copyWith(
          generateImageStatus: FormzSubmissionStatus.failure,
          promptError: l.message,
          promptMessages: updatedMessages,
        ));
      },
      (r) {
        if (r.data == null || r.data!.isEmpty) {
          updatedMessages[messageIndex] = originalMessage;
          
          emit(state.copyWith(
            generateImageStatus: FormzSubmissionStatus.failure,
            promptError: "Image generation failed",
            promptMessages: updatedMessages,
          ));
        } else {
          Message newMessage = Message(
            id: newMessageId,
            createdAt: DateTime.now().toString(),
            body: promptToUse,
            attachments: r.data?.map((e) => e.url ?? "").toList() ?? [],
          );
          
          updatedMessages[messageIndex] = newMessage;
          
          final activeConversationId = state.activeConversationId;
          if (activeConversationId == null) {
            log("Warning: No active conversation found for regeneration");
            return;
          }
          
          final conversationIndex = state.recentsPrompts?.indexWhere(
            (conv) => conv.id == activeConversationId
          ) ?? -1;
          
          List<RecentPromptModel> updatedRecentPrompts = [...?state.recentsPrompts];
          
          if (conversationIndex != -1 && updatedRecentPrompts.isNotEmpty) {
            RecentPromptModel updatedConversation = RecentPromptModel(
              id: activeConversationId,
              createdAt: updatedRecentPrompts[conversationIndex].createdAt,
              lastUpdatedAt: DateTime.now().toString(),
              messages: updatedMessages,
            );
            
            updatedRecentPrompts[conversationIndex] = updatedConversation;
          }
          
          emit(state.copyWith(
            generateImageStatus: FormzSubmissionStatus.success,
            genImage: r,
            genImageData: r.data,
            promptError: null,
            recentImages: [
              ...?r.data?.map((e) => e.url ?? ""),
              ...state.recentImages,
            ],
            promptMessages: updatedMessages,
            recentsPrompts: updatedRecentPrompts,
          ));
          
          // Cache the images
          // await GeneratedImagesCache().setGeneratedImagesCache(state.recentImages);
          
          log("Regeneration complete for message $messageId");
        }
      }
    );
  }

  getRecentConversations() async {
    var recentPrompts = await RecentPromptsCache().getRecentPromptsCache();
    List<RecentPromptModel> recentConversations = recentPrompts.map((element)=> RecentPromptModel.fromJson(jsonDecode(element))).toList();

    emit(state.copyWith(
      recentsPrompts: recentConversations
    ));
  }

  getRecentImages() async {
    var recentImages = await GeneratedImagesCache().getGeneratedImagesCache();
    emit(state.copyWith(
      recentImages: recentImages
    ));
  }

  // updateRecentConversations(List<String> value) async {
  //   await RecentPromptsCache().setRecentPromptsCache(value);
  //   emit(state.copyWith(
  //     recentsPrompts: recentConversations
  //   ));
  // }

}
