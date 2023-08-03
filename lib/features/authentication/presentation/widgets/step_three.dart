import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/view_model_manger/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
      builder: (context, state) {
        return Wrap(
          runSpacing: 3,
          alignment: WrapAlignment.center,
          spacing: 5,
          children: List.generate(
              CompleteProfileCubit.get(context).categories.length,
              (index) => FilterChip(
                    label: Text(
                      CompleteProfileCubit.get(context).categories[index],
                      style: const TextStyle(color: kColor),
                    ),
                    showCheckmark: true,
                    selected:
                        CompleteProfileCubit.get(context).doesContain(index),
                    selectedColor: kDefaultColor.withOpacity(.4),
                    onSelected: (bool value) {
                      if (value) {
                        CompleteProfileCubit.get(context)
                            .addToSelectedCategories(index);
                      } else {
                        CompleteProfileCubit.get(context)
                            .removeFromSelectedCategories(index);
                      }
                    },
                  )),
        );
      },
    );
  }
}
