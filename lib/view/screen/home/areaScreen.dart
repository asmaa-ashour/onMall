import 'package:flutter/material.dart';
import 'package:second/view/widget/home/categoryCard.dart';

class AreaScreen extends StatelessWidget {
  const AreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categories title with gradient
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'Area’s',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // List of categories
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    AreaCard(
                      name: 'Home Furniture',
                      imageUrl:
                          'https://images.unsplash.com/photo-1556228453-efd6c1ff04f6?w=400',
                      isImageLeft: true,
                      gradientColors: [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
                    ),
                    SizedBox(height: 16),
                    AreaCard(
                      name: 'Office Furniture',
                      imageUrl:
                          'https://images.unsplash.com/photo-1583846783214-7229a91b20ed?w=400',
                      isImageLeft: false,
                      gradientColors: [Color(0xFFE0F2FE), Color(0xFFBAE6FD)],
                    ),
                    SizedBox(height: 16),
                    AreaCard(
                      name: 'Home Decoration',
                      imageUrl:
                          'https://images.unsplash.com/photo-1513519245088-0e12902e35a5?w=400',
                      isImageLeft: true,
                      gradientColors: [Color(0xFFFCE4EC), Color(0xFFF8BBD9)],
                    ),
                    SizedBox(height: 16),
                    AreaCard(
                      name: 'Storage',
                      imageUrl:
                          'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=400',
                      isImageLeft: false,
                      gradientColors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                    ),
                    SizedBox(height: 16),
                    AreaCard(
                      name: 'Light',
                      imageUrl:
                          'https://images.unsplash.com/photo-1565814636199-ae8133055c1c?w=400',
                      isImageLeft: true,
                      gradientColors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
