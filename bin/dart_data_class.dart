import 'dart:convert';

void main() {
  final personString =
      '{"id": 1,"name":"John Doe","email":"johndoe@gmail.com"}';
  final personJson = jsonDecode(personString);
  print('runtimeType: ${personString.runtimeType}');
  print(personString);
  print('runtimeType: ${personJson.runtimeType}');
  print(personJson);

  final p1 = Person(id: 1, name: "John Doe", email: "johndoe@gmail.com");
  print(p1);

  final remotePerson =
      '{"id": 2,"name":"Jane Doe","email":"janedoe@gmail.com"}';
  final remoteJson = jsonDecode(remotePerson);
  final p2 = Person.fromJson(remoteJson);
  print(p2);

  final p3 = Person(id: 3, name: "Everest", email: 'everest@gmail.com');
  final p4 = Person(id: 3, name: "Everest", email: 'everest@gmail.com');
  print('p3 == p4: ${p3 == p4}');

  final p33 = p3;
  print('p3 == p33: ${p3 == p33}');
}

class Person {
  final int id;
  final String name;
  final String email;
  Person({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  Person copyWith({
    int? id,
    String? name,
    String? email,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return "Person(id: $id, $name: $name, email: $email)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}
