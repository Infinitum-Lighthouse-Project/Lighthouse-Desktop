part of lh.desktop.ds;

class ViewScaffold extends StatefulWidget {
  final Widget child;
  const ViewScaffold({
    required this.child,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => ViewScaffoldState();
}

class ViewScaffoldState extends State<ViewScaffold> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Lavender.s1000(),
      child: Center(
        child: widget.child,
      ),
    );
  }
}
