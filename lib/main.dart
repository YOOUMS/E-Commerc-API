import 'package:e_commerc_api/providers/DioProvider.dart';
import 'package:e_commerc_api/helpers/dioHelper.dart';
import 'package:e_commerc_api/widgets/CatScreen.dart';
import 'package:e_commerc_api/widgets/ProductWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DioProvider(),
      child: ScreenUtilInit(
          designSize: const Size(414, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              home: CatScreen(),
            );
          }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DioProvider>(builder: (context, provider, x) {
      return Scaffold(
          appBar: AppBar(actions: [
            IconButton(
                onPressed: () => provider.getAllCat(), icon: Icon(Icons.print))
          ], title: Text("All Procuts")),
          body: Center(
              child: ListView.builder(
                  itemCount: provider.products!.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(product: provider.products![index]);
                  })));
    });
  }
}
