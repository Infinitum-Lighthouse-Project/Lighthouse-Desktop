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

class TextInputFieldController extends InputFieldController<TextInputField> {
  @override
  Widget inputWidget(BuildContext context) => TextField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: widget.inputType == InputType.text
            ? TextInputType.text
            : TextInputType.number,
        onEditingComplete: () => widget.callback?.call(controller.text),
      );
}
