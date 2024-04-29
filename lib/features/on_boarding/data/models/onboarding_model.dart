import 'package:dalel/core/utils/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;
  const OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });

  static List<OnBoardingModel> onBoardingList = [
    const OnBoardingModel(
      image: Assets.onBoardingOne,
      title: "Explore The history with Dalel in a smart way",
      body:
          "Using our app’s history libraries you can find many historical periods",
    ),
    const OnBoardingModel(
      image: Assets.onBoardingTwo,
      title: "From every place on earth",
      body: "A big variety of ancient places from all over the world",
    ),
    const OnBoardingModel(
      image: Assets.onBoardingThree,
      title: "Using modern AI technology for better user experience",
      body:
          "AI provide recommendations and helps you to continue the search journey",
    ),
  ];
}
