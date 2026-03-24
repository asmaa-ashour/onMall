import 'package:flutter/material.dart';
import 'package:second/core/constant/color.dart';
import 'package:second/view/widget/home/categoryCard.dart';

class AreaScreen extends StatefulWidget {
  const AreaScreen({super.key});

  @override
  State<AreaScreen> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  // 🔍 متغيرات البحث
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearching = false;

  // 📦 بيانات المناطق
  final List<Map<String, dynamic>> _allAreas = const [
    {
      'name': 'Home Furniture',
      'imageUrl':
          'https://images.unsplash.com/photo-1556228453-efd6c1ff04f6?w=400',
      'isImageLeft': true,
      'gradientColors': [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
    },
    {
      'name': 'Office Furniture',
      'imageUrl':
          'https://images.unsplash.com/photo-1583846783214-7229a91b20ed?w=400',
      'isImageLeft': false,
      'gradientColors': [Color(0xFFE0F2FE), Color(0xFFBAE6FD)],
    },
    {
      'name': 'Home Decoration',
      'imageUrl':
          'https://images.unsplash.com/photo-1513519245088-0e12902e35a5?w=400',
      'isImageLeft': true,
      'gradientColors': [Color(0xFFFCE4EC), Color(0xFFF8BBD9)],
    },
    {
      'name': 'Storage',
      'imageUrl':
          'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=400',
      'isImageLeft': false,
      'gradientColors': [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
    },
    {
      'name': 'Light',
      'imageUrl':
          'https://images.unsplash.com/photo-1565814636199-ae8133055c1c?w=400',
      'isImageLeft': true,
      'gradientColors': [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
    },
  ];

  // 🔍 فلترة المناطق حسب البحث
  List<Map<String, dynamic>> get _filteredAreas {
    if (_searchQuery.isEmpty) return _allAreas;
    return _allAreas.where((area) {
      return area['name'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // 🔥 Header with Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Profile Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title with gradient
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            AppColor.prrimaryColor,
                            Color.fromARGB(255, 183, 58, 68)
                          ],
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

                      // 🔍 Search Icon Button
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _isSearching = !_isSearching;
                              if (!_isSearching) {
                                _searchController.clear();
                                _searchQuery = '';
                              }
                            });
                          },
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              _isSearching ? Icons.close : Icons.search,
                              key: ValueKey(_isSearching),
                              color: AppColor.prrimaryColor,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 🔥 Animated Search Bar
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: _isSearching ? 60 : 0,
                    child: _isSearching
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: TextField(
                              controller: _searchController,
                              autofocus: true,
                              onChanged: (value) {
                                setState(() {
                                  _searchQuery = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Search areas...',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 16,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey.shade600,
                                  size: 22,
                                ),
                                suffixIcon: _searchQuery.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _searchController.clear();
                                            _searchQuery = '';
                                          });
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.grey.shade600,
                                          size: 20,
                                        ),
                                      )
                                    : null,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color:
                                        AppColor.prrimaryColor.withOpacity(0.5),
                                    width: 2,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // 📊 Results Count
            if (_searchQuery.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      '${_filteredAreas.length} results found',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    if (_filteredAreas.isEmpty)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = '';
                            _isSearching = false;
                          });
                        },
                        child: Text(
                          'Clear search',
                          style: TextStyle(
                            color: AppColor.prrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

            // 📋 List of areas
            Expanded(
              child: _filteredAreas.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 80,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No areas found',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Try searching for something else',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                                _searchQuery = '';
                                _isSearching = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF9C27B0),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('Clear Search'),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      itemCount: _filteredAreas.length,
                      itemBuilder: (context, index) {
                        final area = _filteredAreas[index];
                        return Column(
                          children: [
                            AreaCard(
                              name: area['name'],
                              imageUrl: area['imageUrl'],
                              isImageLeft: area['isImageLeft'],
                              gradientColors: area['gradientColors'],
                            ),
                            if (index != _filteredAreas.length - 1)
                              const SizedBox(height: 16),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
