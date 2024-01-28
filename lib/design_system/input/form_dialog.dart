part of lh.desktop.ds;

class FormDialog<T extends SchemaObject> extends StatefulWidget {
  final T schemaObject;

  const FormDialog({
    required this.schemaObject,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => FormDialogState();
}

class FormDialogState extends State<FormDialog> {
  final LHComponentProvider componentProvider = LHComponentProvider(width: 800);

  @override
  Widget build(BuildContext context) {
    final List<Widget> inputFields = [];
    for (FormProperty fp
        in widget.schemaObject.properties.whereType<FormProperty>()) {
      inputFields.add(fp.createComponent(componentProvider));
      inputFields.add(const SizedBox(height: 20));
    }
    return Material(
      child: Center(
        child: Container(
          width: 800,
          height: 600,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SingleChildScrollView(
              child: Column(
                children: inputFields,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
