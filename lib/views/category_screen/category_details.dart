import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/styles.dart';
import 'package:e_commerce_app/controllers/product_controller.dart';
import 'package:e_commerce_app/views/category_screen/item_details.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryDetails extends StatelessWidget {
  String? title;
  CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductContoller>();
    return bgWidget(Scaffold(
      appBar: AppBar(
        title: title?.text.fontFamily(semibold).white.make(),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    controller.subcat.length,
                    (index) => "${controller.subcat[index]}"
                        .text
                        .size(15)
                        .fontFamily(semibold)
                        .black
                        .align(TextAlign.center)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .roundedSM
                        .size(120, 60)
                        .margin(EdgeInsets.all(15))
                        .make()),
              ),
            ),
            20.heightBox,

            Expanded(
              
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 200,
                        crossAxisCount: 2),
                    itemBuilder: (contex, index) {
                  return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: lightGrey
                                  ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                    crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    imgP3,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  2.heightBox,
                                  "4 GB Ram 256GB \n"
                                          "SSD Laptop"
                                      .text
                                      .fontFamily(semibold)
                                      .size(12)
                                      .align(TextAlign.center)
                                      .color(darkFontGrey)
                                      .make(),
                                  3.heightBox,
                                  "\$999"
                                      .text
                                      .color(redColor)
                                      .align(TextAlign.start)
                                      .fontFamily(bold)
                                      .make()
                                ],
                              ))
                          .box
                          .white
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .roundedSM
                          .padding(EdgeInsets.all(10))
                          .make().onTap(() { 
                            Get.to(()=>ItemDetails(title: title));
                          });
                    }))
          ],
        ),
      ),
    ));
  }
}
