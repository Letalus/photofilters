import 'dart:io';

import 'package:image/image.dart';
import 'package:photofilters/filters/filters.dart';

void applyFilterOnFile(Filter filter, String src, String dest) {
  Image? image = decodeImage(File(src).readAsBytesSync());

  if(image==null)return;

  var pixels = image.getBytes();
  filter.apply(pixels, image.width, image.height);
  Image out = Image.fromBytes(image.width, image.height, pixels);
  final encodedNameImage = encodeNamedImage(out, dest);

  if(encodedNameImage!=null)return;

  File(dest).writeAsBytesSync(encodedNameImage!);
}
