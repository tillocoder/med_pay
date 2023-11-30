import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/registr/registr_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/components/buttons/bottom_navigation_button.dart';
import 'package:sample_bloc_mobile/src/presentation/components/snack/snack.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/regstr/mixin.dart';

class RegstPage extends StatefulWidget {
  const RegstPage({
    super.key,
    required this.phone,
  });

  final String phone;

  @override
  State<RegstPage> createState() => _RegstPageState();
}

class _RegstPageState extends State<RegstPage> with RegisterMixin {
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccesState) {
            context.pushNamed(Routes.confirmCode, extra: widget.phone);
          } else if (state is RegisterConfirmSuccess) {
            context.pushNamed(
              Routes.confirmCode,
            );
          } else if (state is RegisterErrorState) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: context.color.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: AppUtils.kPaddingHor16Ver12,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Регистрация',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Center(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  fillColor: context.color.white.withOpacity(0.2),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: context.color.yellow),
                    borderRadius: AppUtils.kBorderRadius8,
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationButton(
            child: ElevatedButton(
              onPressed: () {
                print('dsdbjhd:${widget.phone}');
                context.read<RegisterBloc>().add(
                      RegisterCheckEvent(
                        userName: nameController.text,
                        phone: widget.phone,
                      ),
                    );
              },
              child: const Text('Продолжить'),
            ),
          ),
        ),
      );
}
