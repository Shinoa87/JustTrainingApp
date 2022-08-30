import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:just_training_app/widgets/widgets.dart';

class UserModel extends Equatable {
  final String email;
  final String username;
  final String password;

  const UserModel({
    required this.password,
    required this.email,
    required this.username
  });

  UserModel copyWith({
    String? email,
    String? password,
    String? username,
  }) {
    return UserModel(
      email:  email ?? this.email,
      password:  password ?? this.password,
      username:  username ?? this.username,
    );
  }


  static UserModel fromSnapshot(DocumentSnapshot snap) {
    UserModel user = UserModel(
      email: snap['email'],
      password: snap['password'],
      username: snap['username'],
    );
    return user;
  }

  @override
  List<Object?> get props => [
    email,
    password,
    username,
  ];

  Map<String, dynamic> toMap(){
    return {
      'email': email,
      'username': username,
      'password': password,
    };
  }
}