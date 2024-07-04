import 'package:app/src/navigation/scaffcold_with_navigation_bar.dart';
import 'package:app/src/navigation/scaffcold_with_navigation_rail.dart';
import 'package:app/src/page/account/account_page.dart';
import 'package:app/src/page/home/home_page.dart';
import 'package:app/src/providers/user_provider.dart';
import 'package:app/src/tools/settings/settings_controller.dart';
import 'package:app/src/tools/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorTabAKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _shellNavigatorTabCKey = GlobalKey<NavigatorState>(debugLabel: 'Account');

final goRouter = GoRouter(
  initialLocation: '/tab1',
  // * Passing a navigatorKey causes an issue on hot reload:
  // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
  // * However it's still necessary otherwise the navigator pops back to
  // * root on hot reload
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    // Stateful navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorTabAKey,
          routes: [
            GoRoute(
                path: '/tab1',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: PageHome()),
                routes: [
                  GoRoute(
                      path: 'home',
                      builder: (context, state) => const PageHome()),
                ]),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorTabCKey,
          routes: [
            GoRoute(
              path: '/tab3',
              pageBuilder: (context, state) => const NoTransitionPage(
                child:
                    //PageRootScreen(label: 'A_root', detailsPath: '/a/details'),
                    PageAccount(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  final settingsService = SettingsService();
  final settingsController = SettingsController(settingsService);

  settingsController.loadSettings();

  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider()),
        ],
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return ScaffoldWithNavigationBar(
              body: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: _goBranch,
            );
          } else {
            return ScaffoldWithNavigationRail(
              body: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: _goBranch,
            );
          }
        }));
  }
}
