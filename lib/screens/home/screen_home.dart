import 'package:flutter/material.dart';
import 'package:money_mangement/Screens/Transactions/add-transaction.dart';
import 'package:money_mangement/Screens/Transactions/screen_transaction.dart';
import 'package:money_mangement/Screens/Transactions/widgets/bottom_nav.dart';
import 'package:money_mangement/Screens/category/screen_category.dart';
import 'package:money_mangement/Screens/category/widget/category_add_popup.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = const [
    ScreenTransactions(),
    ScreenCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 235, 247),
      appBar: AppBar(
        title: const Text('Money Manager'),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('add transaction');
            Navigator.of(context).pushNamed(AddTransaction.routeName);
          } else {
            ShowCategoryAddPopup(context);

            // final _sample = CategoryModel(
            //     id: DateTime.now().microsecondsSinceEpoch.toString(),
            //     name: 'Travel',
            //     type: CategoryType.expense);
            // CategoryDb().insertCategory(_sample);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
