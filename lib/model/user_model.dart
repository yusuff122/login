import 'package:equatable/equatable.dart';

class UserModel extends Equatable{

  final String userId;
  final String email;
  final String name;

  const UserModel({
   required this.userId,
   required this.email,
   required this.name
  });

  static const empty = UserModel(userId: "", email: "", name: "");

  UserModel copyWith({
    String? userId,
    String? email,
    String? name
  }){
   return UserModel(
   userId: userId ??  this.userId,
   email: email ?? this.email,
   name: name ?? this.name
  );}

  
  @override  
  List<Object?> get props => [userId, email, name];

}