part of lh.desktop.views;

class ProjectViewer extends StatelessWidget {
  const ProjectViewer({super.key});

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
          children: List<LHEpicCard>.generate(
              10, (index) => LHEpicCard(epic: epic)),
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
