import 'package:flutter/material.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/features/filter/view_data/filter_data.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return const SizedBox();
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final filter = FilterData.filters[index];
        final outLineColor =
            filter["isSelected"] ? colors.primary : colors.onSecondary;
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: filter["isSelected"]
                  ? colors.onSecondary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: outLineColor, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2.5,
              ),
              child: Text(
                filter["title"],
                style: context.appTextTheme.titleMedium?.copyWith(
                  color: outLineColor,
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 8,
      ),
      itemCount: FilterData.filters.length,
    );
  }
}
