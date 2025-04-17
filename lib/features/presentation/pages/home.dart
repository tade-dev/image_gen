import 'package:app/core/di/injectable.dart';
import 'package:app/core/resources/colors_x.dart';
import 'package:app/core/resources/styles_x.dart';
import 'package:app/core/route/route.gr.dart';
import 'package:app/features/presentation/components/empty_state.dart';
import 'package:app/features/presentation/components/recents_tile.dart';
import 'package:app/features/presentation/components/suggestion_tile.dart';
import 'package:app/features/presentation/cubit/image_gen_cubit.dart';
import 'package:app/features/presentation/widgets/app_bar/ai_bar.dart';
import 'package:app/features/presentation/widgets/input/prompt_field.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageGenCubit, ImageGenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Aibar(
              title: "Image Generator 🚀",
              actions: [
                IconButton(
                  onPressed: () {
                    si<AppRouter>().push(const ChatHistoryView());
                  },
                  icon: const Icon(
                    Iconsax.clock,
                    color: ColorManager.primaryTextColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ImageGenCubit>().startNewConversation();
                    si<AppRouter>().push(const ChatRoomView());
                  },
                  icon: const Icon(
                    Iconsax.edit,
                    color: ColorManager.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  flex: 12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          buildImageSuggestions(),
                          const SizedBox(height: 20,),
                          Text(
                            "Recents",
                            style: getBoldStyle(
                              color: ColorManager.primaryTextColor,
                              fontSize: 18
                            ),
                          ).animate()
                          .fade(
                            delay: const Duration(milliseconds: 1000),
                             duration: const Duration(milliseconds: 1000),
                            begin: 0,
                            end: 1
                          ).scale(
                            duration: const Duration(milliseconds: 800),
                            curve: const ElasticInOutCurve()
                          ),
                          const SizedBox(height: 5,),
                          buildRecents(),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PromptField(
                    selectedImages: state.selectedImages,
                    onpressImage: () {
                      context.read<ImageGenCubit>().removeImage(0);
                    },
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
                            visible: state.promptString.isNotEmpty,
                            child: GestureDetector(
                              onTap: () {
                                context.read<ImageGenCubit>().startNewConversation();
                                Future.delayed(const Duration(
                                  milliseconds: 100
                                ), (){
                                  if(context.mounted) {
                                    context.read<ImageGenCubit>().generateImage(prompt: state.promptString);
                                    si<AppRouter>().push(const ChatRoomView());
                                  }
                                });
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
                  )
                )
              ],
            ),
          ),
        );
      },
    );
  }

  buildImageSuggestions() {
    return BlocBuilder<ImageGenCubit, ImageGenState>(
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.imageSuggestions.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisExtent: 130,
            mainAxisSpacing: 10
          ), 
          itemBuilder:(context, index) {
            var suggestion = state.imageSuggestions[index];
            return SuggestionTile(
              onTap: () {
                context.read<ImageGenCubit>().startNewConversation();
                Future.delayed(const Duration(
                  milliseconds: 100
                ), (){
                  if(context.mounted) {
                    context.read<ImageGenCubit>().generateImage(
                      prompt: suggestion["prompt"]
                    );
                    si<AppRouter>().push(const ChatRoomView());
                  }
                });
              },
              title: suggestion["prompt"], 
              imagePath: suggestion["image"]
            );
          },
        );
      },
    );
  }
}

buildRecents(
  {
    bool isFromHome = true
  }
) {
  return BlocBuilder<ImageGenCubit, ImageGenState>(
    builder: (context, state) {
      return (state.recentsPrompts == null || state.recentsPrompts!.isEmpty) ?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: EmptyStateWid(title: "No recent conversations", isFromHome: isFromHome,),
          ),
        ],
      ):
      ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: state.recentsPrompts?.length ?? 0,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true, 
        separatorBuilder: (context, index) => const SizedBox(height: 10,),
        itemBuilder: (context, index) {
          var recents = state.recentsPrompts?[index];
          return RecentsTile(
            isFromHome: isFromHome,
            timeStamp: si<ImageGenCubit>().formatDateTime(DateTime.parse(recents?.createdAt ?? DateTime.now().toString())), 
            title: recents?.messages?.first.body ?? "", 
            onTap: (){
              si<ImageGenCubit>().loadConversation(recents?.id ?? "");
              si<AppRouter>().push(const ChatRoomView());
            },
            index: index,
          );
        },
      );
    },
  );
}

