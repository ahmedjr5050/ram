import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../consts/constss.dart';
import '../inner_screen/feeds_screen.dart';
import '../inner_screen/on_sale_screen.dart';
import '../services/global_method.dart';
import '../services/utils.dart';
import '../widgets/feed_items.dart';
import '../widgets/on_sale_widget.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final Color color = Utils(context).color ;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    Constss.offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: Constss.offerImages.length,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
                // control: const SwiperControl(color: Colors.black),
              ),
            ),
            SizedBox(height: 7,),
            TextButton(
                onPressed: (){
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: OnSaleScreen.routeName);
                },
                child: TextWidget(
                    text: 'View All',
                    color: Colors.blue,
                    textSize: 20,
                    maxLines: 1,
                ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                          text: 'on sale'.toUpperCase(),
                          color: Colors.red,
                          textSize: 22,
                        isTitle: true,
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8,),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index){
                      return OnSaleWidget();
                    },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      text: 'Our Hotels',
                      color: color,
                      textSize: 22,
                    isTitle: true,
                  ),
                  // Spacer(),
                  TextButton(
                      onPressed: (){
                        GlobalMethods.navigateTo(
                            ctx: context, routeName: FeedsScreen.routeName);
                      }
                      , child: TextWidget(
                      text: 'Browse all',
                      color: Colors.blue,
                      textSize: 20,
                    maxLines: 1,
                  ),
                  ),
                ],
              ),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.59),
              children: List.generate(8, (index) {
                return FeedsWidget();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
