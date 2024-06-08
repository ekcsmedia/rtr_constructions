class CompanyModel {
  bool? admin;
  List<String>? customerIdlist;
  String? id;
  String? loginPin;
  String? name;
  String? phone;
  String? type;
  String? uid;

  CompanyModel(
      {this.admin,
        this.customerIdlist,
        this.id,
        this.loginPin,
        this.name,
        this.phone,
        this.type,
        this.uid});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    admin = json['admin'];
    customerIdlist = json['customerIdlist'].cast<String>();
    id = json['id'];
    loginPin = json['loginPin'];
    name = json['name'];
    phone = json['phone'];
    type = json['type'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin'] = this.admin;
    data['customerIdlist'] = this.customerIdlist;
    data['id'] = this.id;
    data['loginPin'] = this.loginPin;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['uid'] = this.uid;
    return data;
  }
}