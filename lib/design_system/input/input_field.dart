part of lh.desktop.ds;

enum InputFieldState {
  active,
  hover,
  inactive,
  error,
}

mixin InputFieldStyling<T extends InputField> on InputFieldController<T> {
  Widget fieldIconButton(
    BuildContext context, {
    void Function()? onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 33,
        height: 33,
        decoration: const BoxDecoration(
          color: Mauve.s800(),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
        child: Center(
          child: Icon(
            widget.iconData,
            size: 17,
            color: const Mauve.s300(),
          ),
        ),
      ),
    );
  }

  Widget inputField(
    BuildContext context, {
    required Widget child,
    required Widget iconButton,
    required String? helpText,
  }) {
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
        height:
            61 /* +
            (fieldState == InputFieldState.active && widget.descriptor != null
                ? 11
                : 0) */
        ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.inputLabel,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Mauve.s300(),
                fontStyle: FontStyle.italic,
              ),
            ),
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
                  Expanded(
                    child: child,
                  ),
                  const SizedBox(width: 12),
                  iconButton,
                ],
              ),
            ),
            if (fieldState == InputFieldState.active) ...[
              const SizedBox(height: 4),
              if (helpText != null) Text(helpText),
            ]
          ],
        ),
      ),
    );
  }
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

  void moveFocusToNextField() => focusNode.nextFocus();

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
}
