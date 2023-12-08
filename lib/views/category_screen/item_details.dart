import 'package:e_commerce_app/consts/lists.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';

class ItemDetails extends StatelessWidget {
  String? title;

  ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title?.text.black.size(20).fontFamily(semibold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: darkFontGrey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline,
              color: darkFontGrey,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 200,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Card(
                          color: whiteColor,
                          shape: RoundedRectangleBorder(),
                          child: Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 10))
                              .make(),
                        );
                      },
                    ),
                    10.heightBox,
                    title!.text.size(15).color(darkFontGrey).make(),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      maxRating: 5,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30.00"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Satış".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "Ev işi markalar"
                                .text
                                .white
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .size(15)
                                .make(),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(70)
                        .padding(EdgeInsets.symmetric(horizontal: 15))
                        .color(textfieldGrey)
                        .make(),
                    5.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Renk".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(EdgeInsets.all(5))
                                    .make(),
                              ),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(3)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Toplam ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                                "0"
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                                10.heightBox,
                                "(0 kullanılabilir)"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ],
                            )
                          ],
                        ).box.padding(EdgeInsets.all(3)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Toplam ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                10.heightBox,
                                "\$0.00"
                                    .text
                                    .color(redColor)
                                    .size(16)
                                    .fontFamily(bold)
                                    .make(),
                              ],
                            )
                          ],
                        ).box.padding(EdgeInsets.all(3)).make(),
                      ],
                    ).box.white.margin(EdgeInsets.all(5)).make(),
                    5.heightBox,
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    5.heightBox,
                    "Ürün Açıklamalarını buraya Yazınız"
                        .text
                        .color(textfieldGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          itemDetailsButtonslist.length,
                          (index) => ListTile(
                                title: itemDetailsButtonslist[index]
                                    .text
                                    .fontFamily(semibold)
                                    .size(15)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: Icon(Icons.arrow_forward),
                              )),
                    ),
                    productsYouLike.text
                        .fontFamily(bold)
                        .size(16)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            featuredProducts.length,
                            (index) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        .color(darkFontGrey)
                                        .make(),
                                    2.heightBox,
                                    "\$999"
                                        .text
                                        .color(redColor)
                                        .fontFamily(bold)
                                        .make()
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(EdgeInsets.all(5))
                                    .width(130)
                                    .height(180)
                                    .roundedSM
                                    .padding(EdgeInsets.all(10))
                                    .make()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ourButton(() {}, redColor, whiteColor, "Sepete Ekle"),
            ),
          ),
        ],
      ),
    );
  }
}
