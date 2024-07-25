import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header.dart';
import 'package:dalel/features/home/data/historical_model.dart';
import 'package:dalel/features/home/presentation/widgets/custome_category_list_view.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_widget.dart';
import 'package:dalel/features/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeAppBarSection extends StatelessWidget {
  const HomeAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeViewAppBar(),
        SizedBox(height: 32),
      ],
    );
  }
}

class HistoricalPeroidsSection extends StatelessWidget {
  const HistoricalPeroidsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(text: AppStrings.historicalPeriods),
        HistoricalPeriodsWidget(),
        SizedBox(height: 16),
      ],
    );
  }
}

class HistoricalCharacters extends StatelessWidget {
  const HistoricalCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeader(text: AppStrings.historicalCharacters),
        CustomCategoryListWidget(items: CustomeCategoryItemModel.items),
        const SizedBox(height: 16),
      ],
    );
  }
}

class HistoricalSouvenirs extends StatelessWidget {
  const HistoricalSouvenirs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeader(text: AppStrings.historicalSouvenirs),
        CustomCategoryListWidget(items: CustomeCategoryItemModel.items),
      ],
    );
  }
}
