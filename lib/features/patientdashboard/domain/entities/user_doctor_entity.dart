class UserWithDoctor {
  User? user;
  List<DoctorsList>? doctorsList;

  UserWithDoctor({this.user, this.doctorsList});

  UserWithDoctor.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['doctorsList'] != null) {
      doctorsList = <DoctorsList>[];
      json['doctorsList'].forEach((v) {
        doctorsList!.add(new DoctorsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.doctorsList != null) {
      data['doctorsList'] = this.doctorsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? greeting;
  String? name;
  String? avatar;

  User({this.greeting, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    greeting = json['greeting'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['greeting'] = this.greeting;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}

class DoctorsList {
  String? doctorImage;
  String? doctorName;
  String? specialization;
  String? appointmentIcon;
  int? price;

  DoctorsList(
      {this.doctorImage,
      this.doctorName,
      this.specialization,
      this.appointmentIcon,
      this.price});

  DoctorsList.fromJson(Map<String, dynamic> json) {
    doctorImage = json['doctorImage'];
    doctorName = json['doctorName'];
    specialization = json['specialization'];
    appointmentIcon = json['appointmentIcon'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctorImage'] = this.doctorImage;
    data['doctorName'] = this.doctorName;
    data['specialization'] = this.specialization;
    data['appointmentIcon'] = this.appointmentIcon;
    data['price'] = this.price;
    return data;
  }
}
