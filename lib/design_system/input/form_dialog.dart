part of lh.desktop.ds;

class FormDialog<T extends SchemaObject> extends StatefulWidget {
  final T schemaObject;
  final void Function(T) resultHandler;

  const FormDialog({
    required this.schemaObject,
    required this.resultHandler,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => FormDialogState();
}

class FormDialogState<T extends SchemaObject> extends State<FormDialog<T>> {
  late final T schemaObject = widget.schemaObject;
  final LHComponentProvider componentProvider = LHComponentProvider(width: 800);

  @override
  Widget build(BuildContext context) {
    final List<Widget> inputFields = [];
    for (FormProperty fp in schemaObject.properties.whereType<FormProperty>()) {
      inputFields.add(fp.createComponent(componentProvider));
      inputFields.add(const SizedBox(height: 20));
    }
    inputFields.add(LHTextButton(
      text: 'Done',
      callback: () => widget.resultHandler(schemaObject),
    ));
    return Material(
      child: Center(
        child: Container(
          width: 400,
          height: 600,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  children: inputFields,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
