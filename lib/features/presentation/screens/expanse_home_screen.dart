import 'package:expanse_tracker_app/core/constants/app_colors.dart';
import 'package:expanse_tracker_app/application/services/auth_services.dart';
import 'package:expanse_tracker_app/features/presentation/controller/expanse_controller.dart';
import 'package:expanse_tracker_app/features/presentation/screens/splash_screen.dart';
import 'package:expanse_tracker_app/features/presentation/widgets/chart.dart';
import 'package:expanse_tracker_app/features/presentation/widgets/expanse_list.dart';
import 'package:expanse_tracker_app/features/presentation/widgets/new_expanse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            title: Text(
              "Expense Tracker",
              style: GoogleFonts.merriweather(color: Colors.white,
              fontWeight: FontWeight.w900,

              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: _onTapLogOut,
                icon: Icon(Icons.logout_outlined, color: Colors.white),
              ),
            ],
          ),
          body: Column(
            children: [
              Chart(expanses: controller.expanses),
              
              Expanded(
                child: ExpanseList(
                  expanses: controller.expanses,
                  removeExpanse: controller.deleteExpanse,
                  editExpanse: controller.updateExpanse,
                ),
              ),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed:addExpanseOverlay,
            backgroundColor: Colors.blue.shade800,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(30),
            ),
            child: Icon(Icons.add, size: 23),
          ),
        );
      },
    );
  }

  void _onTapLogOut() async {
    await AuthServices.signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
      (route) => false,
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
