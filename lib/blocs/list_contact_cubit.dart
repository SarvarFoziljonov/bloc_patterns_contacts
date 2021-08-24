import 'package:bloc_patterns_contacts/models/contact_model.dart';
import 'package:bloc_patterns_contacts/pages/creat_page.dart';
import 'package:bloc_patterns_contacts/services/http_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_contact_state.dart';

class ListContactCubit extends Cubit<ListContactState> {
  ListContactCubit() : super(ListContactInit());

  Future<void> apiListContact() async {
    emit(ListContactLoading());
    String response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      emit(ListContactLoaded(contacts: Network.parseContactList(response)));
    } else {
      emit(ListContactError(error: "Couldn't fetch contacts"));
    }
  }


  Future<void> apiContactDelete(Contact contact) async {
    emit(ListContactLoading());
    String response = await Network.DEL(Network.API_DELETE + contact.id, Network.paramsEmpty());
    if (response != null) {
      apiListContact();
    } else {
      emit(ListContactError(error: "Couldn't delete contact"));
    }
  }

  callCreatePage(BuildContext context) async {
    var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePage()));
    if (result != null) {
      return BlocProvider.of<ListContactCubit>(context).apiListContact();
    }
  }


}