part of lh.desktop.ds;

class LHFontWeight {
  static const FontWeight extraLight = FontWeight.w100;
  static const FontWeight light = FontWeight.w200;
  static const FontWeight regular = FontWeight.w300;
  static const FontWeight medium = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w500;
  static const FontWeight bold = FontWeight.w600;
  static const FontWeight extraBold = FontWeight.w700;
  static const FontWeight black = FontWeight.w800;
}

class LHType {
  static const TextStyle panelHeader_1 = TextStyle(
    color: Lavender.s500(),
    fontSize: LHDesignSystem.fontScaleFactor * 28,
    fontWeight: LHFontWeight.extraBold,
    height: LHDesignSystem.fontScaleFactor * 1.1,
  );

  static const TextStyle cardHeader_1 = TextStyle(
    color: Mauve.s100(),
    fontSize: LHDesignSystem.fontScaleFactor * 24,
    fontWeight: LHFontWeight.extraBold,
    //backgroundColor: Colors.red,
    height: LHDesignSystem.fontScaleFactor * 1.1,
  );

  static const TextStyle cardBody_1 = TextStyle(
    color: Mauve.s300(),
    fontSize: LHDesignSystem.fontScaleFactor * 16,
    fontWeight: LHFontWeight.regular,
    height: LHDesignSystem.fontScaleFactor * 1.2,
  );

  static TextStyle meta_3(Color color) => TextStyle(
        color: color,
        fontSize: LHDesignSystem.fontScaleFactor * 14,
        fontWeight: LHFontWeight.bold,
        height: LHDesignSystem.fontScaleFactor * 1,
      );
}
