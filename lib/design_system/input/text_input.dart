part of lh.desktop.ds;

enum InputType {
  text,
  number,
}

class TextInputField extends InputField<void Function(String)> {
  final InputType inputType;

  const TextInputField({
    required this.inputType,
    required super.inputLabel,
    required super.width,
    required super.iconData,
    required super.required,
    super.descriptor,
    super.callback,
    super.key,
  });

  @override
  TextInputFieldController createState() => TextInputFieldController();
}

class TextInputFieldController extends InputFieldController<TextInputField>
    with InputFieldStyling<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return inputField(
      context,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: widget.inputType == InputType.text
            ? TextInputType.text
            : TextInputType.number,
        onEditingComplete: () {
          widget.callback?.call(controller.text);
          setState(() {
            moveFocusToNextField();
          });
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
