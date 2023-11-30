import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/components/buttons/bottom_navigation_button.dart';
import 'package:sample_bloc_mobile/src/presentation/components/inputs/custom_text_field.dart';
import 'package:sample_bloc_mobile/src/presentation/components/inputs/masked_text_input_formatter.dart';
import 'package:sample_bloc_mobile/src/presentation/components/loading_widgets/modal_progress_hud.dart';
import 'package:sample_bloc_mobile/src/presentation/components/snack/snack.dart';

part 'mixin/auth_mixin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AuthMixin {
  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthUserNotFound) {
            context.pushNamed(Routes.register, extra: state.phone);
          } else if (state is AuthCustomerPhone) {
            context.read<AuthBloc>().add(
                  AuthSendMessageEvent(phone: phoneController.text),
                );
          } else if (state is AuthSuccessState) {
            context.pushNamed(Routes.confirmCode, extra: state.phone);
          } else if (state is AuthErrorState) {
            showSnackBar(context, state.message);
          }else if (state is AuthLoadingState){
            const Center(child: CircularProgressIndicator.adaptive());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: AppUtils.kPaddingHor16Ver12,
                  child: Text(
                    'Регистрация',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ),
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) =>
                previous is AuthLoadingState != current is AuthLoadingState,
            builder: (_, state) => ModalProgressHUD(
              inAsyncCall: state is AuthLoadingState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppUtils.kGap20,
                  Padding(
                    padding: AppUtils.kPaddingHorizontal16,
                    child: CustomTextField(
                      controller: phoneController,
                      autofocus: true,
                      fillColor: const Color(0xFFEDEFF2),
                      filled: true,
                      onTap: () {},
                      inputFormatters: [
                        MaskedTextInputFormatter(
                          mask: '## ### ## ##',
                          separator: ' ',
                          filter: RegExp('[0-9]'),
                        ),
                      ],
                      onChanged: (value) {
                        context.read<AuthBloc>().add(
                              AuthPhoneChangeEvent(value ?? ''),
                            );
                      },
                      contentPadding: AppUtils.kPaddingHor14Ver16,
                      keyboardType: TextInputType.phone,
                      prefixText: '+998 ',
                      prefixStyle: Theme.of(context).textTheme.titleMedium,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) =>
                previous is AuthPhoneState != current is AuthPhoneState,
            builder: (_, state) => BottomNavigationButton(
              child: ElevatedButton(
                onPressed: state is AuthPhoneState
                    ? () {
                        context.read<AuthBloc>().add(
                              AuthCheckMessageEvent(
                                phoneController.text,
                                context,
                              ),
                            );
                      }
                    : null,
                child: const Text('Продолжить'),
              ),
            ),
          ),
        ),
      );
}

// Either<Failure, CustomerPhoneResponse> getType(){
// qanaqadir amal bajaradi
// return Either();
// }
