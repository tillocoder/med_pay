import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/components/loading_widgets/staggered_dots_wave.dart';
import '../../bloc/splash/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const SplashEvent());
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.isTimerFinished) {
            context.pushReplacementNamed(Routes.auth);
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            backgroundColor: context.theme.primaryColor,
            body: const Stack(
              children: [
                Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        AppIcons.main,
                        color: Colors.white,
                        size: 48,
                      ),
                      AppUtils.kGap8,
                      Text(
                        'MEDPAY',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: StaggeredDotsWave(
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
