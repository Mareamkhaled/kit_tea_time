import "package:flutter/material.dart";
import "../../features/cat_facts/presentation/screens/cat_fact_screen.dart";
import "../../features/onboarding/screens/on_boarding_screen.dart";
import "../../features/splash/screens/splash_screen.dart";
import "../../test_screen.dart";
import "../root.dart";
import "routes.dart";

class Routing {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
  
      case Routes.root:
        return MaterialPageRoute(builder: (context) => const Root());
      case Routes.test:
        return MaterialPageRoute(builder: (context) => const TestScreen());
      case Routes.factScreen:
        return MaterialPageRoute(
          builder: (context) => const CatFactScreen(),
        );
   
      default:
        return MaterialPageRoute(builder: (_) => const NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("No Route Found")));
  }
}
