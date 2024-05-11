import 'package:flutter/material.dart';

import '../services/utils.dart';
import '../widgets/categories_widget.dart';
import '../widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
    const Color(0xffafaeac),
    const Color(0xffe3e2e2),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/muda.jpeg',
      'catText': 'Marine mud         therapy',
    },
    {
      'imgPath': 'assets/images/Swirly Sand (1).jpeg',
      'catText': 'Burial in sand',
    },
    {
      'imgPath': 'assets/images/water.jpeg',
      'catText': 'Thermal water therapy',
    },
    {
      'imgPath': 'assets/images/أسوان.jpeg',
      'catText': 'Psychiatric hospitalization',
    },
    {
      'imgPath': 'assets/images/Meditation.jpeg',
      'catText': 'Meditation',
    },
    {
      'imgPath': 'assets/images/سفارى أحلى عالم.jpeg',
      'catText': 'Safari',
    },
    {
      'imgPath': 'assets/images/Salt from the Sea_ A North Sea Salt Works Story - North Wild Kitchen (1).jpeg',
      'catText': 'Burial with salt',
    },
    {
      'imgPath': 'assets/images/يوجا.jpeg',
      'catText': 'Yoga',
    },
  ];


  @override
  Widget build(BuildContext context) {
    final utils = Utils(context) ;
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240/250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(8, (index) {
            return CategoriesWidget(
              catText: catInfo[index]['catText'],
              imgPath: catInfo[index]['imgPath'],
              passedColor: gridColors[index],
            );
          }),
        ),
      ),
    );
  }
}
