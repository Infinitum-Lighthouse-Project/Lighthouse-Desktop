part of lh.desktop.ds;

class DateInputField extends InputField<void Function(String)> {
  const DateInputField({
    required super.inputLabel,
    required super.width,
    required super.iconData,
    required super.required,
    super.descriptor,
    super.callback,
    super.key,
  });

  @override
  DateInputFieldController createState() => DateInputFieldController();
}

class DateInputFieldController extends InputFieldController<DateInputField>
    with InputFieldStyling<DateInputField> {
  @override
  Widget build(BuildContext context) {
    return inputField(
      context,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onEditingComplete: () {
          final DateTime? parsedDt = DateTime.tryParse(controller.text);
          final String cleanedValue;
          if (parsedDt == null) {
            if (controller.text == 'tomorrow' || controller.text == 'tonight') {
              cleanedValue = controller.text;
            } else {
              fieldState = InputFieldState.error;
              moveFocusToNextField();
              return;
            }
          } else {
            cleanedValue = parsedDt.toIso8601String();
          }
          widget.callback?.call(cleanedValue);
          moveFocusToNextField();
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
            left: 4,
            right: 4,
            top: -15,
          ),
        ),
        cursorHeight: 18,
        cursorColor: const Mauve.s300(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Mauve.s300(),
        ),
      ),
      iconButton: fieldIconButton(
        context,
        onPressed: () {},
      ),
      helpText: widget.descriptor,
    );
  }
}
