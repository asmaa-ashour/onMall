import 'package:flutter/material.dart';
import 'package:second/data/datasource/static/static.dart';
import 'package:second/view/widget/home/FloorCard%20.dart';

class FloorsSection extends StatefulWidget {
  const FloorsSection({super.key});

  @override
  State<FloorsSection> createState() => _FloorsSectionState();
}

class _FloorsSectionState extends State<FloorsSection> {
  PageController controller = PageController(viewportFraction: 0.75);

  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // نفس ارتفاع الكارد
      child: PageView.builder(
        controller: controller,
        itemCount: floors.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          // الفرق بين الكارد الحالي و الـ page
          double difference = currentPage - index;

          // Scale للكارد الحالي
          double scale = (1 - difference.abs() * 0.15).clamp(0.85, 1.0);

          // TranslateY للكارد الحالي
          double translateY = 30 * difference.abs();

          return Center(
            child: Transform.translate(
              offset: Offset(0, translateY),
              child: Transform.scale(
                scale: scale,
                child: FloorCard(floor: floors[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
