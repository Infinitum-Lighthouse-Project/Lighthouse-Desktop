part of lh.desktop.views;

class HelmscriptConsoleView extends StatelessWidget {
  const HelmscriptConsoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Center(
        child: Container(
          width: 800,
          height: 800,
          color: Colors.black,
          child: AffogatoEditorInstance(
            languageBundle: helmscriptLB,
            themeBundle: helmscriptTB,
            editorConfigs: const AffogatoEditorConfigs(
              editorWidth: 800,
              editorHeight: 800,
              defaultTextStyle: TextStyle(
                fontFamily: 'IBMPlexMono',
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
