import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider<String>((ref) {
  return "Hello";
});