import 'package:bloc_patterns_contacts/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../blocs/list_contact_cubit.dart';

Widget itemOfList({BuildContext context, Contact contact}) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.2,
    child: ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.green,
        ),
        child: Icon(Icons.phone, color: Colors.white, size: 30,),
      ),
      title: Text(contact.fullname??'', style: TextStyle(color: Colors.blue),),
      subtitle: Text(contact.phone?? ''),
    ),
    actions: <Widget>[
      IconSlideAction(
        caption: 'Update',
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {
        },
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          BlocProvider.of<ListContactCubit>(context).apiContactDelete(contact);
        },
      ),
    ],
  );
}