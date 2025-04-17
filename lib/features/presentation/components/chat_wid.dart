import 'package:app/core/api/success.dart';
import 'package:app/core/resources/colors_x.dart';
import 'package:app/core/resources/styles_x.dart';
import 'package:app/core/services/downloader_service.dart';
import 'package:app/features/presentation/components/chat_error_wid.dart';
import 'package:app/features/presentation/cubit/image_gen_cubit.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:hugeicons/hugeicons.dart';

// ignore: must_be_immutable
class ChatWid extends StatelessWidget {
  ChatWid({
    super.key,
    required this.prompt,
    required this.imageList,
    required this.isGenerating,
    this.messageId
  });

  String prompt;
  String? messageId;
  List<dynamic> imageList;
  bool isGenerating;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageGenCubit, ImageGenState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (state.promptError != null && state.promptError!.isNotEmpty) || state.generateImageStatus.isFailure?
              ChatErrorWid(text: state.promptError ?? "") :
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SvgPicture.asset(
                            Assets.svg.profileAvatar
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          prompt,
                          style: getSemiBoldStyle(
                              fontSize: 16, color: ColorManager.primaryTextColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  isGenerating ?
                  const Row(
                    children: [
                      SpinKitThreeBounce(
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ):
                  imageList.isEmpty ?
                  Container() :
                  buildForImageGrid(
                    imageList
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: prompt)).then((v) => handleSuccess(message: "Copied Text!!"));
                    },
                    icon: const Icon(
                      HugeIcons.strokeRoundedCopy01,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ImageDownloader.downloadMultipleImages(context, List<String>.from(imageList));
                    },
                    icon: const Icon(
                      HugeIcons.strokeRoundedDownload02,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ImageGenCubit>().reGenerateImage(
                        messageId: messageId ?? "",
                        newPrompt: prompt
                      );
                    },
                    icon: const Icon(
                      HugeIcons.strokeRoundedRefresh,
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  buildForImageGrid(List<dynamic> imageList) {
    return BlocBuilder<ImageGenCubit, ImageGenState>(
      builder: (context, state) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration:  BoxDecoration(
                          color: ColorManager.cardColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              imageList[0] ?? ""
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.cardColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              imageList[1] ?? ""
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.cardColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              imageList[2]
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        decoration:  BoxDecoration(
                          color: ColorManager.cardColor,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              imageList[3]
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animate().fade(
          duration: 500.ms,
          curve: Curves.easeInOut
        );
      },
    );
  }
}
