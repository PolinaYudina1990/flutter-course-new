import 'dart:async';

import 'package:form_validation/data/api/model/model_pet.dart';
import 'package:form_validation/presentation/widget/button_ready.dart';
import 'package:form_validation/presentation/widget/checkbox.dart';
import 'package:form_validation/presentation/widget/container_textform.dart';
import 'package:form_validation/presentation/widget/date_picker.dart';
import 'package:form_validation/presentation/widget/navigation_row.dart';
import 'package:form_validation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/utils/fonts.dart';
import 'package:form_validation/utils/validators.dart';
import 'package:intl/intl.dart';

bool _submitted = false;
bool isLoading = false;

class PetProfile extends StatefulWidget {
  const PetProfile({super.key});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  static const Pet _initialValue = Pet.dog;
  final ValueNotifier<Pet> selectedPet = ValueNotifier<Pet>(_initialValue);
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController weitController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final ValueNotifier<List<Vaccine>> _checkboxValue =
      ValueNotifier<List<Vaccine>>([]);
  final Map<Vaccine, TextEditingController> _controllers = {
    Vaccine.rabies: TextEditingController(),
    Vaccine.kovid: TextEditingController(),
    Vaccine.malaria: TextEditingController()
  };

  void updateForm() {
    if (formKey.currentState!.validate()) {
      setState(() {
        _submitted = true;
        formKey.currentState!.save();
      });
    }
  }

  void _submit() async {
    isLoading = true;
    updateForm();
    final PetData formData = PetData(
        nameController.text,
        DateTime.parse(dateController.text),
        int.parse(weitController.text),
        emailController.text,
        _checkboxValue.value);
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isLoading = false;
    });
    // isLoading = false;
  }

  @override
  void dispose() {
    selectedPet.dispose();
    nameController.dispose();
    dateController.dispose();
    weitController.dispose();
    emailController.dispose();
    _controllers.forEach((vaccine, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Pet>(
      valueListenable: selectedPet,
      builder: (context, pet, _) {
        return SafeArea(
          child: Form(
            key: formKey,
            onChanged: () {
              updateForm();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  NavigationRow(
                    selectedPet: selectedPet,
                  ),
                  PetPasport(
                    checkboxValue: _checkboxValue,
                    submited: _submitted,
                    nameController: nameController,
                    dateController: dateController,
                    weitController: weitController,
                    emailController: emailController,
                    controllers: _controllers,
                    selectedPet: selectedPet,
                  ),
                  ButtonWidget(
                    enabled: _submitted,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                        _submitted = false;
                      });
                      await Future.delayed(const Duration(seconds: 2));
                      setState(() {
                        isLoading = false;
                      });
                    },
                    isLoading: isLoading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PetPasport extends StatefulWidget {
  final bool submited;
  final ValueNotifier<Pet> selectedPet;
  final TextEditingController nameController;
  final TextEditingController dateController;
  final TextEditingController weitController;
  final TextEditingController emailController;
  final Map<Vaccine, TextEditingController> controllers;
  final ValueNotifier<List<Vaccine>> checkboxValue;

  const PetPasport(
      {super.key,
      required this.submited,
      required this.nameController,
      required this.dateController,
      required this.weitController,
      required this.emailController,
      required this.controllers,
      required this.checkboxValue,
      required this.selectedPet});

  @override
  State<PetPasport> createState() => _PetPasportState();
}

class _PetPasportState extends State<PetPasport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerTextFormField(
            enabled: isLoading ? false : true,
            keyboardType: TextInputType.name,
            validators: nameValidator,
            labelText: AppStrings.pasportPageName,
            controller: widget.nameController,
          ),
          ContainerTextFormField(
              enabled: isLoading ? false : true,
              keyboardType: TextInputType.datetime,
              validators: dateValidator,
              labelText: AppStrings.pasportPageDate,
              controller: widget.dateController,
              onTap: () async {
                DateTime? pickedDate = await selectDate(
                  context: context,
                );
                if (pickedDate != null) {
                  widget.dateController.text =
                      DateFormat('dd.MM.yyyy').format(pickedDate);
                }
              }),
          ContainerTextFormField(
            enabled: isLoading ? false : true,
            keyboardType: TextInputType.number,
            validators: weightValidator,
            labelText: AppStrings.pasportWeight,
            controller: widget.weitController,
          ),
          ContainerTextFormField(
            enabled: isLoading ? false : true,
            keyboardType: TextInputType.emailAddress,
            validators: emailValidator,
            labelText: AppStrings.pasportPageEmail,
            controller: widget.emailController,
          ),
          if (widget.selectedPet.value == Pet.dog ||
              widget.selectedPet.value == Pet.cat)
            Column(
              children: [
                const Text(
                  AppStrings.pasportPageTitleVaccine,
                  style: AppTypography.headline1,
                ),
                for (final vaccine in Vaccine.values)
                  ValueListenableBuilder<List<Vaccine>>(
                    valueListenable: widget.checkboxValue,
                    builder: (context, state, child) {
                      return Opacity(
                        opacity: isLoading ? 0.5 : 1,
                        child: CheckboxWidget(
                          enabled: isLoading ? false : true,
                          title: vaccine.value,
                          submited: widget.submited,
                          value: state.contains(vaccine),
                          onChanged: (value) {
                            if (value!) {
                              widget.checkboxValue.value = List.from(state)
                                ..add(vaccine);
                            } else {
                              widget.checkboxValue.value = List.from(state)
                                ..remove(vaccine);
                            }
                          },
                          onTapTextFieldCheckBox: () async {
                            DateTime? pickedDate = await selectDate(
                              context: context,
                            );
                            if (pickedDate != null) {
                              widget.controllers[vaccine]!.text =
                                  DateFormat('dd.MM.yyyy').format(pickedDate);
                            }
                          },
                          controllerTextFieldCheckBox:
                              widget.controllers[vaccine],
                        ),
                      );
                    },
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
