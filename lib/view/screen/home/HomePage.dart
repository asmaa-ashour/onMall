import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/homeController.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final MainController controller = Get.put(MainController());
  final ScrollController scrollController = ScrollController();

  // ألوان التصميم
  final Color primaryPurple = const Color(0xFF6C63FF);
  final Color secondaryPink = const Color(0xFFFF6584);
  final Color accentColor = const Color(0xFFFFD166); // أصفر ذهبي للدائرة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(context),
      body: Obx(
        () => _buildBody(controller.currentIndex.value),
      ),
      bottomNavigationBar: Obx(
        () => _buildBottomNavBar(context),
      ),
    );
  }

  // **Floating Action Button مع دائرة في القلب ❤️**
  Widget _buildFloatingActionButton(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fabSize = screenWidth * 0.16;

    return Obx(
      () => Container(
        height: fabSize,
        width: fabSize,
        margin: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () {
            controller.changeTab(0);
            _scrollToTop();
          },
          elevation: 15,
          backgroundColor: Colors.transparent, // شفاف عشان نشوف التصميم تحته
          shape: const CircleBorder(),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.white,
                  primaryPurple,
                ],
                radius: 0.8,
                stops: const [0.3, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: primaryPurple.withOpacity(0.5),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // الأيقونة الرئيسية
                Icon(
                  Icons.home_rounded,
                  size: fabSize * 0.45,
                  color: Colors.white,
                ),

                // **الدائرة الحمراء في القلب ❤️**
                if (controller.currentIndex.value == 0)
                  Positioned(
                    top: fabSize * 0.15,
                    right: fabSize * 0.15,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.elasticOut,
                      height: fabSize * 0.2,
                      width: fabSize * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: accentColor,
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withOpacity(0.8),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          size: fabSize * 0.1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // **Bottom Navigation Bar بسيط وأنيق**
  Widget _buildBottomNavBar(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double bottomBarHeight = screenHeight * 0.09;

    return Container(
      height: bottomBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: primaryPurple.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(Icons.explore_rounded, 'استكشاف', 1),
          _buildNavItem(Icons.favorite_rounded, 'المفضلة', 2),
          SizedBox(width: bottomBarHeight * 1.5), // مساحة للـ FAB
          _buildNavItem(Icons.shopping_bag_rounded, 'طلباتي', 3),
          _buildNavItem(Icons.person_rounded, 'حسابي', 4),
        ],
      ),
    );
  }

  // **عناصر الـ Bottom Navigation Bar**
  Widget _buildNavItem(IconData icon, String label, int index) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.changeTab(index);
          _scrollToTop();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: controller.currentIndex.value == index
                ? primaryPurple.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: controller.currentIndex.value == index
                    ? primaryPurple
                    : Colors.grey.shade400,
                size: 26,
              ),
              if (controller.currentIndex.value == index)
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: primaryPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: primaryPurple,
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // **بناء الصفحات**
  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _buildHomePage();
      case 1:
        return _buildScrollablePage('استكشاف', Icons.explore_rounded);
      case 2:
        return _buildScrollablePage('المفضلة', Icons.favorite_rounded);
      case 3:
        return _buildScrollablePage('طلباتي', Icons.shopping_bag_rounded);
      case 4:
        return _buildScrollablePage('حسابي', Icons.person_rounded);
      default:
        return _buildHomePage();
    }
  }

  // **الصفحة الرئيسية**
  Widget _buildHomePage() {
    return Container(
      color: Colors.grey.shade50,
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'OneMallX',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryPurple, secondaryPink],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildHomeItem(index),
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeItem(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: primaryPurple.withOpacity(0.1),
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(16)),
            ),
            child: Center(
              child: Icon(Icons.store_rounded, color: primaryPurple, size: 40),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('متجر ${index + 1}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('منتجات مميزة بأسعار رائعة',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // **صفحات قابلة للتمرير**
  Widget _buildScrollablePage(String title, IconData icon) {
    return Container(
      color: Colors.grey.shade50,
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title),
              background: Container(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [primaryPurple, secondaryPink]),
                ),
                child: Center(
                  child: Icon(icon,
                      size: 40, color: Colors.white.withOpacity(0.3)),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildListItem(index, title),
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(int index, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: primaryPurple.withOpacity(0.1),
          child: Text('${index + 1}', style: TextStyle(color: primaryPurple)),
        ),
        title: Text('$title - عنصر ${index + 1}'),
        trailing: Icon(Icons.arrow_forward_ios_rounded,
            color: primaryPurple, size: 16),
      ),
    );
  }
}
