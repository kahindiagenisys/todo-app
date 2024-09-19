import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/enum.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/core/widgets/circle_container.dart';
import 'package:river_pod/features/create_task/view_models/category_view_model.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TaskCategories.values.toList();
    final selectedCategory = ref.watch(categoryViewModel);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            "Category",
            style: context.appTextTheme.titleLarge,
          ),
          10.width,
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (ctx, index) => 8.width,
              itemBuilder: (ctx, index) {
                final category = categories[index];
                final selected = category == selectedCategory;
                return InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    ref.read(categoryViewModel.notifier).state = category;
                  },
                  child: CircleContainer(
                    color: selected
                        ? context.colorScheme.primary.withOpacity(0.3)
                        : category.color.withOpacity(0.1),
                    child: Icon(
                      category.icon,
                      color: selected
                          ? context.colorScheme.primary
                          : category.color.withOpacity(0.3),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
