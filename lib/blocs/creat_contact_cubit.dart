import 'package:bloc_patterns_contacts/blocs/creat_contact_state.dart';
import 'package:bloc_patterns_contacts/models/contact_model.dart';
import 'package:bloc_patterns_contacts/services/http_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateContactCubit extends Cubit<CreateContactState>  {
  CreateContactCubit() : super(CreateContactInit());

  void apiPostCreate(Contact contact) async{
    print(contact.toJson());
    emit(CreateContactLoading());
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(contact));
    print(response);
    if (response != null) {
      emit(CreateContactLoaded(isCreated: true));
    } else {
      emit(CreateContactError(error: "Couldn't create post"));
    }
  }
}