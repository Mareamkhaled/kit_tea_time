import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/cat_facts/presentation/cubit/cat_fact_cubit.dart';
import '../features/cat_facts/presentation/screens/cat_fact_screen.dart';
import '../features/gallery/presentation/cubit/gallery_cubit.dart';
import '../features/gallery/presentation/screens/gallery_screen.dart';
import '../features/home/presentation/cubit/home_cubit.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/settings/presentation/screens/settings_screen.dart';
import 'di/cat_facts_dio.dart';
import 'di/gallery_di.dart';
import 'di/home_di.dart';
import 'utils/app_colors.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    BlocProvider<HomeCubit>(
      create: (context) => homeGetIt<HomeCubit>()..fetchCatImages(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => galleryGetIt<GalleryCubit>()..fetchGalleryImages(),
      child: const GalleryScreen(),
    ),
    BlocProvider<CatFactCubit>(
      create: (context) => catFactsGetIt<CatFactCubit>()..fetchCatFact(),
      child: const CatFactScreen(),
    ),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
     data: Theme.of(context).copyWith(
    canvasColor: AppColors.myWhite, // ← Your desired background color
  ),

      child: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.yellow,
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.darkBlue, // Customize as needed
          unselectedItemColor: AppColors.myGrey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'Facts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}




//
//icon: Icon(CupertinoIcons.heart), 
// icon: Icon(Icons.fact_check_outlined), 
// icon: Icon(CupertinoIcons.search),
//     icon: Icon(Icons.home_filled),
// icon: Icon(Icons.photo_library),
