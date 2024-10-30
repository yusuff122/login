part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

 
}

class AppEventLogOut extends AppEvent{
  const AppEventLogOut();
  @override
  List<Object?> get props => throw UnimplementedError();

}

class AppEventLogIn extends AppEvent{

  final String email;
  final String password;
  AppEventLogIn({
    required this.email, 
    required this.password
  } );

  @override
  List<Object?> get props => [email, password];

}

class AppEventregister extends AppEvent{

  final String email;
  final String password;
  final String name_surname;
  final String bloodGroup;
  final String city;
  AppEventregister({
    required this.email, 
    required this.password,
    required this.name_surname,
    required this.bloodGroup,
    required this.city
  } );

  @override
  List<Object?> get props => [email, password];

}

class AppEventResetPassword extends AppEvent{

  final String email;
  AppEventResetPassword({
    required this.email, 
  });
  @override
  List<Object?> get props => [email];
}


class AppEventLogInWithGoogle extends AppEvent {
  const AppEventLogInWithGoogle();

  @override
  List<Object?> get props => [];
}
