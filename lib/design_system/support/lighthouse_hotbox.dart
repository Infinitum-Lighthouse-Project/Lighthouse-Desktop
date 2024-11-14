part of lh.desktop.ds;

class LighthouseHotbox<T> extends LighthouseStyledHotbox<T> {
  LighthouseHotbox({
    required super.width,
    required super.height,
    required super.hotboxData,
    required super.showReleaseToClickLine,
    super.onRTCReleased,
    super.onRTCChanged,
    super.key,
  }) : super(
          overlayBackgroundColor: Colors.black.withOpacity(0.4),
          piePrimaryColor: const Lavender.s600(),
          pieAccentColor: const Mauve.s300(),
          releaseToClickLineColor: const Mauve.s100(),
        );

  @override
  State<LighthouseStyledHotbox<T>> createState() => LighthouseHotboxState();
}

class LighthouseHotboxState<T> extends LighthouseStyledHotboxState<T> {
  @override
  Widget upperSector(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LHTextButton(
            text: 'Night View',
            callback: () => Navigator.of(context).pushNamed('/launch/night'),
          ),
          LHTextButton(
            text: 'Next Sprint Ready',
            callback: () =>
                Navigator.of(context).pushNamed('/launch/sprintready'),
          ),
          LHTextButton(
            text: 'Finalise Next Sprint',
            callback: () =>
                Navigator.of(context).pushNamed('/launch/sprintunready'),
          ),
          LHTextButton(
            text: 'Generic',
            callback: () => Navigator.of(context).pushNamed('/launch/generic'),
          ),
          LHTextButton(
            text: 'Triage',
            callback: () => Navigator.of(context).pushNamed('/launch/triage'),
          ),
          LHTextButton(
            text: 'Sprint Planner',
            callback: () =>
                Navigator.of(context).pushNamed('/tools/sprintplanner/1'),
          ),
          LHTextButton(
            text: 'Project Viewer',
            callback: () =>
                Navigator.of(context).pushNamed('/tools/projectviewer'),
          ),
          LHTextButton(
            text: 'Console',
            callback: () => Navigator.of(context).pushNamed('/console'),
          ),
        ],
      );
}
