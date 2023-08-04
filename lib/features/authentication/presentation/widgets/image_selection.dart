import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/view_model_manger/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:book/features/authentication/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSelection extends StatelessWidget {
  const ImageSelection({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
      listener: (context, state) {
        if (state is UploadUserImage) {
          if (!state.data.succsuful) {
            ScaffoldMessenger.of(context).showSnackBar(
              MySnackBar.getSnackBar(state.data.errorString!),
            );
          }
          else{CompleteProfileCubit.get(context).imageLink=state.data.path!;}
        }
        if(state is CompleteProfileInitial){
       //   CompleteProfileCubit.get(context).imageLink=
        }
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
                radius: 60,
                backgroundColor: kColor,
                backgroundImage: NetworkImage(CompleteProfileCubit.get(context).imageLink)),
            FloatingActionButton.small(
              onPressed: () {
                CompleteProfileCubit.get(context).uploadImage();
              },
              backgroundColor: kDefaultColor,
              child: const Icon(Icons.add_a_photo_outlined),
            )
          ],
        );
      },
    );
  }
}
