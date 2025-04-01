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

  generateImage({prompt}) async {

    emit(state.copyWith(
      generateImageStatus: FormzSubmissionStatus.inProgress,
      chatErrorModel: null,
      genImage: null,
      currentMessageId: uuid.v4(),
    ));

    emit(state.copyWith(
      promptMessages: [
        Message(
          id: state.currentMessageId,
          createdAt: DateTime.now().toString(),
          body: prompt ?? state.promptString,
          attachments: [],
        ),
        ...?state.promptMessages,
      ],
    ));
    
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

      int index = state.promptMessages?.indexWhere((p) => p.id == state.currentMessageId) ?? -1;

      Message newMessage = Message(
        createdAt: DateTime.now().toString(),
        body: prompt ?? state.prompt?.text,
        attachments: r.data?.map((e) => e.url ?? "").toList() ?? [],
      );

      List<Message> updatedMessages = [...(state.promptMessages ?? [])];

      if (index != -1) {
        updatedMessages[index] = newMessage;
      } else {
        updatedMessages.insert(0, newMessage);
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
        recentsPrompts: [
          RecentPromptModel(
            id: uuid.v4(),
            createdAt: DateTime.now().toString(),
            messages: updatedMessages
          ),
          ...?state.recentsPrompts,
        ]
      ));

        log(state.promptMessages.toString());
        log(state.recentsPrompts.toString());
      }
    );

    await GeneratedImagesCache().setGeneratedImagesCache(state.recentImages);

  }

  reGenerateImage({required String prompt}) async {
    log(prompt);
    if (state.promptMessages == null || state.promptMessages!.isEmpty) return;

    final updatedMessages = List<Message>.from(state.promptMessages!);

    if (updatedMessages.isNotEmpty) {
      updatedMessages.removeAt(0);
    }

    emit(state.copyWith(promptMessages: updatedMessages));

    emit(state.copyWith(
      generateImageStatus: FormzSubmissionStatus.inProgress,
      chatErrorModel: null,
      genImage: null,
      promptError: null,
      currentMessageId: uuid.v4(),
    ));

    emit(state.copyWith(
      promptMessages: [
        Message(
          id: state.currentMessageId,
          createdAt: DateTime.now().toString(),
          body: prompt,
          attachments: [],
        ),
        ...updatedMessages,
      ],
    ));
    
    var payload = RequestParams(
      prompt: prompt,
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
        log("I am here");
      if(r.data == null) {
        emit(state.copyWith(
          generateImageStatus: FormzSubmissionStatus.failure,
          promptError: "Prompt failed"
        ));
      }else {

      int index = state.promptMessages?.indexWhere((p) => p.id == state.currentMessageId) ?? -1;

      Message newMessage = Message(
        createdAt: DateTime.now().toString(),
        body: prompt,
        attachments: r.data?.map((e) => e.url ?? "").toList() ?? [],
      );

      List<Message> updatedMessages = [...(state.promptMessages ?? [])];

      if (index != -1) {
        updatedMessages[index] = newMessage;
      } else {
        updatedMessages.insert(0, newMessage);
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
        // recentsPrompts: [
        //   RecentPromptModel(
        //     id: uuid.v4(),
        //     createdAt: DateTime.now().toString(),
        //     messages: updatedMessages
        //   ),
        //   ...?state.recentsPrompts,
        // ]
      ));

        log(state.promptMessages.toString());
        log(state.recentsPrompts.toString());
      }
      }
    );

    await GeneratedImagesCache().setGeneratedImagesCache(state.recentImages);

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
