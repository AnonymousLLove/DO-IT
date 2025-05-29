import 'package:do_it/config/constants.dart';
import 'package:do_it/views/widgets/tags_field.dart';
import 'package:flutter/material.dart';

class ChevronClipper extends CustomClipper<Path> {
  @override
  @override
  Path getClip(Size size) {
    final w = size.width, h = size.height;
    const pointDepth = 18.0;

    return Path()
      ..moveTo(0, 0)
      ..lineTo(w - pointDepth, 0)
      ..lineTo(w, h / 2)
      ..lineTo(w - pointDepth, h)
      ..lineTo(0, h)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TagsFieldWithPopup extends StatefulWidget {
  final String label;

  final void Function(String text, Color color) onTagAdded;

  const TagsFieldWithPopup({
    super.key,
    required this.label,
    required this.onTagAdded,
  });

  @override
  State<TagsFieldWithPopup> createState() => _TagsFieldWithPopupState();
}

class _TagsFieldWithPopupState extends State<TagsFieldWithPopup> {
  final List<Tag> _tags = [];

  Future<void> _showAddTagDialog() async {
    String newTag = '';
    Color selectedColor = Colors.lightGreenAccent;

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        title:
            Text('Add a Tag', style: TextStyle(fontFamily: font, fontSize: 12)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: 'Enter tag'),
              onChanged: (v) => newTag = v.trim(),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ColorChoice(
                  color: const Color.fromRGBO(0, 154, 73, 1),
                  selected: selectedColor == Colors.lightGreenAccent,
                  onTap: () => selectedColor = Colors.lightGreenAccent,
                ),
                _ColorChoice(
                  color: const Color.fromRGBO(255, 229, 190, 1),
                  selected: selectedColor == Colors.pinkAccent,
                  onTap: () => selectedColor = Colors.pinkAccent,
                ),
                _ColorChoice(
                  color: const Color.fromRGBO(192, 226, 255, 1),
                  selected: selectedColor == Colors.lightBlueAccent,
                  onTap: () => selectedColor = Colors.lightBlueAccent,
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('CANCEL',
                style: TextStyle(fontFamily: font, color: color, fontSize: 12)),
          ),
          ElevatedButton(
            onPressed: () {
              if (newTag.isNotEmpty) {
                Navigator.of(ctx).pop();
                final tag = Tag(newTag, selectedColor);
                setState(() => _tags.add(tag));
                widget.onTagAdded(tag.label, tag.color);
              }
            },
            child: Text('OK',
                style: TextStyle(fontFamily: font, fontSize: 12, color: color)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color.fromRGBO(177, 176, 176, 1),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              // Wrap the tag list in a scrollable container
              Expanded(
                child: _tags.isNotEmpty
                    ? SizedBox(
                        height: 30,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _tags.map((t) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child:
                                    CustomTag(label: t.label, color: t.color),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              // Fixed plus icon
              IconButton(
                icon: const Icon(Icons.add_circle, color: color, size: 30),
                onPressed: _showAddTagDialog,
              ),
            ],
          ),
        ],
      )
    ]);
  }
}

class _ColorChoice extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _ColorChoice({
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
