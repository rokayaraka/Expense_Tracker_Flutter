import 'package:expanse_tracker_app/core/constants/app_strings.dart';

class PageViewModel {
  final String image;
  final String title;
  final String subtitle;

  PageViewModel({required this.image, required this.title, required this.subtitle,});

  
}

List<PageViewModel> pageViewList=[
PageViewModel(
  image: "assets/imageOne.webp", 
  title: AppStrings.iconOneTitle, 
  subtitle: AppStrings.iconOneSubTitle,
  ),
  PageViewModel(
  image: "assets/LOGO2.webp", 
  title: AppStrings.iconTwoTitle, 
  subtitle: AppStrings.iconTwoSubTitle,
  ),
  PageViewModel(
  image: "assets/imageThree.webp", 
  title: AppStrings.iconThreeTitle, 
  subtitle: AppStrings.iconThreeSubTitle,
  ),

];