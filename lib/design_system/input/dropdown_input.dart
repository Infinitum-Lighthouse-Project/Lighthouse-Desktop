part of lh.desktop.ds;

class SingleSelectDropdownInputField extends InputField<void Function(String)> {
  final List<String> items;

  const SingleSelectDropdownInputField({
    required this.items,
    required super.inputLabel,
    required super.width,
    required super.iconData,
    required super.required,
    super.descriptor,
    super.callback,
    super.key,
  });

  @override
  SingleSelectDropdownInputFieldController createState() =>
      SingleSelectDropdownInputFieldController();
}

class SingleSelectDropdownInputFieldController
    extends InputFieldController<SingleSelectDropdownInputField>
    with InputFieldStyling<SingleSelectDropdownInputField> {
  String selection = '';

  @override
  Widget build(BuildContext context) {
    return inputField(
      context,
      child: Text(widget.items
          .join()) /* DropdownButtonFormField<String>(
        items: [
          for (final item in widget.items) DropdownMenuItem(child: Text(item))
        ],
        onChanged: (newValue) => widget.callback?.call(selection),
      ); */
      ,
      iconButton: fieldIconButton(context),
    );
  }
}

class MultiSelectDropdownInputField
    extends InputField<void Function(List<String>)> {
  final List<String> items;

  const MultiSelectDropdownInputField({
    required this.items,
    required super.inputLabel,
    required super.width,
    required super.iconData,
    required super.required,
    super.descriptor,
    super.callback,
    super.key,
  });

  @override
  MultiSelectDropdownInputFieldController createState() =>
      MultiSelectDropdownInputFieldController();
}

class MultiSelectDropdownInputFieldController
    extends InputFieldController<MultiSelectDropdownInputField>
    with InputFieldStyling<MultiSelectDropdownInputField> {
  final List<String> selections = [];

  @override
  Widget build(BuildContext context) {
    return inputField(
      context,
      child: Text(widget.items
          .join()) /* DropdownButtonFormField<String>(
        items: [
          for (final item in widget.items) DropdownMenuItem(child: Text(item))
        ],
        onChanged: (newValue) => widget.callback?.call(selections),
      ); */
      ,
      iconButton: fieldIconButton(context),
    );
  }
}
