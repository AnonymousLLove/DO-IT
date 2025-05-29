import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:do_it/config/constants.dart';

class MemberPickerWithPreview extends StatefulWidget {
  final String label;
  final void Function(String) onMemberAdded;

  const MemberPickerWithPreview({
    super.key,
    required this.label,
    required this.onMemberAdded,
  });

  @override
  State<MemberPickerWithPreview> createState() =>
      _MemberPickerWithPreviewState();
}

class _MemberPickerWithPreviewState extends State<MemberPickerWithPreview> {
  final List<File> _selectedImages = [];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _selectedImages.add(File(picked.path)));
      widget.onMemberAdded(picked.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: font,
                color: const Color.fromRGBO(177, 176, 176, 1),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                // Avatars area expands to fill until the button
                Expanded(
                  child: _selectedImages.isNotEmpty
                      ? SizedBox(
                          height: 30,
                          child: Stack(
                            children:
                                _selectedImages.asMap().entries.map((entry) {
                              final i = entry.key;
                              final file = entry.value;
                              return Positioned(
                                left: i * 20,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                  ),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundImage: FileImage(file),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),

                // Always at right edge
                IconButton(
                  icon: const Icon(Icons.add_circle, color: color, size: 30),
                  onPressed: _pickImage,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
