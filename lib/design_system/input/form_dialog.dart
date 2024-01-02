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
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          width: 800,
          height: 600,
          color: Colors.red,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
