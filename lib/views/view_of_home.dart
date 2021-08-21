import 'package:bloc_patterns_contacts/pages/models/contact_model.dart';
import 'package:flutter/material.dart';

import 'item_of_contact.dart';

Widget viewOfHome(BuildContext context, List<Contact> items, bool isLoading) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return itemOfList(context: context, contact: items[index]);
                  },
                ),
              ),
            )
          ],
        ),
      ),

      isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : SizedBox.shrink(),
    ],
  );
}