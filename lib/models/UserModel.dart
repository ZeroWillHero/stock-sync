import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? role;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.role = "ref"
  });


  toJson () {
    return {
      "firstName" : firstName,
      "lastName" : lastName,
      "email" : email,
      "password" : password,
      "role" : role,

    };
  }

  // map user fetch data
 factory User.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return User(
      id : document.id,
      firstName : data['firstName'],
      lastName : data['lastName'],
      email : data['email'],
      password : data['password'],
      role : data['role']

    );
 }
}