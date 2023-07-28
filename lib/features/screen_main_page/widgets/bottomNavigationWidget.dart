import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (BuildContext context, int newIndex, _) {
        return BottomNavigationBar(
          onTap: (value) {
            indexChangeNotifier.value = value;
          },
          currentIndex: newIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_dash),
              label: 'List',
            ),
          ],
        );
      },
    );
  }
}
