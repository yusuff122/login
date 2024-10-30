part of 'app_bloc.dart';

sealed class AppState extends Equatable {

  final bool isLoading;
  final bool succeful;
  const AppState({
    required this.isLoading,
    required this.succeful
  });
  
  @override
  List<Object> get props => [];
}

class AppStateLoggedIn extends AppState {

  AppStateLoggedIn({required isLoading, required succeful})
  :super(isLoading: isLoading, succeful: succeful);
 
  @override
  List<Object> get props => [isLoading,succeful];
}

class AppStateLogOut extends AppState {

  AppStateLogOut({required isLoading, required succeful})
  :super(isLoading: isLoading, succeful: succeful);
 
  @override
  List<Object> get props => [isLoading,succeful];
}