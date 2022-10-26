import 'package:flutter/material.dart';

import '../../../db/Category/category_db.dart';
import '../../../models/category/category_model.dart';


class IncomeCategory extends StatelessWidget {
  const IncomeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDb().incomeCategoryListListener,
        builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final category = newList[index];
              return Card(
                child: ListTile(
                  title: Text(category.name),
                  leading: IconButton(
                    color: Colors.blue,
                    onPressed: () {
                      //update screen
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  trailing: IconButton(
                    color: Colors.red,
                    onPressed: () {
                      CategoryDb.instance.deleteCategory(category.id); //alert
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  onTap: () {
                    //transactions under category.id
                  },
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: newList.length,
          );
        });
  }
}
