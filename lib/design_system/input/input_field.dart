part of lh.desktop.ds;

enum InputFieldState {
  active,
  hover,
  inactive,
  error,
}

abstract class InputField<C> extends StatefulWidget {
  final String inputLabel;
  final String? descriptor;
  final IconData iconData;
  final bool required;
  final double width;
  final C? callback;

  const InputField({
    required this.inputLabel,
    required this.width,
    required this.iconData,
    required this.required,
    this.descriptor,
    this.callback,
    super.key,
  });

  @override
  InputFieldController createState();
}

abstract class InputFieldController<T extends InputField> extends State<T> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  InputFieldState fieldState = InputFieldState.inactive;

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        fieldState = InputFieldState.active;
      } else {
        fieldState = InputFieldState.inactive;
      }
      setState(emptyCallback);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor;
    if (fieldState == InputFieldState.active) {
      borderColor = const Mauve.s100();
    } else if (fieldState == InputFieldState.error) {
      borderColor = Colors.red;
    } else {
      if (widget.required) {
        borderColor = const Mauve.s500();
      } else {
        borderColor = const Mauve.s800();
      }
    }

    return Center(
      child: SizedBox(
        width: widget.width,
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          children: [
            Text(widget.inputLabel),
            const SizedBox(height: 4),
            Container(
              width: widget.width,
              height: 33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Row(
                children: [
                  inputWidget(context),
                  const Spacer(),
                  Container(
                    width: 33,
                    height: 33,
                    color: const Mauve.s800(),
                    child: Center(
                      child: Icon(
                        widget.iconData,
                        size: 17,
                        color: const Mauve.s300(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (fieldState == InputFieldState.active) ...[
              const SizedBox(height: 4),
              if (widget.descriptor != null) Text(widget.descriptor!)
            ]
          ],
        ),
      ),
    );
  }

  Widget inputWidget(BuildContext context);
}
