import 'package:bloc_patterns_contacts/blocs/list_contact_cubit.dart';
import 'package:bloc_patterns_contacts/blocs/list_contact_state.dart';
import 'package:bloc_patterns_contacts/models/contact_model.dart';
import 'package:bloc_patterns_contacts/views/view_of_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> items = [];

  @override
  void initState() {
    super.initState();
   BlocProvider.of<ListContactCubit>(context).apiListContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Bloc Contacts', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      ),
      body: BlocBuilder<ListContactCubit, ListContactState>(
        builder: (context, state) {
          if(state is ListContactError) {
            return viewOfHome(context, items, true);
          }
          if(state is ListContactLoaded) {
            items = state.contacts;
            return viewOfHome(context, items, false);
          }

          return viewOfHome(context, items, true);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: () {
          BlocProvider.of<ListContactCubit>(context).callCreatePage(context);
        },
      ),
    );
  }
}
