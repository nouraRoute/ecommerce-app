import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/utils/ui_utils.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  Text(
                    'Welcome Back To Route',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s24.sp),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: getLightStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s16.sp),
                  ),
                  SizedBox(
                    height: AppSize.s50.h,
                  ),
                  BuildTextField(
                    controller: emailController,
                    backgroundColor: ColorManager.white,
                    hint: 'enter your email',
                    label: 'User name',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                  ),
                  SizedBox(
                    height: AppSize.s28.h,
                  ),
                  BuildTextField(
                    controller: passwordController,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'Password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: AppSize.s8.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget password?',
                            style: getMediumStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s18.sp),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s60.h,
                  ),
                  Center(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * .8,
                      child: BlocListener<AuthCubit, AuthCubitState>(
                        listener: (BuildContext context, state) {
                          if (state is AuthCheckTokenSuccess) {
                            print('XXXX');
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.mainRoute);
                          }
                          if (state is AuthSignInLoadingState) {
                            UIUtils.showLoadingDialog(context);
                          } else if (state is AuthSignInSuccessState) {
                            UIUtils.hideDialog(context);
                            Navigator.pushReplacementNamed(
                                context, Routes.mainRoute);
                          } else if (state is AuthSignInErrorState) {
                            UIUtils.hideDialog(context);
                            UIUtils.showErrorDialog(context, state.message);
                          }
                        },
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          isStadiumBorder: false,
                          label: 'Login',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s18),
                          onTap: () {
                            log('XXXXX${_key.currentState?.validate()}');

                            if (_key.currentState?.validate() == true) {
                              log('XXXXX');
                              BlocProvider.of<AuthCubit>(context).signIn(
                                  SignInParameters(
                                      email: emailController.text,
                                      password: passwordController.text));
                            }
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, Routes.mainRoute, (route) => false);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: getSemiBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        width: AppSize.s8.w,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, Routes.signUpRoute),
                        child: Text(
                          'Create Account',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
