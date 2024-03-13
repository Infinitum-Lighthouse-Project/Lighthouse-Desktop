part of lh.desktop.views;

class SprintPlanner1 extends StatefulWidget {
  final List<QueryDocumentSnapshot<Sprint>>? triagedSprints;
  final List<QueryDocumentSnapshot<Sprint>>? s3Sprints;
  final List<QueryDocumentSnapshot<Sprint>>? s4Sprints;

  const SprintPlanner1({
    this.triagedSprints,
    this.s3Sprints,
    this.s4Sprints,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => SprintPlanner1State();
}

class SprintPlanner1State extends State<SprintPlanner1> with ViewDataBinding {
  late final List<QueryDocumentSnapshot<Sprint>> triagedSprints;
  late final List<QueryDocumentSnapshot<Sprint>> s3Sprints;
  late final List<QueryDocumentSnapshot<Sprint>> s4Sprints;
  @override
  void initState() {
    addField((x) => triagedSprints = x, widget.triagedSprints,
        () async => const <QueryDocumentSnapshot<Sprint>>[]);
    addField((x) => s3Sprints = x, widget.s3Sprints,
        () async => const <QueryDocumentSnapshot<Sprint>>[]);
    addField((x) => s4Sprints = x, widget.s4Sprints,
        () async => const <QueryDocumentSnapshot<Sprint>>[]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LHVerticalShelf(
          header: 'Triaged',
          width: 352,
          height: 768,
          data: triagedSprints,
          generator: (doc) => LHSprintCard(doc: doc),
        ),
        const SizedBox(width: 32),
        LHVerticalShelf(
          header: 'Sprint S3',
          width: 352,
          height: 768,
          data: s3Sprints,
          generator: (doc) => LHSprintCard(doc: doc),
        ),
        const SizedBox(width: 32),
        LHVerticalShelf(
          header: 'Sprint S4',
          width: 352,
          height: 768,
          data: s4Sprints,
          generator: (doc) => LHSprintCard(doc: doc),
        ),
      ],
    ));
  }
}
