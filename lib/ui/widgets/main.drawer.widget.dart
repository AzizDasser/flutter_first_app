import 'package:first_app/ui/widgets/drawer.item.widget.dart';
import 'package:flutter/material.dart';

import 'main.drawer.header.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> menus=[
      {"title":"Home","route":"/","leadingIcon": Icons.home,"trailingIcon": Icons.arrow_forward,},
      {"title":"Counter Stateful","route":"/counter1","leadingIcon": Icons.event,"trailingIcon": Icons.arrow_forward,},
      {"title":"Counter Bloc","route":"/counter2","leadingIcon": Icons.timer,"trailingIcon": Icons.arrow_forward,},
      {"title":"Git users","route":"/users","leadingIcon": Icons.person,"trailingIcon": Icons.arrow_forward,},
      {"title":"QRCode","route":"/qrcode","leadingIcon": Icons.qr_code,"trailingIcon": Icons.arrow_forward,},
    ];
    return Drawer(
      child: Column(
        children: [
          const MainDrawerHeader(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return DrawerItemWidget(
                      title: menus[index]["title"],
                      leadingIcon: menus[index]["leadingIcon"],
                      trailingIcon: menus[index]["trailingIcon"],
                      onAction: (){
                        Navigator.pop(context);
                        Navigator.pushNamed(context, menus[index]["route"]);
                      }
                  );
                },


                separatorBuilder: (context,index){
                  return const Divider(height: 6,);
                },

                itemCount: menus.length )
          )
        ],
      ),
    );
  }
}
