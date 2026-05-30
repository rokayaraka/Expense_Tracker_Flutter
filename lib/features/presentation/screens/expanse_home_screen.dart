import 'package:expanse_tracker_app/core/constants/app_colors.dart';
import 'package:expanse_tracker_app/features/presentation/controller/expanse_controller.dart';
import 'package:expanse_tracker_app/features/presentation/widgets/expanse_list.dart';
import 'package:expanse_tracker_app/features/presentation/widgets/new_expanse.dart';
import 'package:flutter/material.dart';

class ExpanseHomeScreen extends StatefulWidget {
  const ExpanseHomeScreen({super.key});

  @override
  State<ExpanseHomeScreen> createState() => _ExpanseHomeScreenState();
}

class _ExpanseHomeScreenState extends State<ExpanseHomeScreen> {
  final controller = ExpanseController();
  @override
  void initState() {
    super.initState();
    controller.loadExpanses();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
         // backgroundColor: Colors.white54,
          appBar: AppBar(
            backgroundColor: AppColors.appBackGroundColor,
            title: Text("Expense Tracker",
            style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: addExpanseOverlay, icon: Icon(Icons.add,color: Colors.white,)),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ExpanseList(
                  expanses: controller.expanses,
                  removeExpanse: controller.deleteExpanse,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void addExpanseOverlay() {
    showModalBottomSheet(
      backgroundColor: Colors.blue.shade100,
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => NewExpanse(addExpanse: controller.addExpanses),
    );
  }
}
