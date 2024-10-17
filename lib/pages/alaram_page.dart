import 'package:flutter/material.dart';
import 'package:cherry_app/utilities/local_notifications.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('알람 테스트'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                LocalNotifications.showSimpleNotification(
                  title: '간단한 알림',
                  body: '이것은 테스트 알림입니다.',
                  payload: '테스트 페이로드',
                );
              },
              child: const Text('간단한 알림 보내기'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final now = DateTime.now();
                final scheduledTime = now.add(const Duration(seconds: 5));
                LocalNotifications.showTimerNotification(
                  title: '예약된 알림',
                  body: '이 알림은 5초 후에 표시됩니다.',
                  payload: '예약된 알림 페이로드',
                  scheduledDateTime: scheduledTime,
                );
              },
              child: const Text('5초 후 알림 예약하기'),
            ),
          ],
        ),
      ),
    );
  }
}
