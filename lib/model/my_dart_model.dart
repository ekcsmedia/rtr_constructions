/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Body {
  String? message;
  Payload? payload;

  Body({this.message, this.payload});

  Body.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    payload = json['payload'] != null ? Payload?.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['payload'] = payload!.toJson();
    return data;
  }
}
class MyPayload {
  Body? body;
  int? statusCodeValue;
  String? statusCode;

  MyPayload({this.body, this.statusCodeValue, this.statusCode});

  MyPayload.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? Body?.fromJson(json['body']) : null;
    statusCodeValue = json['statusCodeValue'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['body'] = body!.toJson();
    data['statusCodeValue'] = statusCodeValue;
    data['statusCode'] = statusCode;
    return data;
  }
}

class Payload {
  String? title;
  String? description;

  Payload({this.title, this.description});

  Payload.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class Root {
  MyPayload? myPayload;

  Root({this.myPayload});

  Root.fromJson(Map<String, dynamic> json) {
    myPayload = json['myPayload'] != null ? MyPayload?.fromJson(json['myPayload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['myPayload'] = myPayload!.toJson();
    return data;
  }
}

