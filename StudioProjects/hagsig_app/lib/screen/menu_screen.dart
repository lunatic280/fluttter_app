import 'package:flutter/material.dart';
import 'package:hagsig_app/api/menu_api.dart';
import 'package:hagsig_app/model/menu_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  MenuScreenState createState() => MenuScreenState(); // 클래스 이름 변경
}

class MenuScreenState extends State<MenuScreen> { // 클래스 이름 변경
  late Future<List<Menu>> futureMenu;

  @override
  void initState() {
    super.initState();
    futureMenu = MenuApi().fetchMenu(); // API 호출
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu List')),
      body: FutureBuilder<List<Menu>>(
        future: futureMenu,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final menuList = snapshot.data!;
            return ListView.builder(
              itemCount: menuList.length,
              itemBuilder: (context, index) {
                final menu = menuList[index];
                return ListTile(
                  title: Text(menu.sikdanDt),
                  subtitle: Text(menu.menuNm.replaceAll("\\n", "\n")),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
