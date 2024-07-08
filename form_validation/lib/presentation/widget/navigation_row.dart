import 'package:form_validation/presentation/widget/icon_pet.dart';
import 'package:form_validation/utils/app_strings.dart';
import 'package:flutter/material.dart';

class NavigationRow extends StatelessWidget {
  final ValueNotifier<Pet> selectedPet;
  const NavigationRow({super.key, required this.selectedPet});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconPet(
          isSelected: selectedPet.value == Pet.dog,
          onPressed: () {
            selectedPet.value = Pet.dog;
          },
          iconName: IconStrings.dogIcon,
          iconText: AppStrings.petProfileIconNavText1,
        ),
        IconPet(
          isSelected: selectedPet.value == Pet.cat,
          onPressed: () {
            selectedPet.value = Pet.cat;
          },
          iconName: IconStrings.catIcon,
          iconText: AppStrings.petProfileIconNavText2,
        ),
        IconPet(
          isSelected: selectedPet.value == Pet.parrot,
          onPressed: () {
            selectedPet.value = Pet.parrot;
          },
          iconName: IconStrings.parrotIcon,
          iconText: AppStrings.petProfileIconNavText3,
        ),
        IconPet(
          isSelected: selectedPet.value == Pet.hamster,
          onPressed: () {
            selectedPet.value = Pet.hamster;
          },
          iconName: IconStrings.hamsterIcon,
          iconText: AppStrings.petProfileIconNavText4,
        ),
      ],
    );
  }
}
