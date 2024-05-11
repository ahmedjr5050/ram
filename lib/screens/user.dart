import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/viewed_recently/viewed_recently_screen.dart';
import 'package:untitled/screens/wishlist/wishlist_screen.dart';


import '../provider/dark_theme_provider.dart';
import '../services/global_method.dart';
import '../widgets/text_widget.dart';
import 'orders/orders_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressEditingController = TextEditingController(text: "");

  @override
  void dispose() {
    _addressEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black ;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                RichText(
                  text: TextSpan(
                  text: 'Hi,    ',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'My Name',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: color,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = (){
                        print("my name is pressed");
                    }
                    ),
                  ],
                ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextWidget(
                    text: 'Email@email.com',
                    color: color,
                    textSize: 18,
                ),

                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                _listTiles(
                    title: 'Address 2',
                    subtitle: 'My Subtitle',
                    icon: IconlyLight.profile,
                    onPressed: () async{
                      await _showDialogAddress();
                    },
                  color: color,
                ),
                _listTiles(
                  title: 'Orders',
                  icon: IconlyLight.bag,
                  onPressed: (){
                    GlobalMethods.navigateTo(
                        ctx: context, routeName: OrdersScreen.routeName);
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Wishlist',
                  icon: IconlyLight.heart,
                  onPressed: (){
                    GlobalMethods.navigateTo(
                        ctx: context, routeName: WishlistScreen.routeName);
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Viewed',
                  icon: IconlyLight.show,
                  onPressed: (){
                    GlobalMethods.navigateTo(
                        ctx: context, routeName: ViewedRecentlyScreen.routeName);
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Forget Password',
                  icon: IconlyLight.unlock,
                  onPressed: (){},
                  color: color,
                ),

                SwitchListTile(
                  title: TextWidget(
                      text: themeState.getDarkTheme ? 'Dark mode' : "Light mode",
                      color: color,
                      textSize: 18,
                  ),
                  secondary: Icon( themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                  ),
                  onChanged: (bool value){
                    setState(() {
                      themeState.setDarkTheme = value ;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),

                SizedBox(
                  height: 10,
                ),

                _listTiles(
                  title: 'Logout',
                  icon: IconlyLight.logout,
                  onPressed: (){
                    GlobalMethods.warningDialog(
                        title: 'Sign out',
                        subtitle: 'Do you wanna sign out ?'
                        , fct: (){},
                        context: context,
                    );
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }


  Future <void> _showDialogAddress() async{
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Update'),
        content: TextField(
          // onChanged: (value){
          //   print('_addressEditingController.text ${_addressEditingController.text}');
          // },
          controller: _addressEditingController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Your Address',
          ),
        ),
        actions: [
          TextButton(
            onPressed: (){},
            child: Text('Update'),
          ),
        ],
      );
    });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }){
    return ListTile(
      title:TextWidget(
        text: title ,
        color: color,
        textSize: 22,
        // isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle ,
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: (){
        onPressed();
      },
    );
  }
}
