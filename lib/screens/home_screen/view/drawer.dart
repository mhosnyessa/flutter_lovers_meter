import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CircleAvatar(
            child: Image.asset('../../../../assets/m_hosny.jpg'),
          ),
          ListTile(
            title: Text('Hi Mom'),
          ),
        ],
      ),
    );
  }
}
