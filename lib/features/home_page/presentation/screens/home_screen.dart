import 'package:amanahtask/core/utils/resources/color_manager.dart';
import 'package:amanahtask/features/home_page/presentation/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../bloc/app_event.dart';
import '../bloc/app_state.dart';
import '../widget/button.dart';
import '../widget/change_lan_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController dateController;

  late GlobalKey<FormState> formKey;
  int genderSelceted = 0;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    dateController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dateController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1901, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.value =
            TextEditingValue(text: picked.toString().split(" ")[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: ColorManager.mainColor,
              title: Text(
                LocaleKeys.datapage.tr(),
                style: const TextStyle(color: ColorManager.whiteColor),
              ),
              centerTitle: true,
              leading: ChangeLang()),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.name.tr(),
                      style: const TextStyle(
                          color: ColorManager.blueTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        // suffixIcon: Image.asset(LogoManager.user),
                        filled: true,
                        fillColor: ColorManager.textFormFieldGrey,
                        hintText:
                            "${LocaleKeys.enter.tr()} ${LocaleKeys.name.tr()}",
                        hintStyle: const TextStyle(
                          color: ColorManager.grey,
                          fontSize: 16,
                          fontFamily: "din",
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '${LocaleKeys.Please.tr()} ${LocaleKeys.name.tr()}';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      LocaleKeys.email.tr(),
                      style: const TextStyle(
                          color: ColorManager.blueTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        // suffixIcon: Image.asset(LogoManager.user),
                        filled: true,
                        fillColor: ColorManager.textFormFieldGrey,
                        hintText:
                            "${LocaleKeys.enter.tr()} ${LocaleKeys.email.tr()}",
                        hintStyle: const TextStyle(
                          color: ColorManager.grey,
                          fontSize: 16,
                          fontFamily: "din",
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '${LocaleKeys.Please.tr()} ${LocaleKeys.email.tr()}';
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (emailValid == false) {
                          return '${LocaleKeys.email.tr()} ${LocaleKeys.wrong.tr()}';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      LocaleKeys.password.tr(),
                      style: const TextStyle(
                          color: ColorManager.blueTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        // suffixIcon: Image.asset(LogoManager.user),
                        filled: true,
                        fillColor: ColorManager.textFormFieldGrey,
                        hintText:
                            "${LocaleKeys.enter.tr()} ${LocaleKeys.password.tr()}",
                        hintStyle: const TextStyle(
                          color: ColorManager.grey,
                          fontSize: 16,
                          fontFamily: "din",
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '${LocaleKeys.Please.tr()} ${LocaleKeys.password.tr()}';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      LocaleKeys.gender.tr(),
                      style: const TextStyle(
                          color: ColorManager.blueTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField(
                      // icon: Image.asset(LogoManager.arrowDown),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorManager.textFormFieldGrey,
                        hintText: LocaleKeys.gender.tr(),
                        hintStyle: const TextStyle(
                            color: ColorManager.grey, fontSize: 16),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        genderSelceted = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return '${LocaleKeys.Please.tr()} ${LocaleKeys.gender.tr()}';
                        }
                        return null;
                      },
                      items: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text(LocaleKeys.boy.tr()),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text(LocaleKeys.girl.tr()),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      LocaleKeys.birthdate.tr(),
                      style: const TextStyle(
                          color: ColorManager.blueTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    // inside Widget build
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: dateController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorManager.textFormFieldGrey,
                            hintText:
                                "${LocaleKeys.enter.tr()} ${LocaleKeys.birthdate.tr()}",
                            hintStyle: const TextStyle(
                                color: ColorManager.grey, fontSize: 16),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '${LocaleKeys.Please.tr()} ${LocaleKeys.birthdate.tr()}';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ButtonWidget(
                      label: LocaleKeys.submit.tr(),
                      onTap: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                        AppBloc.appBlocInstance.add(
                          SubmitUserDataEvent(
                            birthdate: dateController.text,
                            email: emailController.text,
                            gender: genderSelceted,
                            name: nameController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
