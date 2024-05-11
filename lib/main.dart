import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/firebase_options.dart';
import 'package:untitled/provider/dark_theme_provider.dart';
import 'package:untitled/screens/auth/forget_password.dart';
import 'package:untitled/screens/auth/login.dart';
import 'package:untitled/screens/auth/register.dart';
import 'package:untitled/screens/orders/orders_screen.dart';
import 'package:untitled/screens/viewed_recently/viewed_recently_screen.dart';
import 'package:untitled/screens/wishlist/wishlist_screen.dart';
import 'consts/theme_data.dart';
import 'inner_screen/feeds_screen.dart';
import 'inner_screen/on_sale_screen.dart';
import 'inner_screen/products_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  // MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          initialRoute: LoginScreen.routeName,
          routes: {
            OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
            FeedsScreen.routeName: (ctx) => const FeedsScreen(),
            ProductDetails.routeName: (ctx) => const ProductDetails(),
            WishlistScreen.routeName: (ctx) => const WishlistScreen(),
            OrdersScreen.routeName: (ctx) => const OrdersScreen(),
            ViewedRecentlyScreen.routeName: (ctx) =>
                const ViewedRecentlyScreen(),
            RegisterScreen.routeName: (ctx) => const RegisterScreen(),
            LoginScreen.routeName: (ctx) => const LoginScreen(),
            ForgetPasswordScreen.routeName: (ctx) =>
                const ForgetPasswordScreen(),
          },
        );
      }),
    );
  }
}
