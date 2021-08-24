import 'package:bloc_patterns_contacts/blocs/update_contact_cubit.dart';
import 'package:bloc_patterns_contacts/blocs/update_contact_state.dart';
import 'package:bloc_patterns_contacts/models/contact_model.dart';
import 'package:bloc_patterns_contacts/views/view_of_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePage extends StatelessWidget {
  Contact contact;

  UpdatePage({this.contact});

  TextEditingController fullnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    fullnameController.text = contact.fullname;
    phoneController.text = contact.phone;

    return BlocProvider(
      create: (context) => UpdateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update a Contact"),
        ),
        body: BlocBuilder<UpdateContactCubit, UpdateContactState>(
          builder: (BuildContext context, UpdateContactState state) {
            if(state is UpdateContactLoading){
              String fullname = fullnameController.text.toString();
              String phone = phoneController.text.toString();
              Contact contact = Contact( id: this.contact.id,fullname: fullname, phone: phone);
              return viewOfUpdate(true,context,contact, fullnameController, phoneController);
            }
            if(state is UpdateContactLoaded){
              _finish(context);
            }
            if(state is UpdateContactError){

            }
            return viewOfUpdate(false,context,contact, fullnameController, phoneController);
          },
        ),
      ),
    );
  }

}