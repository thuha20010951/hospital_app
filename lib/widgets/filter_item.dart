import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(
      {super.key,
      required this.filterText,
      required this.isFirstItem,
      required this.isActive,
      required this.changeFilterText});
  final String filterText;
  final bool isFirstItem;
  final bool isActive;
  final VoidCallback changeFilterText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeFilterText,
      child: Container(
        constraints: BoxConstraints(minWidth: 100),
        margin: isFirstItem
            ? const EdgeInsets.only(left: 20, right: 10)
            : const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isActive ? Color(0xFF0D124C) : Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400.withOpacity(0.55),
                spreadRadius: .5,
                blurRadius: .5,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(18)),
        child: Text(
          filterText,
          style: TextStyle(color: isActive ? Colors.white : Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
