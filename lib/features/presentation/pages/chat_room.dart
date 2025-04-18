import 'package:app/core/di/injectable.dart';
import 'package:app/core/resources/colors_x.dart';
import 'package:app/core/route/route.gr.dart';
import 'package:app/features/presentation/components/chat_wid.dart';
import 'package:app/features/presentation/cubit/image_gen_cubit.dart';
import 'package:app/features/presentation/widgets/app_bar/ai_bar.dart';
import 'package:app/features/presentation/widgets/input/prompt_field.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageGenCubit, ImageGenState>(
      builder: (context, state) {
        return PopScope(
          onPopInvokedWithResult: (didPop, result) {
            context.read<ImageGenCubit>().clearPromptMessage();
          },
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50), 
              child: Aibar(
                title: "Image Generator 🚀",
                leading: IconButton(
                  onPressed: (){
                    si<AppRouter>().pop();
                  }, 
                  icon: const Icon(
                    Iconsax.arrow_left,
                    color: ColorManager.primaryTextColor,
                  )
                ),
              )
            ),
            body: SafeArea(
              top: false,
              child: Column(
                children: [
                  Expanded(
                    flex: 12,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.separated(
                        itemCount: state.promptMessages?.length ?? 0,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final isLastItem = index == 0;
                          final isGenerating = isLastItem && state.generateImageStatus.isInProgress;
                          return ChatWid(
                            variation: state.promptMessages?[index].variation ?? false,
                            variationImg: state.promptMessages?[index].variationImg,
                            imageList: state.promptMessages?[index].attachments ?? [],
                            prompt: state.promptMessages?[index].body ?? "",
                            isGenerating: isGenerating,
                            messageId: state.promptMessages?[index].id,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: PromptField(
                        selectedImages: state.selectedImages,
                        onpressImage: () {
                          context.read<ImageGenCubit>().removeImage(0);
                        },
                        autofocus: true,
                        onChanged: (value) {
                          context.read<ImageGenCubit>().updatePromptString(value);
                        },
                        controller: state.prompt,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: (){
                                  context.read<ImageGenCubit>().getImage();
                                }, 
                                icon: const Icon(
                                  HugeIcons.strokeRoundedImage01,
                                  color: ColorManager.primaryTextColor,
                                )
                              ),
                              Visibility(
                                visible: state.promptString.isNotEmpty || (state.selectedImages ?? []).isNotEmpty,
                                child: GestureDetector(
                                  onTap: () {
                                    if ((state.selectedImages ?? []).isNotEmpty) {
                                      context.read<ImageGenCubit>().generateImage(prompt: state.promptString, isImageVariation: true);
                                    }else {
                                      context.read<ImageGenCubit>().generateImage(prompt: state.promptString);
                                    }
                                    context.read<ImageGenCubit>().clearPrompt();
                                  },
                                  child: SvgPicture.asset(
                                    Assets.svg.mynauiArrowUpRightCircleSolid,
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              ).animate().fade().scale(),
                            ],
                          ),
                        ),
                        hintText: "Ask anything...",
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}