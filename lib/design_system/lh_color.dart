part of lh.desktop.ds;

class LHColor extends Color {
  const LHColor(super.value);
}

class LHColorFamily extends LHColor {
  const LHColorFamily(super.value);
}

class Mauve extends LHColorFamily {
  const Mauve() : super(0xFF654697);

  const Mauve.s100() : super(0xFFA875FB);
  const Mauve.s200() : super(0xFF9769E2);
  const Mauve.s300() : super(0xFF865EC9);
  const Mauve.s400() : super(0xFF7652B0);
  const Mauve.s500() : super(0xFF654697);
  const Mauve.s600() : super(0xFF543B7E);
  const Mauve.s700() : super(0xFF432F64);
  const Mauve.s800() : super(0xFF32234B);
  const Mauve.s900() : super(0xFF221732);
  const Mauve.s1000() : super(0xFF110C19);
}

class Lavender extends LHColorFamily {
  const Lavender() : super(0xFF43228B);

  const Lavender.s100() : super(0xFF7038E8);
  const Lavender.s200() : super(0xFF6532D1);
  const Lavender.s300() : super(0xFF5A2DBA);
  const Lavender.s400() : super(0xFF4E27A2);
  const Lavender.s500() : super(0xFF43228B);
  const Lavender.s600() : super(0xFF381C74);
  const Lavender.s700() : super(0xFF2D165D);
  const Lavender.s800() : super(0xFF221146);
  const Lavender.s900() : super(0xFF160B2E);
  const Lavender.s1000() : super(0xFF0B0617);
}

class Meta extends LHColorFamily {
  const Meta(super.value);

  const Meta.hotPink() : super(0xFFD94084);
  const Meta.mangoOrange() : super(0xFFB57B00);
  const Meta.lushGreen() : super(0xFF2AB250);
  const Meta.lightBlue() : super(0xFF099BD7);
  const Meta.creamWhite() : super(0xFFFFF8DD);
  const Meta.grapePurple() : super(0xFFFFF8DD);
  const Meta.midnightBlue() : super(0xFF4F5D95);
}
