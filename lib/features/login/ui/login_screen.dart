import 'package:appoinment_app/core/helpers/spacing.dart';
import 'package:appoinment_app/core/theming/styles.dart';
import 'package:appoinment_app/features/login/data/models/login_request_body.dart';
import 'package:appoinment_app/features/login/logic/login_cubit.dart';
import 'package:appoinment_app/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:appoinment_app/features/login/ui/widgets/email_and_password.dart';
import 'package:appoinment_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:appoinment_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/app_text_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                   EmailAndPassword(),
                    verticalSpace(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Login',
                      onPressed: () {
                        buildValidateThenDoLogin(context);
                      },
                      textStyle: TextStyles.font16WhiteSemiBold,
                    ),
                    verticalSpace(16),
                    TermsAndConditionsText(),
                    verticalSpace(60),
                    DontHaveAccountText(),
                    LoginBlocListener()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void buildValidateThenDoLogin(BuildContext context){
    if(context.read<LoginCubit>().formKey.currentState!.validate()){
      context.read<LoginCubit>().emitLoginStates(
         LoginRequestBody(
           email: context.read<LoginCubit>().emailController.text,
           password: context.read<LoginCubit>().passwordController.text,
       )
      );
    }
  }
}
