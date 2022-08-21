import 'package:e_commerc_api/AppRouter.dart';
import 'package:e_commerc_api/model/product.dart';
import 'package:e_commerc_api/providers/DioProvider.dart';
import 'package:e_commerc_api/widgets/ProductScreen.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DioProvider>(builder: (context, provider, x) {
      return InkWell(
        onTap: () async {
          await provider.getOneProduct(product.id.toString());
          AppRouter.pushWidget(
              ProductScreen(product: provider.selectedProduct!));
        },
        child: Container(
          padding: EdgeInsets.all(10.w),
          margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
          width: 314.w,
          height: 200.h,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          child: Row(children: [
            SizedBox(width: 150.w, child: Image.network(product.image ?? '')),
            SizedBox(
              width: 9.w,
            ),
            SizedBox(
              width: 230.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    height: 100.h,
                    width: double.infinity,
                    child: Text(
                      product.title ?? "no title",
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp)),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "\$ ${product.price}",
                    style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.green,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }
}
