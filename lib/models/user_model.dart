import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
