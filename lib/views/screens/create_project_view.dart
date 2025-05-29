import 'package:do_it/controllers/create_project_controller.dart';
import 'package:do_it/views/widgets/bottom_nav.dart';
import 'package:do_it/views/widgets/date_field.dart';
import 'package:do_it/views/widgets/member_picker_field.dart';
import 'package:do_it/views/widgets/submit_button.dart';
import 'package:do_it/views/widgets/tags_field.dart';
import 'package:do_it/views/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class CreateProjectView extends StatefulWidget {
  @override
  _CreateProjectViewState createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
  final _ctrl = CreateProjectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: const Text(
          'Create Project',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for project avatar
            CircleAvatar(radius: 30, backgroundColor: Colors.grey[300]),
            const SizedBox(height: 8),
            TextInputField(
              label: 'Project Name',
              onChanged: (v) => _ctrl.setName(v),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DateField(
                    label: 'Created (from)',
                    onDateSelected: (d) => _ctrl.setStartDate(d),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DateField(
                    label: 'End (to)',
                    onDateSelected: (d) => _ctrl.setEndDate(d),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            MemberPickerField(
              label: 'Assign to',
              onMemberAdded: (id) {
                setState(() => _ctrl.addMember(id));
              },
            ),
            const SizedBox(height: 16),
            TagsField(
              label: 'Tags',
              onTagAdded: (tag) {
                setState(() => _ctrl.addTag(tag));
              },
            ),
            const SizedBox(height: 16),
            TextInputField(
              label: 'Description',
              maxLines: 5,
              onChanged: (v) => _ctrl.setDescription(v),
            ),
            const SizedBox(height: 24),
            SubmitButton(
              text: 'Create Project',
              onPressed: () {
                try {
                  //  _ctrl.submit();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Project created!')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
