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
    with InputFieldStyling<DateInputField>, Overlays {
  late final DateInputSelector dateInputSelector = DateInputSelector(
    callback: (dt) {
      setState(() {
        controller.text = dt.toIso8601String();
      });
      removeOverlay();
      performValidationChecks(dateParseabilityCheck);
    },
  );

  List<String> dateParseabilityCheck(String value) {
    final List<String> issues = [];
    final DateTime? parsedDt = DateTime.tryParse(controller.text);
    final String cleanedValue;
    if (parsedDt == null) {
      if (controller.text == 'tomorrow' || controller.text == 'tonight') {
        cleanedValue = (controller.text == 'tomorrow'
                ? DateTime.now().add(const Duration(days: 1))
                : DateTime.now().subtract(const Duration(days: 1)))
            .toIso8601String();
      } else {
        error = true;
        issues.add('Unrecognised date');
        cleanedValue = controller.text;
      }
    } else {
      cleanedValue = parsedDt.toIso8601String();
    }
    controller.text = cleanedValue;
    return issues;
  }

  @override
  Widget build(BuildContext context) {
    return inputField(
      context,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onEditingComplete: () {
          setState(() {
            performValidationChecks(dateParseabilityCheck);
            if (!error) moveFocusToNextField();
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
        key: targetKey,
        onPressed: () {
          buildOverlayEntry(builder: (_) => dateInputSelector);
          showOverlay(context);
        },
      ),
    );
  }
}

class DateInputSelector extends StatefulWidget {
  final void Function(DateTime) callback;
  const DateInputSelector({
    required this.callback,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => DateInputSelectorState();
}

class DateInputSelectorState extends State<DateInputSelector> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        onPressed: () {
          widget.callback(DateTime.now());
        },
      ),
    );
  }
}
