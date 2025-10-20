// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../features/cat_facts/presentation/screens/cat_fact_screen.dart';
// import 'utils/app_colors.dart';

// class Root extends StatefulWidget {
//   const Root({super.key});

//   @override
//   State<Root> createState() => _RootState();
// }

// class _RootState extends State<Root> {
//   late PageController controller;
//   late List<Widget> screens;
//   int currentScreen = 3;

//   @override
//   void initState() {
//     screens = const [CatFactScreen()];
//     controller = PageController(initialPage: currentScreen);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: controller,
//         physics: const NeverScrollableScrollPhysics(),
//         children: screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 0,
//         enableFeedback: false,
//         backgroundColor: Colors.transparent,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: AppColors.primaryColor,
//         unselectedItemColor: AppColors.myGrey.withGreen(150),
//         currentIndex: currentScreen,
//         onTap: (index) {
//           setState(() => currentScreen = index);
//           controller.jumpToPage(currentScreen);
//         },
//         items: [
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.home_filled),
//             label: 'Home',
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.photo_library),
//             label: 'Gallery',
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.search),
//             label: 'Search',
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.fact_check_outlined),
//             label: 'Facts',
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.heart),
//             label: 'Favorites',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/cat_facts/presentation/cubit/cat_fact_cubit.dart';
import '../features/cat_facts/presentation/screens/cat_fact_screen.dart';
import '../test_screen.dart';
import 'helpers/di.dart';
import 'utils/app_colors.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
   BlocProvider<CatFactCubit>(
  create: (context) => getIt<CatFactCubit>()..fetchCatFact(),
  child: const CatFactScreen(),
),
    const TestScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColors.myWhite,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.darkBlue, // Customize as needed
        unselectedItemColor: AppColors.myGrey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Facts',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'test'),
        ],
      ),
    );
  }
}
