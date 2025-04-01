import 'package:app/core/di/injectable.dart';
import 'package:app/core/route/route.gr.dart';
import 'package:app/core/services/theme.dart';
import 'package:app/features/presentation/cubit/image_gen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late ImageGenCubit imageGenCubit;
  late AppRouter appRouter;

  @override
  void initState() {
    super.initState();
    imageGenCubit = si<ImageGenCubit>();
    appRouter = si<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        title: 'Image Gen',
        theme: themeData,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    systemGestureInsets:
                        const EdgeInsets.all(400),
                    navigationMode:
                        NavigationMode.directional,
                    textScaler:
                        const TextScaler.linear(1.00)),
                child: Scaffold(
                  backgroundColor: Colors.white,
                  resizeToAvoidBottomInset: true,
                  body: child
                )
              ),
            )
          ],
        )
      ),
    );
  }

  List<SingleChildWidget> get providers {
    return [
      BlocProvider<ImageGenCubit>.value(value: imageGenCubit)
    ];
  } 

}
