import 'dart:math';

List<int> rgbToHsv(double r, double g, double b) {
  r /= 255;
  g /= 255;
  b /= 255;

  int _max = max(
    r.toInt(),
    max(g, b).toInt(),
  );
  int _min = min(
    r.toInt(),
    max(g, b).toInt(),
  );
  int h = _max;
  int s = _max;
  int v = _max;

  int d = _max - _min;
  s = (_max == 0 ? 0 : d / _max).toInt();

  if (max == min) {
    h = 0; // achromatic
  } else {
    if (_max == r) {
      h = ((g - b) / d + (g < b ? 6 : 0)).toInt();
    } else if (_max == g) {
      h = ((b - r) / d + 2).toInt();
    } else if (_max == b) {
      h = ((r - g) / d + 4).toInt();
    }
  }

  h = (h~/6);

  return [h, s, v];
}

List<num> hsvToRgb(double h, double s, double v) {
  late int r, g, b;

  int i = (h * 6).floor();
  int f = (h * 6 - i).toInt();
  int p = (v * (1 - s)).toInt();
  int q = (v * (1 - f * s)).toInt();
  int t = (v * (1 - (1 - f) * s)).toInt();

  switch (i % 6) {
    case 0:
      r = v.toInt();
      g = t;
      b = p;
      break;
    case 1:
      r = q;
      g = v.toInt();
      b = p;
      break;
    case 2:
      r = p;
      g = v.toInt();
      b = t;
      break;
    case 3:
      r = p;
      g = q;
      b = v.toInt();
      break;
    case 4:
      r = t;
      g = p;
      b = v.toInt();
      break;
    case 5:
      r = v.toInt();
      g = p;
      b = q;
      break;
  }

  return [r * 255, g * 255, b * 255];
}
