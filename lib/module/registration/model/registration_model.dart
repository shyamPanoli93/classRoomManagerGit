class RegistrationModel {
  RegistrationModel({
    required this.registrations,
  });
  late final List<Registrations> registrations;

  RegistrationModel.fromJson(Map<String, dynamic> json){
    registrations = List.from(json['registrations']).map((e)=>Registrations.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['registrations'] = registrations.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Registrations {
  Registrations({
    required this.id,
    required this.student,
    required this.subject,
  });
  late final int id;
  late final int student;
  late final int subject;

  Registrations.fromJson(Map<String, dynamic> json){
    id = json['id'];
    student = json['student'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['student'] = student;
    _data['subject'] = subject;
    return _data;
  }
}