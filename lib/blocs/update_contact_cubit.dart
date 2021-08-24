import 'package:bloc_patterns_contacts/blocs/update_contact_state.dart';
import 'package:bloc_patterns_contacts/models/contact_model.dart';
import 'package:bloc_patterns_contacts/services/http_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateContactCubit extends Cubit<UpdateContactState>  {
  UpdateContactCubit() : super(UpdateContactInit());


  void apiContactUpdate(Contact contact) async{
    print(contact.toJson());
    emit(UpdateContactLoading());
    final response = await Network.PUT(Network.API_UPDATE + contact.id.toString(), Network.paramsUpdate(contact));
    print(response);
    if (response != null) {
      emit(UpdateContactLoaded(isUpdated: true));
    } else {
      emit(UpdateContactError(error: "Couldn't update post"));
    }
  }
}