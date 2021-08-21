import 'package:bloc_patterns_contacts/pages/models/contact_model.dart';
import 'package:equatable/equatable.dart';

abstract class ListContactState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListContactInit extends ListContactState{}

class ListContactLoading extends ListContactState{}

class ListContactLoaded extends ListContactState{
  final List<Contact> contacts;
  final bool isDeleted;

  ListContactLoaded({this.contacts, this.isDeleted});
}

class ListContactError extends ListContactState{
  final error;

  ListContactError({this.error});
}