import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../utils/color_manager.dart';

class ProfileImage extends StatefulWidget {
  final String imageUrl;
  final Function(String)? onImageSelected;

  const ProfileImage({Key? key, required this.imageUrl, this.onImageSelected})
      : super(key: key);

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        print('_pickedImage:${_imageFile?.path}');
      });
    }
    if (widget.onImageSelected != null) {
      widget.onImageSelected!(_imageFile!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: _imageFile != null
                ? FileImage(File(_imageFile!.path))
                : widget.imageUrl != null
                    ? FileImage(File(widget.imageUrl))
                    : null,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 8.h),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt),
                              title: const Text('Take a picture'),
                              onTap: () {
                                _pickImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.image),
                              title: const Text('Choose from gallery'),
                              onTap: () {
                                _pickImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorManager.darkGrey,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: ColorManager.white,
                    ))),
          )
        ],
      ),
    );
  }
}
