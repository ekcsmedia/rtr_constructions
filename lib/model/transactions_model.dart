class TransactionsModel {
  int? amount;
  String? companyId;
  Createddate? createddate;
  Createddate? date;
  String? details;
  String? id;
  String? receiverId;
  String? senderId;

  TransactionsModel(
      {this.amount,
        this.companyId,
        this.createddate,
        this.date,
        this.details,
        this.id,
        this.receiverId,
        this.senderId});

  TransactionsModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    companyId = json['companyId'];
    createddate = json['createddate'] != null
        ? new Createddate.fromJson(json['createddate'])
        : null;
    date = json['date'] != null ? new Createddate.fromJson(json['date']) : null;
    details = json['details'];
    id = json['id'];
    receiverId = json['receiverId'];
    senderId = json['senderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['companyId'] = this.companyId;
    if (this.createddate != null) {
      data['createddate'] = this.createddate!.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    data['details'] = this.details;
    data['id'] = this.id;
    data['receiverId'] = this.receiverId;
    data['senderId'] = this.senderId;
    return data;
  }
}

class Createddate {
  int? date;
  int? day;
  int? hours;
  int? minutes;
  int? month;
  int? seconds;
  int? time;
  int? timezoneOffset;
  int? year;

  Createddate(
      {this.date,
        this.day,
        this.hours,
        this.minutes,
        this.month,
        this.seconds,
        this.time,
        this.timezoneOffset,
        this.year});

  Createddate.fromJson(Map<String, dynamic> json) {
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