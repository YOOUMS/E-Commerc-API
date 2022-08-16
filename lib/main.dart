import 'package:e_commerc_api/DioProvider.dart';
import 'package:e_commerc_api/dioHelper.dart';
import 'package:flutter/material.dart';
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
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("All Procuts")),
      body: Consumer<DioProvider>(builder: (context, provider, x) {
        return Center(
            child: ListView.builder(
                itemCount: provider.products!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network(provider.products?[index].image ?? ''),
                      Text(provider.products?[index].title ?? '')
                    ],
                  );
                }));
      }),
    );
  }
}
