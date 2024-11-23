import 'package:addtocart/controller/home_controller.dart';
import 'package:addtocart/data/data.dart';
import 'package:addtocart/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final int index;
  final void Function(GlobalKey) onClick;
  Product({super.key, required this.index, required this.onClick});
  HomeController homecontrol = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (context) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: ColorConstant.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    onClick(widgetKey);
                    String image = "${ProductData[index]["image"]}";
                    homecontrol.addImage(image);
                  },
                  child: Container(
                    key: widgetKey,
                    // margin: EdgeInsets.all(20),
                    height: 100,
                    width: 120,

                    child: Image(
                      image: AssetImage("${ProductData[index]["image"]}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "${ProductData[index]["name"]}",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Rs. ${ProductData[index]["Price"]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorConstant.secondaryColor.withOpacity(0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              homecontrol.decreament(index);
                            },
                            child: Icon(Icons.remove)),
                        Container(
                          child: Text(
                            "${homecontrol.count[index].value}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              homecontrol.increament(index);
                            },
                            child: Icon(Icons.add)),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
