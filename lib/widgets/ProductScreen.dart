import 'package:e_commerc_api/helpers/dioHelper.dart';
import 'package:e_commerc_api/providers/DioProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';

class ProductScreen extends StatelessWidget {
  Product product;
  ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DioProvider>(builder: (context, provider, x) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 229, 229, 229),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromARGB(255, 229, 229, 229),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 270.h,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    height: 230.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(product.image ?? ''),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 36.h),
                    width: 414.w,
                    height: 503.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r))),
                    child: Align(
                      child: Column(children: [
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              "${product.title}",
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold)),
                            )),
                        SizedBox(
                          height: 40.h,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Description",
                              style: GoogleFonts.raleway(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            )),
                        Divider(),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "${product.description}",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(fontSize: 15.sp)),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              "Total",
                              style: GoogleFonts.raleway(fontSize: 17.sp),
                            ),
                            Spacer(),
                            Text(
                              "\$ ${product.price}",
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 89, 86, 233),
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ));
    });
  }
}
