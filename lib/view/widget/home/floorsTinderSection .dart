import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:second/data/datasource/static/static.dart';
import 'package:second/view/widget/home/FloorCard.dart';

class FloorsTinderSection extends StatelessWidget {
  const FloorsTinderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Swiper(
        itemCount: floors.length,

        // 💥 أهم جزء (Tinder style)
        layout: SwiperLayout.TINDER,

        itemWidth: MediaQuery.of(context).size.width * 0.85,
        itemHeight: 240,

        // 🔥 Animation
        duration: 400,
        curve: Curves.easeOut,

        // 💣 Space + depth
        itemBuilder: (context, index) {
          return Transform.scale(
            scale: 0.95,
            child: FloorCard(floor: floors[index]),
          );
        },

        // 🎯 Control
        pagination: const SwiperPagination(),
        control: const SwiperControl(),

        // 🔄 optional auto swipe
        autoplay: false,
      ),
    );
  }
}
