import 'package:bloc_patterns_contacts/blocs/update_contact_cubit.dart';
import 'package:bloc_patterns_contacts/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context, Contact contact,TextEditingController fullnameController, TextEditingController phoneController){
  return Container(
    padding: EdgeInsets.all(30),
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
                BlocProvider.of<UpdateContactCubit>(context).apiContactUpdate(contact);
              },
              color: Colors.blue,
              child: Text(
                "Update a Post",
                style: TextStyle(color: Colors.white),
              ),
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