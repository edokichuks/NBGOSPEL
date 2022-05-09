import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nbgospel/uka/message.dart';
import 'package:nbgospel/uka/settings.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {



  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Container(
                  child: Image.asset('assets/NBG logo.jpg',
                  fit: BoxFit.fill,
                  ),

                  height: 150,
                ),
                Container( color: Colors.grey.shade900,

                  child: Column(
                    children: [
                      buildListTile('Christain Articles', Icons.article, () {}),
                      buildListTile('Christain News', Icons.new_releases_sharp, () {}),
                      buildListTile('Christain Messages', Icons.message_outlined, () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Message()));
                      }),
                      buildListTile('Biography', Icons.account_box_outlined, () {}),
                      buildListTile(
                          'Online Live Sermon', Icons.account_box_outlined, () {}),
                      buildListTile('LATEST SERMONS', Icons.new_releases, () {}),
                      const Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      buildListTile('Settings', Icons.settings, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Settings(),
                            ),);
                      }),
                      WillPopScope(
                        onWillPop: () => _onExistApp(context),
                        child: buildListTile('Exit', Icons.logout, () {
                        //  Navigator.pop(context);
                          _onExistApp(context);
                        }),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }

  Widget buildListTile(String text, IconData icon, VoidCallback click) {
    return SizedBox(
      height: 81.35,
      child: ListTile(
        onTap: click,
        tileColor: Colors.black,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        hoverColor: Colors.grey,
        title: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

 Future<bool> _onExistApp(BuildContext context)async {
   bool exitApp = await showDialog(context: context,
       builder: (context) => new AlertDialog(
     title: Text('Are you sure?'),
     content: Text('Do want to exit from nbGospel?'),
     actions: [

       FlatButton(
         onPressed: (){
           SystemNavigator.pop();

         },
         child: Text('EXIT'),
       ),  FlatButton(
         onPressed: (){
           Navigator.of(context).pop(false);
         },
         child: Text('CANCEL'),
       ),
     ],
   ));

      return exitApp ? false : true;

 }
}
