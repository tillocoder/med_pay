import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_bloc_mobile/src/data/models/profile/all_branchs_response.dart';
import 'package:sample_bloc_mobile/src/data/source/local_source.dart';
import 'package:sample_bloc_mobile/src/injector_container.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/registr/registr_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/profile/profile_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/splash/splash_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/auth_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/confirm/confirm_code_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/regstr/regstr_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/internet_connection/internet_connection_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/basket/order/order_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/main_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/branchs/barnchs_detail/branchs_detail.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/branchs/barnchs_detail/branchs_detail_model.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/branchs/branchs_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/splash/splash_page.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

final localSource = sl<LocalSource>();

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      builder: (_, __) =>
          BlocProvider(
            create: (_) => sl<SplashBloc>(),
            child: const SplashPage(),
          ),
    ),

    /// main
    GoRoute(
      name: Routes.main,
      path: Routes.main,
      pageBuilder: (_, state) =>
          CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 1200),
            child: MultiBlocProvider(
              providers: [
                BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
                BlocProvider<HomeBloc>(
                    create: (_) =>
                    sl<HomeBloc>()
                      ..add(const CategoryEvent())..add(const BannerEvent())),
              ],
              child: const MainPage(),
            ),
            transitionsBuilder: (_, animation, __, child) =>
                FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(
                      animation),
                  child: child,
                ),
          ),
    ),

    /// profile
    GoRoute(
      path: Routes.branchs,
      name: Routes.branchs,
      builder: (_, __) =>
          BlocProvider(
            create: (context) => sl<ProfileBloc>()..add(const GetAllBranchsEvent(),),
            child: const BranchsPage(),
          ),
    ),


    GoRoute(
      path: Routes.branchsDetail,
      name: Routes.branchsDetail,
      builder: (_, state) =>   BranchsDetailPage(arguments:state.extra! as BranchArguments ),
    ),

    /// internet connection
    GoRoute(
      path: Routes.internetConnection,
      name: Routes.internetConnection,
      builder: (_, __) => const InternetConnectionPage(),
    ),

    /// orderCreate

    GoRoute(
      path: Routes.orderPage,
      name: Routes.orderPage,
      builder: (_, __) => const OrderCreatePage(),
    ),

    /// auth
    GoRoute(
      path: Routes.auth,
      name: Routes.auth,
      builder: (_, __) =>
          BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const AuthPage(),
          ),
    ),
    GoRoute(
      path: Routes.confirmCode,
      name: Routes.confirmCode,
      builder: (_, state) =>
          BlocProvider(
            create: (_) => sl<ConfirmCodeBloc>(),
            child: ConfirmCodePage(phone: state.extra as String? ?? ''),
          ),
    ),
    GoRoute(
      path: Routes.register,
      name: Routes.register,
      builder: (_, state) =>
          BlocProvider(
            create: (context) => sl<RegisterBloc>(),
            child: RegstPage(phone: state.extra! as String),
          ),
    ),
  ],
);

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
    pageBuilder: (context,
        animation,
        secondaryAnimation,) =>
        builder(context),
    transitionsBuilder: (context,
        animation,
        secondaryAnimation,
        child,) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}
