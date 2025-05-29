import 'dart:io';

import 'package:do_it/config/constants.dart';
import 'package:do_it/controllers/create_project_controller.dart';
import 'package:do_it/views/widgets/bottom_nav.dart';
import 'package:do_it/views/widgets/custom_button.dart';
import 'package:do_it/views/widgets/custom_tag.dart';
import 'package:do_it/views/widgets/date_field.dart';
import 'package:do_it/views/widgets/description_text_field.dart';
import 'package:do_it/views/widgets/member_picker_field.dart';

import 'package:do_it/views/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateProjectView extends StatefulWidget {
  const CreateProjectView({super.key});

  @override
  _CreateProjectViewState createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
  final _ctrl = CreateProjectController();

  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus(); // hide keyboard
                  Future.delayed(const Duration(milliseconds: 100), () {
                    if (mounted)
                      Navigator.pop(context); // wait for keyboard to close
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(248, 248, 248, 1),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Color.fromRGBO(
                        18,
                        24,
                        38,
                        1,
                      ), // Change icon color as needed
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Create Project",
                style: TextStyle(
                  fontFamily: font,
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? const Icon(Icons.camera_alt, color: Colors.white)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Project Name',
                          style: TextStyle(
                            fontFamily: font,
                            color: const Color.fromRGBO(177, 176, 176, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextInputField(
                          label: 'Project Name',
                          onChanged: (v) => _ctrl.setName(v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created (from)',
                          style: TextStyle(
                            fontFamily: font,
                            color: const Color.fromRGBO(177, 176, 176, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        DateField(
                          onDateSelected: (d) => _ctrl.setStartDate(d),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End (to)',
                          style: TextStyle(
                            fontFamily: font,
                            color: const Color.fromRGBO(177, 176, 176, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        DateField(
                          onDateSelected: (d) => _ctrl.setEndDate(d),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              InputDecorator(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(177, 176, 176, 1)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(177, 176, 176, 1)),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(177, 176, 176, 1)),
                  ),
                ),
                child: MemberPickerWithPreview(
                  label: 'Add Staffs:',
                  onMemberAdded: (id) {
                    _ctrl.addMember(id);
                  },
                ),
              ),
              const SizedBox(height: 16),
              InputDecorator(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(177, 176, 176, 1)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(177, 176, 176, 1)),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(177, 176, 176, 1)),
                  ),
                ),
                child: TagsFieldWithPopup(
                  label: 'Tags:',
                  onTagAdded: (text, color) {
                    // e.g. store in your controller:
                    _ctrl.addTag(text); // you also have `color` if you need it
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Description:",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: font,
                  color: const Color.fromRGBO(177, 176, 176, 1),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              const DescriptionTextField(),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Create Project',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Project created!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
