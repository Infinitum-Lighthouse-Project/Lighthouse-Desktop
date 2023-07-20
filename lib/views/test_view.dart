part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LHIconButton(
            iconData: Icons.inbox,
            callback: () {},
          ),
          const SizedBox(width: 30),
          LHTextButton(
            text: 'Mail',
            callback: () {},
          ),
          const SizedBox(width: 30),
          LHIcoTextButton(
            callback: () {},
            iconData: Icons.access_alarm_outlined,
            text: 'Mail',
            fixedHeight: 30,
          ),
        ],
      ),
    );
  }
}
