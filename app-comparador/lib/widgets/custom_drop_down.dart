import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final MultiSelectController<String> _controller = MultiSelectController();
  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown(
      //showClearIcon: true,
      controller: _controller,
      onOptionSelected: (options) {
        debugPrint(options.toString());
      },
      options: const <ValueItem>[
        ValueItem(label: 'Option 1', value: '1'),
        ValueItem(label: 'Option 2', value: '2'),
        ValueItem(label: 'Option 3', value: '3'),
        ValueItem(label: 'Option 4', value: '4'),
        ValueItem(label: 'Option 5', value: '5'),
        ValueItem(label: 'Option 6', value: '6'),
      ],
      maxItems: 2,
      disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
      selectionType: SelectionType.multi,
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      dropdownHeight: 300,
      optionTextStyle: const TextStyle(fontSize: 16),
      selectedOptionIcon: const Icon(Icons.check_circle),
    );
  }
}
