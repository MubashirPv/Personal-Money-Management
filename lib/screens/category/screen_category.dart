import 'package:flutter/material.dart';
import 'package:money_mangement/Screens/category/widget/expense_list.dart';
import 'package:money_mangement/Screens/category/widget/income_list.dart';

import '../../db/Category/category_db.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDb().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: Color.fromARGB(255, 22, 21, 21),
          controller: _tabController,
          labelColor: Color.fromARGB(255, 102, 97, 97),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              text: 'INCOME',
            ),
            Tab(
              text: 'EXPENSE',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              IncomeCategory(),
              ExpenseCategory(),
            ],
          ),
        ),
      ],
    );
  }
}
