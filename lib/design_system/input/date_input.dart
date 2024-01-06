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
  TextInputFieldController createState() => TextInputFieldController();
}

class DateInputFieldController extends InputFieldController<DateInputField> {
  @override
  Widget inputWidget(BuildContext context) => TextField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: TextInputType.datetime,
        onEditingComplete: () => widget.callback?.call(controller.text),
      );
}
