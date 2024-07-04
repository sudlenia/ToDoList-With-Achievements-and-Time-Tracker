import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/models/achievement/achievement.dart';
import 'package:gap/gap.dart';

class AchievementWidget extends StatelessWidget {
  final bool isUnlocked;
  final Achievement achievement;
  const AchievementWidget(
      {super.key, required this.achievement, required this.isUnlocked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          decoration: BoxDecoration(
            color: isUnlocked ? Colors.white : const Color.fromRGBO(176, 176, 176, 1),
            border: Border.all(color: isUnlocked ? Colors.grey : Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 6,
                offset: Offset(6, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(achievement.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(achievement.description)
                  ],
                ),
                isUnlocked
                    ? const Gap(0)
                    : Image.asset(
                        "assets/images/locker.png",
                        height: 30,
                        width: 30)
              ],
            ),
          )),
    );
  }
}
