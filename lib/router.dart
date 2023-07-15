import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/videos/video_recording_screen.dart';

final router = GoRouter(
  routes: [
    // GoRoute(
    //   name: SingUpScreen.routeName,
    //   path: SingUpScreen.routeURL,
    //   builder: (context, state) => const SingUpScreen(),
    //   routes: [
    //     GoRoute(
    //       path: UsernameScreen.routeURL,
    //       name: UsernameScreen.routeName,
    //       builder: (context, state) => const UsernameScreen(),
    //       routes: [
    //         GoRoute(
    //           name: EmailScreen.routeName,
    //           path: EmailScreen.routeURL,
    //           builder: (context, state) {
    //             final args = state.extra as EmailScreenArgs;
    //             return EmailScreen(username: args.username);
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    GoRoute(
      path: "/",
      builder: (context, state) => const VideoRecordingScreen(),
    )
  ],
);
