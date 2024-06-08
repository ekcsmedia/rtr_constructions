class AttachmentsModel {
  String? downloadUrl;
  String? filename;
  String? id;
  String? size;
  String? transactionId;

  AttachmentsModel(
      {this.downloadUrl,
        this.filename,
        this.id,
        this.size,
        this.transactionId});

  AttachmentsModel.fromJson(Map<String, dynamic> json) {
    downloadUrl = json['downloadUrl'];
    filename = json['filename'];
    id = json['id'];
    size = json['size'];
    transactionId = json['transactionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['downloadUrl'] = this.downloadUrl;
    data['filename'] = this.filename;
    data['id'] = this.id;
    data['size'] = this.size;
    data['transactionId'] = this.transactionId;
    return data;
  }
}