import 'package:cherry_app/pages/calendar_page.dart';
import 'package:cherry_app/pages/save_page.dart';
import 'package:cherry_app/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(pageProvider); // 현재 페이지 상태를 읽어옵니다.

    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Navigation")),
      body: currentPage == 0 ? const SavePage() : const CalendarPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          ref.read(pageProvider.notifier).state = index; // 페이지 인덱스 업데이트
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "첫 번째"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "두 번째"),
        ],
      ),
    );
  }
}
