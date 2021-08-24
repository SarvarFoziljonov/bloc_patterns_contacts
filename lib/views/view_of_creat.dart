import 'package:bloc_patterns_contacts/blocs/creat_contact_cubit.dart';
import 'package:bloc_patterns_contacts/models/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget viewOfCreate (bool isLoading, BuildContext context, TextEditingController fullnameController, TextEditingController phoneController) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: fullnameController,
              decoration: InputDecoration(
                  hintText: "Fullname",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Contact contact = Contact( fullname: fullnameController.toString(), phone: phoneController.toString(), );
                BlocProvider.of<CreateContactCubit>(context).apiPostCreate(contact);
              },
              color: Colors.black,
              child: Text("Create a contact", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
        isLoading ? Center(
          child: CircularProgressIndicator(),
        ): SizedBox.shrink(),
      ],
    ),
  );
}