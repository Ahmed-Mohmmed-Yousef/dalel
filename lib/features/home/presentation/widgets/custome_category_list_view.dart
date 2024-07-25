import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/data/historical_model.dart';
import 'package:flutter/material.dart';

class CustomCategoryListWidget extends StatelessWidget {
  final List<CustomeCategoryItemModel> items;
  const CustomCategoryListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) =>
            CustomCategoryListViewItem(model: items[index]),
      ),
    );
  }
}

class CustomCategoryListViewItem extends StatelessWidget {
  final CustomeCategoryItemModel model;
  const CustomCategoryListViewItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 133,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            offset: const Offset(2, 6),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: AssetImage(model.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              model.name,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppins500style14,
            ),
          ),
        ],
      ),
    );
  }
}
