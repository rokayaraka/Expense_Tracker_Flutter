import 'package:expanse_tracker_app/core/constants/app_colors.dart';
import 'package:expanse_tracker_app/features/data/models/page_view_model.dart';
import 'package:expanse_tracker_app/features/presentation/screens/auth%20screens/sign_in_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: pageViewList.length,
          onPageChanged: (value) {
            currentIndex = value;
            setState(() {});
          },
          itemBuilder: (context, index) {
            final item = pageViewList[index];
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.splashScrContainerColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index != pageViewList.length - 1)
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: _goToLastPage,
                            child: Text(
                              "Skip",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      SizedBox(height: 40),
                      Center(
                        child: SizedBox(
                          height: 220,
                          child: Image.asset(
                            item.image,
                            fit: BoxFit.cover,
                            height: 220,
                          ),
                        ),
                      ),
                     
                      SizedBox(height: 60,),
                      Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        item.subtitle,
                        style: TextStyle(
                          color: AppColors.subTitleColor,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
            
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          pageViewList.length,
                          (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.only(right: 8),
                            height: 6,
                            width: currentIndex == index ? 45 : 25,
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? const Color(0xFFFF9B71)
                                  : Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      //SizedBox(height: 50),
                      if (index == pageViewList.length - 1)
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade800,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(30),
                              ),
                            ),
                            onPressed: _onTapGetStartedButton,
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onTapGetStartedButton(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SigninPage()), (predicate)=>false);
  }
  void _goToLastPage() {
    _controller.animateToPage(
      pageViewList.length - 1,
      duration: Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }
}
