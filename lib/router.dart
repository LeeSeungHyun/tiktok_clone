import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

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
      name: SingUpScreen.routeName,
      path: SingUpScreen.routeURL,
      builder: (context, state) => const SingUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreen.routeName,
      path: InterestsScreen.routeURL,
      builder: (context, state) => const InterestsScreen(),
    )
  ],
);
