part of lh.desktop.views;

class HelmscriptConsoleView extends StatelessWidget {
  const HelmscriptConsoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        height: 800,
        color: Colors.black,
        child: AffogatoEditor(
          width: 800,
          height: 800,
          editorConfigs: const AffogatoEditorConfigs(
            defaultTextStyle: TextStyle(
              fontFamily: 'IBMPlexMono',
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
