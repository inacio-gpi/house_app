import 'package:flutter/material.dart';
import 'package:house_app/lib.dart';

class CreateRulesDialog extends StatefulWidget {
  const CreateRulesDialog({
    Key? key,
    required this.titleDialog,
    this.rule,
  }) : super(key: key);
  final String titleDialog;
  final EntitiesEntity? rule;
  @override
  State<StatefulWidget> createState() => _CreateRulesDialogState();
}

class _CreateRulesDialogState extends State<CreateRulesDialog> {
  late TextEditingController _ruleNameInputController;
  @override
  void initState() {
    super.initState();
    _ruleNameInputController = TextEditingController(text: widget.rule?.name);
  }

  @override
  void dispose() {
    _ruleNameInputController.dispose();
    super.dispose();
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(
        context,
        EntitiesEntity(
          id: widget.rule?.id ?? 0,
          order: widget.rule?.order ?? 0,
          name: _ruleNameInputController.text,
          active: dropdownValue == 'Yes' ? 1 : 0,
        ));
  }

  final list = ['Yes', 'No'];

  String dropdownValue = 'Yes';

  @override
  Widget build(BuildContext context) => AlertDialog(
        titlePadding: const EdgeInsets.all(20),
        title: Text(widget.titleDialog),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _ruleNameInputController,
              decoration: const InputDecoration(
                hintText: 'Rule name',
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Is this rule active?',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: DropdownButton<String>(
                    alignment: Alignment.centerLeft,
                    value: dropdownValue,
                    isExpanded: true,
                    isDense: true,
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.keyboard_arrow_down_sharp),
                    ),
                    elevation: 8,
                    borderRadius: BorderRadius.circular(8),
                    underline: null,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list
                        .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        actions: [
          TextButton(
            onPressed: _cancel,
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Submit'),
          ),
        ],
      );
}
