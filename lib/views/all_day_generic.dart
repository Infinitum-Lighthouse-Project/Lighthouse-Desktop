part of lh.desktop.views;

class AllDayGeneric extends StatelessWidget {
  const AllDayGeneric({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LHVerticalShelf(
            header: 'Scheduled',
            width: 352,
            height: 768,
            children: List<LHTaskCard>.generate(
                10, (index) => LHTaskCard(task: task)),
          ),
          const SizedBox(width: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LHHorizontalShelf(
                header: 'Time Tracker',
                width: 848,
                height: 160,
                children: [LHTimerCard(), LHTimeTrackedCard()],
              ),
              const SizedBox(height: 32),
              LHCalendarView(
                width: 352,
                height: 576,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
