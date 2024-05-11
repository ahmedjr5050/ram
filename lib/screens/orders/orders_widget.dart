import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../inner_screen/products_details.dart';
import '../../services/global_method.dart';
import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return ListTile(
      subtitle: const Text('Paid: \$12.8'),
      onTap: () {
        GlobalMethods.navigateTo(
            ctx: context, routeName: ProductDetails.routeName);
      },
      leading:  FancyShimmerImage(
        width: size.width * 0.2,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxCiFfx_oyyZbLejwaXbVBXQO9qIinBY_r6eRV_U6ZuJ51YjObCa3RD7sHjP8wluAXC9g&usqp=CAU',
        boxFit: BoxFit.fill,
      ),

      title: TextWidget(text: 'Title  x12', color: color, textSize: 18),
      trailing: TextWidget(text: '03/08/2022', color: color, textSize: 18),
    );
  }
}
