import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProvider = StateProvider<int>((ref) => 0); // 초기 페이지 인덱스 0