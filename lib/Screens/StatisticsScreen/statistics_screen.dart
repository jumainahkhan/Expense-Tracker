import 'package:expense_tracker/Screens/StatisticsScreen/components/statistics_screen_body.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StatisticsScreenBody(),
    );
  }
}
