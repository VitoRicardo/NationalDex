import 'dart:ui';

class AppColor {
  static Color whiteBackground = const Color(0xfff3fcfb);
  static Color redBackground = const Color(0xffE8554F);
  static Color headTextDescription = const Color(0xffA3A8AD);
  static Color searchField = const Color(0xffEBF3F5);
  static Color filterIcon = const Color(0xff5C5F7A);

  static Map<String, Color> typeColor = {
    'normal': const Color(0xffAAAA99),
    'fire': const Color(0xffFF4422),
    'water': const Color(0xff3399FF),
    'electric': const Color(0xffFFCC33),
    'grass': const Color(0xff77CC55),
    'ice': const Color(0xff66CCFF),
    'fighting': const Color(0xffBB5544),
    'poison': const Color(0xffAA5599),
    'ground': const Color(0xffDDBB55),
    'flying': const Color(0xff8899FF),
    'psychic': const Color(0xffFF5599),
    'bug': const Color(0xffAABB22),
    'rock': const Color(0xffBBAA66),
    'ghost': const Color(0xff6666BB),
    'dragon': const Color(0xff7766EE),
    'dark': const Color(0xff775544),
    'steel': const Color(0xffAAAABB),
    'fairy': const Color(0xffEE99EE),
  };

  static Map<double, Color> colorWeakness = {
    0: const Color(0xff2E3436),
    0.25: const Color(0xffFF4422),
    0.5: const Color(0xffFFCC33),
    2: const Color(0xff77CC55),
    4: const Color(0xff3399FF)
  };

  static Color getColorStat(int stat) {
    if (stat <= 30) return const Color(0xffF34444);
    if (30 < stat && stat <= 60) return const Color(0xffFF7F0F);
    if (60 < stat && stat <= 90) return const Color(0xffFFDD57);
    if (90 < stat && stat <= 120) return const Color(0xffA0E515);
    if (120 < stat && stat <= 150) return const Color(0xff23CD5E);
    return const Color(0xff00C2B8);
  }
}
