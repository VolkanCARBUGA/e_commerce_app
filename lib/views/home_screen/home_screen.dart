import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/home_screen/components/featured_buttons.dart';
import 'package:e_commerce_app/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
         body: Container(
            padding: EdgeInsets.all(15),
            color: lightGrey,
            width: context.screenWidth,
            height: context.screenHeight,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: lightGrey,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: whiteColor,
                          hintText: searchAnyThing,
                          hintStyle: TextStyle(
                            color: textfieldGrey,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              imgsearch,
                              width: 3,
                              height: 3,
                            ),
                          )),
                    ),
                  ),
                  10.heightBox,
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          VxSwiper.builder(
                            aspectRatio: 16 / 6,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            itemCount: sliderList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.asset(
                                  sliderList[index],
                                  fit: BoxFit.cover,
                                )
                                    .box
                                    .rounded
                                    .clip(Clip.antiAliasWithSaveLayer)
                                    .margin(EdgeInsets.symmetric(horizontal: 10))
                                    .make(),
                              );
                            },
                          ),
                          10.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              2,
                              (index) => homeButtons(
                                  context.screenWidth / 4,
                                  context.screenHeight * 0.1,
                                  index == 0 ? icTodaysDeal : icFlashDeal,
                                  index == 0 ? todayDeal : flashsale,
                                  () {}),
                            ),
                          ),
                          10.heightBox,
                          VxSwiper.builder(
                            aspectRatio: 16 / 6,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            itemCount: secondSlidersList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.asset(
                                  secondSlidersList[index],
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                3,
                                (index) => homeButtons(
                                    context.screenWidth / 4,
                                    context.screenHeight * 0.1,
                                    index == 0
                                        ? icTopCategories
                                        : index == 1
                                            ? icBrands
                                            : icTopSeller,
                                    index == 0
                                        ? topCategories
                                        : index == 1
                                            ? brand
                                            : topSeller,
                                    () {})),
                          ),
                          20.heightBox,
                          featuredCategories.text
                              .color(fontGrey)
                              .size(20)
                              .fontFamily(semibold)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  3,
                                  (index) => Column(
                                        children: [
                                          featuredButtons(featuredTittle1[index],
                                              featuredImages1[index]),
                                          10.heightBox,
                                          featuredButtons(featuredTittle2[index],
                                              featuredImages2[index])
                                        ],
                                      )).toList(),
                            ),
                          ),
                          20.heightBox,
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: redColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                featuredProducts.text.white
                                    .fontFamily(bold)
                                    .align(TextAlign.center)
                                    .size(15)
                                    .make(),
                                10.heightBox,
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                        featuredProducts.length,
                                        (index) => Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                          20.heightBox,
                          VxSwiper.builder(
                            aspectRatio: 16 / 6,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            itemCount: secondSlidersList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.asset(
                                  secondSlidersList[index],
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
                          20.heightBox,
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 6,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 200,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: whiteColor),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
          
                                        //     crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            imgP3,
                                            width: 120,
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
                                              .align(TextAlign.end)
                                              .fontFamily(bold)
                                              .make()
                                        ],
                                      ))
                                  .box
                                  .white
                                  .margin(EdgeInsets.symmetric(horizontal: 4))
                                  .roundedSM
                                  .padding(EdgeInsets.all(10))
                                  .make();
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
       );
     
    
  }
}
