import 'dart:io';

import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/book_feature/presentation/view/widgets/add_record_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({super.key});

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  final ImagePicker picker = ImagePicker();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfCreationController = TextEditingController();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomAppBar(
                  title: 'Add Records',
                 ),
            ),
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () {
                onImagesFromGalleryBtnPressed();
                setState(() {});
              },
              child: Container(
                height: 15.h,
                width: 25.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorManager.green.withOpacity(0.3),
                ),
                child: image == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: ColorManager.green,
                            size: 40,
                          ),
                          Text(
                            'Add more images',
                            textAlign: TextAlign.center,
                            style: TextStyles.titleStyle16.copyWith(
                                color: ColorManager.green,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    : Image.file(
                        image!,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            const Spacer(),
            Container(
              width: 100.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset:
                        const Offset(0, -3), // negative offset for top shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddRecordTextField(
                    hintText: 'Enter patient name',
                    suffixIcon: const Icon(Icons.edit),
                    title: 'Record for',
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Record for',
                      style: TextStyles.titleStyle16,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.file_copy,
                            size: 40,
                            color: ColorManager.grey,
                          ),
                          const Text(
                            'Report',
                            style: TextStyles.titleStyle14,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.file_present,
                            size: 40,
                            color: ColorManager.grey,
                          ),
                          const Text(
                            'Prescription',
                            style: TextStyles.titleStyle14,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.monetization_on_outlined,
                            size: 40,
                            color: ColorManager.grey,
                          ),
                          const Text(
                            'Invoice',
                            style: TextStyles.titleStyle14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                  AddRecordTextField(
                    hintText: '27 Feb, 2021',
                    suffixIcon: const Icon(Icons.edit),
                    title: 'Record created on',
                    controller: dateOfCreationController,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomButton(
                    width: 70.w,
                    onTap: () {
                      Navigator.pushNamed(context,AppRoutes.allRecordsViewRoute);
                    },
                    buttonText: 'Upload record',
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
            // Text(
            //   'Add a medical record.',
            //   style: TextStyles.titleStyle25
            //       .copyWith(fontWeight: FontWeight.w700),
            // ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Text(
            //   'A detailed health history helps a doctor diagnose you better.',
            //   textAlign: TextAlign.center,
            //   style: TextStyles.titleStyle14
            //       .copyWith(fontWeight: FontWeight.w400),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> onImagesFromGalleryBtnPressed() async {
    //final List<XFile> images = await picker.pickMultiImage();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    print(
        '*********************************************image 0 path :${pickedFile?.path}');
  }
}
