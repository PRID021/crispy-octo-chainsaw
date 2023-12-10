import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(BuildContext context)? onFilter;
  final bool showFilter;

  const CustomSearchBar({super.key, this.onFilter, this.showFilter = true});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.4),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/image/svg/Icon_search_active.svg",
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tỉnh thành tổ chức, ban nhạc"),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            if (showFilter)
              IconButton(
                onPressed: () {
                  onFilter?.call(context);
                },
                icon: SvgPicture.asset(
                  "assets/image/svg/Icon_filter_active.svg",
                  width: 24,
                  height: 24,
                ),
              )
            else
              const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
