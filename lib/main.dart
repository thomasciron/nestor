import 'package:flutter/material.dart';
class User
{
  MaterialColor color = Colors.orange;
  Color textColor = Colors.white;
  String name = "Thomas";
}
User user = User();
void main()
{
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(scaffoldBackgroundColor: const Color(0x0fffefef)),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    User user = User();
    return Scaffold(
      appBar : genAppBar("Nestor"),
      body: Center(
        child: Text(
          'Bonjour ' + user.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'IndieFlower',
            color: user.textColor,
          ),
        ),
      ),
      drawer: NavigationDrawerWidget(),
    );
  }
}

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    User user = User();
    return Drawer(
      child: Container(
        color: user.color,
        child: ListView(
            children: <Widget>[
              const SizedBox(height:48),
              buildMenuItem(
                text: 'Sport',
                onClicked: () =>selectedItem(context, 0),
              ),
              buildMenuItem(
                text: 'Notes',
                onClicked: () =>selectedItem(context, 1),
              ),
              buildMenuItem(
                text: 'Où suis-je garé ?  ',
                onClicked: () =>selectedItem(context, 2),
              ),
              Divider(color: Colors.white70),
              buildMenuItem(
                text: 'Paramètres',
                onClicked: () =>selectedItem(context, 100),
              ),
            ]
        ),
      ),
    );
  }
}

Widget buildMenuItem ({
  required String text,
  VoidCallback? onClicked,
}
    ){
  User user = User();
  return ListTile(
    title: Text(text, style: TextStyle(color: user.textColor, fontFamily: 'IndieFlower', fontSize: 17.0)),
    hoverColor: Colors.white70,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index)
{
  Navigator.of(context).pop();
  if(index == 0) Navigator.of(context).push(MaterialPageRoute(builder: (context) => SportPage()));
  if(index == 1) Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotesPage()));
  if(index == 2) Navigator.of(context).push(MaterialPageRoute(builder: (context) => LocationPage()));
  if(index == 100) Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPage()));
}

AppBar genAppBar(String title) => AppBar(
  title: Text(title,
      style: TextStyle(
        fontFamily: 'IndieFlower',
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      )),
  centerTitle: true,
  backgroundColor: user.color,
);

class SportPage extends StatelessWidget
{
  Widget build(BuildContext context) => Scaffold(appBar: genAppBar("Sport"));
}


class NotesPage extends StatelessWidget
{
  Widget build(BuildContext context) => Scaffold(appBar: genAppBar("Notes"));

}

class LocationPage extends StatelessWidget
{
  Widget build(BuildContext context) => Scaffold(appBar: genAppBar("Où suis-je garé ?"));

}

class SettingsPage extends StatelessWidget
{
  Widget build(BuildContext context) => Scaffold(appBar: genAppBar("Paramètres"));

}