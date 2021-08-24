
import 'package:bloc_patterns_contacts/blocs/creat_contact_cubit.dart';
import 'package:bloc_patterns_contacts/blocs/creat_contact_state.dart';
import 'package:bloc_patterns_contacts/views/view_of_creat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool isLoading = false;
  TextEditingController fullnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  _finish(BuildContext context) {SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Post"),
        ),
        body: BlocBuilder<CreateContactCubit, CreateContactState>(
          builder: (BuildContext context, CreateContactState state) {
            if(state is CreateContactLoading){
              return viewOfCreate(true,context,fullnameController,phoneController);
            }
            if(state is CreateContactLoaded){
              _finish(context);
            }
            if(state is CreateContactError){

            }
            return viewOfCreate(false,context,fullnameController,phoneController);
          },
        ),
      ),
    );
  }
}
