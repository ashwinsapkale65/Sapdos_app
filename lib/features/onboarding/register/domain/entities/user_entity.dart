class UserEntity {
  String? id;
  String? uId;
  DateTime? createdOn; 
  DateTime? updatedOn; 
  String? createdBy;
  String? updatedBy;
  bool? archived;
  int? version;
  bool? active;
  String? dType;
  String? name;
  String? email;
  String? mobileNumber;
  String? address;
  String? age;
  String? specialization;
  List<String>? documents;
  String? role;
  String? description;
  int? experience;
  String? password;
  String? disease;

  UserEntity({
    this.id,
    this.uId,
    this.createdOn,
    this.updatedOn,
    this.createdBy,
    this.updatedBy,
    this.archived,
    this.version,
    this.active,
    this.dType,
    this.name,
    this.email,
    this.mobileNumber,
    this.address,
    this.age,
    this.specialization,
    this.documents,
    this.role,
    this.description,
    this.experience,
    this.password,
    this.disease,
  });

  UserEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uId = json['uId'];
    createdOn = DateTime.parse(json['createdOn']); 
    updatedOn = DateTime.parse(json['updatedOn']); 
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    archived = json['archived'];
    version = json['version'];
    active = json['active'];
    dType = json['dType'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    address = json['address'];
    age = json['age'];
    specialization = json['specialization'];
    documents = List<String>.from(json['documents'] ?? []);
    role = json['role'];
    description = json['description'];
    experience = json['experience'];
    password = json['password'];
    disease = json['disease'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'uId': uId,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'archived': archived,
      'version': version,
      'active': active,
      'dType': dType,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'address': address,
      'age': age,
      'specialization': specialization,
      'documents': documents,
      'role': role,
      'description': description,
      'experience': experience,
      'password': password,
      'disease': disease,
    };
    if (createdOn != null) {
      data['createdOn'] = createdOn!.toIso8601String(); 
    }
    if (updatedOn != null) {
      data['updatedOn'] = updatedOn!.toIso8601String(); 
    }
    return data;
  }
}
