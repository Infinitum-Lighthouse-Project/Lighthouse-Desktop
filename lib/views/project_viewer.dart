part of lh.desktop.views;

class ProjectViewer extends StatelessWidget {
  final List<DocumentSnapshot<Epic>> epicDocs;
  const ProjectViewer({
    required this.epicDocs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LHVerticalShelf(
          header: 'Epics',
          width: 352,
          height: 768,
          data: epicDocs,
          generator: (doc) => LHEpicCard(doc: doc),
        ),
        const SizedBox(width: 32),
        LHCalendarView(
          width: 848,
          height: 768,
        ),
      ],
    ));
  }
}
