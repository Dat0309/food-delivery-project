class ResponseModel {
  late bool _isSuccess;
  late String _message;

  ResponseModel(this._isSuccess, this._message);

  String get message => _message;
  bool get isSuccess => _isSuccess;

  ResponseModel.fromJson(Map json) {
    _isSuccess = json['success'];
    _message = json['message'];
  }
}
