import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/features/drawer/view_data/drawer_item_list.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.deviceSize;
    return Drawer(
        width: size.width / 1.8,
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),
                  16.height,
                  Text("WELLCOME MY TODO",style: context.appTextTheme.titleLarge,),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = DrawerItemList.drawerItems[index];
                return ListTile(
                  title: Text(
                    item["title"],
                  ),
                  trailing: Icon(
                    item["icon"],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemCount: DrawerItemList.drawerItems.length,
            ),
          ],
        ));
  }
}
