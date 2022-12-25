import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:abohaoya/main.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart' as slideDialog;
class PopupMenuButtonWidget extends StatefulWidget {
  const PopupMenuButtonWidget({Key? key}) : super(key: key);

  @override
  State<PopupMenuButtonWidget> createState() => _PopupMenuButtonWidgetState();
}

class _PopupMenuButtonWidgetState extends State<PopupMenuButtonWidget> {
  bool status = false;
  void showDialog() {
    slideDialog.showSlideDialog(
        context: context,
        child: Column(
          children: [
            Column(
              children: [
                Text('Developer Profile',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Image.asset("assets/images/Screenshot_2022-12-25-22-27-07-847-edit_com.miui.gallery.jpg",
                height: 240,
                width: 320,
                fit: BoxFit.cover,),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text('Md. Khalid Hasan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
              ],
            ),
          ],
        ),
        pillColor: Colors.red,
        backgroundColor: Colors.yellow,
    );
  }
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
              child: Row(
               children: [
                 Text('Dark mode'),
                 Padding(padding: EdgeInsets.only(right: 10)),
                 FlutterSwitch(
                     value: status,
                     width: 80,
                     height: 40,
                     borderRadius: 30,
                     valueFontSize: 25,
                     onToggle: (val) {
                       setState(() {
                         status = val;
                       });
                       if(status)
                         MyApp.of(context).changeThemeMode(ThemeMode.dark);
                       else
                         MyApp.of(context).changeThemeMode(ThemeMode.light);
                     },
                     showOnOff: true,
                     activeColor: Colors.green,
                     inactiveColor: Colors.red,
                     )
               ],
              )
          ),
          PopupMenuItem(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 70),),
                  Icon(Icons.people),
                  Padding(padding: EdgeInsets.only(right: 10),),
                  ElevatedButton(onPressed: showDialog, child: Text('About'))
                ],
          ),),

        ],
            offset: Offset(0, 100),
            color: Colors.pinkAccent,
    );
  }
}
