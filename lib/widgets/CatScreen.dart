import 'package:e_commerc_api/providers/DioProvider.dart';
import 'package:e_commerc_api/widgets/LoadingSpinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

import 'ProductWidget.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DioProvider>(builder: (context, provider, x) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => provider.login(),
          child: Text('+'),
        ),
        appBar: AppBar(
          title: Text('cats'),
          centerTitle: true,
        ),

        body: Stack(
          children: [
            LazyLoadScrollView(
                onEndOfPage: () => provider.loadMore(),
                child: ListView.builder(
                    itemCount: provider.passegers.length,
                    itemBuilder: (context, index) =>
                        ProductWidget(passenger: provider.passegers[index]))),
            provider.isLoaded
                ? SizedBox()
                : Center(
                    child: LoadingSpinner(),
                  )
          ],
        ),

        // body: Column(children: [
        //   SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: SizedBox(
        //       height: 50.h,
        //       child: Row(
        //         children: [
        //           TextButton(
        //               onPressed: () => provider.getProductsFor('all'),
        //               child: Text(
        //                 "All",
        //                 style: TextStyle(
        //                     color: provider.selectedIndex == -1
        //                         ? Colors.green
        //                         : Colors.blue),
        //               )),
        //           ListView.builder(
        //               shrinkWrap: true,
        //               physics: NeverScrollableScrollPhysics(),
        //               scrollDirection: Axis.horizontal,
        //               itemCount: provider.cat.length,
        //               itemBuilder: (context, index) => TextButton(
        //                   onPressed: () =>
        //                       provider.getProductsFor(provider.cat[index]),
        //                   child: Text(
        //                     provider.cat[index],
        //                     style: TextStyle(
        //                         color: provider.selectedIndex == index
        //                             ? Colors.green
        //                             : Colors.blue),
        //                   ))),
        //         ],
        //       ),
        //     ),
        //   ),
        //   Expanded(
        //     child: ListView.builder(
        //         itemCount: provider.catProducts.length,
        //         itemBuilder: (context, index) {
        //           return ProductWidget(product: provider.catProducts[index]);
        //         }),
        //   )
        // ]),
      );
    });
  }
}
