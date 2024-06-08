class CustomerModel {
  bool? admin;
  int? balance;
  String? createdbyId;
  String? id;
  Lastmodified? lastmodified;
  String? loginPin;
  String? name;
  String? phone;
  String? type;

  CustomerModel(
      {this.admin,
        this.balance,
        this.createdbyId,
        this.id,
        this.lastmodified,
        this.loginPin,
        this.name,
        this.phone,
        this.type});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    admin = json['admin'];
    balance = json['balance'];
    createdbyId = json['createdbyId'];
    id = json['id'];
    lastmodified = json['lastmodified'] != null
        ? new Lastmodified.fromJson(json['lastmodified'])
        : null;
    loginPin = json['loginPin'];
    name = json['name'];
    phone = json['phone'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin'] = this.admin;
    data['balance'] = this.balance;
    data['createdbyId'] = this.createdbyId;
    data['id'] = this.id;
    if (this.lastmodified != null) {
      data['lastmodified'] = this.lastmodified!.toJson();
    }
    data['loginPin'] = this.loginPin;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['type'] = this.type;
    return data;
  }
}

class Lastmodified {
  int? date;
  int? day;
  int? hours;
  int? minutes;
  int? month;
  int? seconds;
  int? time;
  int? timezoneOffset;
  int? year;

  Lastmodified(
      {this.date,
        this.day,
        this.hours,
        this.minutes,
        this.month,
        this.seconds,
        this.time,
        this.timezoneOffset,
        this.year});

  Lastmodified.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    hours = json['hours'];
    minutes = json['minutes'];
    month = json['month'];
    seconds = json['seconds'];
    time = json['time'];
    timezoneOffset = json['timezoneOffset'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['day'] = this.day;
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    data['month'] = this.month;
    data['seconds'] = this.seconds;
    data['time'] = this.time;
    data['timezoneOffset'] = this.timezoneOffset;
    data['year'] = this.year;
    return data;
  }
}