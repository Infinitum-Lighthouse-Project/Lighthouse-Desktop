part of lh.desktop.ds;

class LHComponentProvider extends ComponentProvider {
  final double width;

  LHComponentProvider({
    required this.width,
  });

  @override
  Widget textField(
    TextProperty property,
    void Function(String p1) editingCompleteCallback,
  ) {
    return TextInputField(
      inputLabel: property.label,
      width: width,
      inputType: InputType.text,
      iconData: Icons.text_fields,
      required: property.strictlyRequired,
      callback: editingCompleteCallback,
    );
  }

  @override
  Widget numberField(
    NumProperty<dynamic, num?> property,
    void Function(String p1) editingCompleteCallback,
  ) {
    return TextInputField(
      inputLabel: property.label,
      width: width,
      inputType: InputType.number,
      iconData: Icons.numbers,
      required: property.strictlyRequired,
      callback: editingCompleteCallback,
    );
  }

  @override
  Widget datePicker(
    DateTimeProperty property,
    void Function(String p1) dtString,
  ) {
    return DateInputField(
      inputLabel: property.label,
      width: width,
      iconData: Icons.today,
      required: property.strictlyRequired,
      callback: dtString,
    );
  }

  @override
  Widget singleDropdown<T>(
    SingleSelectProperty<T> property,
    void Function(String) selection,
  ) {
    return SingleSelectDropdownInputField(
      inputLabel: property.label,
      items: property.options
          .listOf<String>((item) => property.convertToStorable(item)),
      width: width,
      iconData: Icons.keyboard_arrow_down,
      required: property.strictlyRequired,
      callback: selection,
    );
  }

  @override
  Widget multiDropdown<T>(
    MultiSelectProperty<T> property,
    void Function(List<String>) selections,
  ) {
    return MultiSelectDropdownInputField(
      inputLabel: property.label,
      width: width,
      items: property.convertToStorable(property.options),
      iconData: Icons.format_list_bulleted,
      required: property.strictlyRequired,
      callback: selections,
    );
  }

  @override
  Widget expandableSection(
      ExpandableProperty property, List<FormProperty> properties) {
    // TODO: implement expandableSection
    throw UnimplementedError();
  }
}
