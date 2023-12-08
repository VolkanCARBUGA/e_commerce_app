import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/category_screen/category_details.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(
        title: categories.text.bold.fontFamily(semibold).white.make(),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            padding: EdgeInsets.all(15),
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              var category = categoryImages[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    category,
                    width: 75,
                    fit: BoxFit.cover,
                  ),
                  5.heightBox,
                  "${categoryList[index]}"
                      .text
                      .size(15)
                      .fontFamily(semibold)
                      .align(TextAlign.center)
                      .color(darkFontGrey)
                      .make()
                ],
              )
                  .box
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .color(lightGrey.withOpacity(0.9))
                  .make()
                  .onTap(() {
                Get.to(() => CategoryDetails(title: categoryList[index]));
              });
            }),
      ),
    ));
  }
}
