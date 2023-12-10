// import 'package:flutter/material.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
//
// class ScrollPositionList extends StatefulWidget {
//   final List<Object> items;
//   final Widget Function(BuildContext context, int index) itemBuilder;
//
//   const ScrollPositionList({
//     super.key,
//     required this.items,
//     required this.itemBuilder,
//   });
//
//   @override
//   State<ScrollPositionList> createState() => _ScrollPositionListState();
// }
//
// class _ScrollPositionListState extends State<ScrollPositionList> {
//   /// Controller to scroll or jump to a particular item.
//   final ItemScrollController itemScrollController = ItemScrollController();
//
//   /// Controller to scroll a certain number of pixels relative to the current
//   /// scroll offset.
//   final ScrollOffsetController scrollOffsetController =
//       ScrollOffsetController();
//
//   /// Listener that reports the position of items when the list is scrolled.
//   final ItemPositionsListener itemPositionsListener =
//       ItemPositionsListener.create();
//
//   late final List<Object> items;
//
//   @override
//   void initState() {
//     super.initState();
//
//     items = widget.items;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         positionsView,
//         list(),
//       ],
//     );
//   }
//
//   Widget list() {
//     return ScrollablePositionedList.builder(
//       // shrinkWrap: true,
//       itemCount: items.length,
//       itemBuilder: widget.itemBuilder,
//       itemScrollController: itemScrollController,
//       itemPositionsListener: itemPositionsListener,
//       scrollOffsetController: scrollOffsetController,
//       scrollDirection: Axis.vertical,
//     );
//   }
//
//   Widget get positionsView => ValueListenableBuilder<Iterable<ItemPosition>>(
//         valueListenable: itemPositionsListener.itemPositions,
//         builder: (context, positions, child) {
//           int? min;
//           int? max;
//           if (positions.isNotEmpty) {
//             // Determine the first visible item by finding the item with the
//             // smallest trailing edge that is greater than 0.  i.e. the first
//             // item whose trailing edge in visible in the viewport.
//             min = positions
//                 .where((ItemPosition position) => position.itemTrailingEdge > 0)
//                 .reduce((ItemPosition min, ItemPosition position) =>
//                     position.itemTrailingEdge < min.itemTrailingEdge
//                         ? position
//                         : min)
//                 .index;
//             // Determine the last visible item by finding the item with the
//             // greatest leading edge that is less than 1.  i.e. the last
//             // item whose leading edge in visible in the viewport.
//             max = positions
//                 .where((ItemPosition position) => position.itemLeadingEdge < 1)
//                 .reduce((ItemPosition max, ItemPosition position) =>
//                     position.itemLeadingEdge > max.itemLeadingEdge
//                         ? position
//                         : max)
//                 .index;
//           }
//           return Row(
//             children: <Widget>[
//               Expanded(child: Text('First Item: ${min ?? ''}')),
//               Expanded(child: Text('Last Item: ${max ?? ''}')),
//             ],
//           );
//         },
//       );
// }
