import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:untitled/widgets/price_widget.dart';
import 'package:untitled/widgets/text_widget.dart';


import '../inner_screen/products_details.dart';
import '../services/global_method.dart';
import '../services/utils.dart';
import 'heart_btn.dart';


class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            GlobalMethods.navigateTo(
                ctx: context, routeName: ProductDetails.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyShimmerImage(
                        imageUrl: 'https://i.pinimg.com/236x/1a/55/ad/1a55ad12640a86cea9277c19cbc8b37f.jpg',
                        width: size.width*0.22,
                        height: size.width * 0.22,
                        boxFit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          TextWidget(
                            text: '.',
                            color: color,
                            textSize: 22,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  IconlyLight.bag2,
                                  size: 22,
                                  color: color,
                                ),
                              ),
                              HeartBTN(),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  PriceWidget(
                    isOnSale:true ,
                    price: 5.9,
                    salePrice: 2.99,
                    textPrice: '1',
                  ),
                  const SizedBox(height: 5),
                  TextWidget(text: 'Hotel title', color: color, textSize: 16, isTitle: true,),
                  const SizedBox(height: 5),
                ]),
          ),
        ),
      ),
    );
  }
}
