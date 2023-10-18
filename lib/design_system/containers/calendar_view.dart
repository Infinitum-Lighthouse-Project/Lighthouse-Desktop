part of lh.desktop.ds;

class LHCalendarView extends LHContainer {
  LHCalendarView({
    required super.width,
    required super.height,
  }) : super(
          header: 'This Week',
          child: const Center(
            child: Text(
              'Not implemented yet',
              style: TextStyle(
                color: Lavender.s500(),
                fontSize: 20,
              ),
            ),
          ),
        );
}
