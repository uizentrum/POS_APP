import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_event.dart';
import 'package:tarka/blocks/wishlist/wishlist_block.dart';
import 'package:tarka/blocks/wishlist/wishlist_event.dart';
import 'package:tarka/config/app_router.dart';
import 'package:tarka/config/theme.dart';
import 'package:tarka/screens/home/home_screen.dart';
import 'package:tarka/screens/screens.dart';
import 'blocks/wishlist/cartbloc/cart_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Bloc.observer = SimpleBlocObserver();
  RenderErrorBox.backgroundColor = Colors.amber;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade600,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => WishlistBloc()..add(StarWishlist())),
      ],
      child: ScreenUtilInit(
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'POS',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
        designSize: Size(411, 866),
      ),
    );
  }
}
