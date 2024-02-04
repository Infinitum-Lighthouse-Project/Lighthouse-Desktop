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
    with InputFieldStyling<SingleSelectDropdownInputField>, Overlays {
  String selection = '';

  Widget overlayBuilder(BuildContext context) => SingleSelectMenu(buttons: [
        for (final item in widget.items)
          LHTextButton(
            text: item,
            callback: () {
              setState(() {
                selection = item;
              });
              removeOverlay();
            },
          ),
      ]);
  @override
  Widget build(BuildContext context) {
    return inputField(
      context,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          selection,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Mauve.s300(),
          ),
        ),
      ),
      iconButton: fieldIconButton(
        context,
        key: targetKey,
        onPressed: () {
          buildOverlayEntry(builder: overlayBuilder);
          showOverlay(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
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
    with InputFieldStyling<MultiSelectDropdownInputField>, Overlays {
  final List<String> selections = [];

  Widget overlayBuilder(BuildContext context) => SingleSelectMenu(buttons: [
        for (final item in widget.items)
          LHTextButton(
            text: item,
            preserveState: true,
            pressedByDefault: selections.contains(item),
            callback: () {
              setState(() {
                if (selections.contains(item)) {
                  selections.remove(item);
                } else {
                  selections.add(item);
                }
              });
            },
          ),
      ]);

  @override
  Widget build(BuildContext context) {
    return inputField(
      context,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          selections.join(', '),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Mauve.s300(),
          ),
        ),
      ),
      iconButton: fieldIconButton(
        context,
        key: targetKey,
        onPressed: () {
          buildOverlayEntry(builder: overlayBuilder);
          showOverlay(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }
}
