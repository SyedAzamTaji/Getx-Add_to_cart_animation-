import 'dart:ui';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:addtocart/controller/home_controller.dart';
import 'package:addtocart/data/data.dart';
import 'package:addtocart/utils/colors.dart';
import 'package:addtocart/view/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;

  HomeController homecontrol = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstant.secondaryColor.withOpacity(0.8),
            title: Text(
              "Style Sphere",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: ProductData.length,
                    itemBuilder: (context, index) {
                      return Product(
                        index: index,
                        onClick: listClick,
                      );
                    }),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: ColorConstant.secondaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 60,
                      width: 160,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: ColorConstant.secondaryColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Color.fromARGB(255, 237, 133, 225)),
                      child: Center(
                          child: Text(
                        "Total: 59000",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      )),
                    ),
                    AddToCartIcon(
                      key: cartKey,
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 40,
                        color: Color.fromARGB(255, 237, 133, 225),
                      ),
                      badgeOptions: BadgeOptions(
                        active: true,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: homecontrol.selectedImages.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  homecontrol.selectedImages.removeAt(index);

                                  if (_cartQuantityItems > 0) {
                                    _cartQuantityItems--;
                                    cartKey.currentState!.runCartAnimation(
                                        _cartQuantityItems.toString());
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: ColorConstant.primaryColor),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${homecontrol.selectedImages[index]}"),
                                          fit: BoxFit.contain),
                                      shape: BoxShape.circle),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
    await cartKey.currentState!
        .runCartAnimation((++_cartQuantityItems).toString());
  }
}
