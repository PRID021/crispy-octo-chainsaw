import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideSection extends StatelessWidget {
  const SlideSection({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController innerScrollController;
    const childCount = 100;
    ValueNotifier<double> percent = ValueNotifier(3 / 100);
    num total = 0.0;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        if (overscroll.leading) {
          overscroll.disallowIndicator();
        }
        return true;
      },
      child: NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sắp diễn ra",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("See all"),
                        )
                      ],
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 300,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [1, 2, 3, 4].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/image/png/Slide_${i}.png"),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.32),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(24),
                                      bottomRight: Radius.circular(24),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      DefaultTextStyle(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "24/3/2022 | 19:30 - 24:00 PM"),
                                            Text("Buc Tuong"),
                                            Text("Nha hat lon ha noi")
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("Dat ve"))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              floating: false,
              pinned: false,
              automaticallyImplyLeading: false,
              expandedHeight: 350,
            )
          ];
        },
        body: Builder(builder: (context) {
          innerScrollController = PrimaryScrollController.of(context);
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              final extentAfter =
                  notification.metrics.extentAfter.clamp(0, double.infinity);
              final extentBefore =
                  notification.metrics.extentBefore.clamp(0, double.infinity);
              final extentInside =
                  notification.metrics.extentInside.clamp(0, double.infinity);
              total = (extentAfter + extentBefore + extentInside);

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                percent.value =
                    ((extentBefore + extentInside) / total).clamp(0, 1);
              });
              return false;
            },
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 64,
                    maxHeight: 64.0,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: ListenableBuilder(
                              listenable: percent,
                              builder: (context, _) {
                                return SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 0.0,
                                    ),
                                  ),
                                  child: Slider(
                                    value: percent.value,
                                    onChanged: (value) {
                                      innerScrollController.animateTo(
                                          value * (total),
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.ease);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return SizedBox(
                        height: 56,
                        child: ListTile(
                          title: Text('List Tile $index'),
                        ),
                      );
                    },
                    childCount: childCount,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
