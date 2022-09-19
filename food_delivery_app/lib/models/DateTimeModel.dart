class DateTimeModel {
  final String day;
  final String number;

  DateTimeModel(this.day, this.number);

  DateTime now = DateTime.now();

  static List<DateTimeModel> dates = [
    DateTimeModel('Thứ Hai', '1'),
    DateTimeModel('Thứ Ba', '2'),
    DateTimeModel('Thứ Tư', '3'),
    DateTimeModel('Thứ Năm', '4'),
    DateTimeModel('Thứ Sáu', '5'),
    DateTimeModel('Thứ Bảy', '6'),
    DateTimeModel('Chủ Nhật', '7'),
  ];

  static List<String> times = [
    '11:30 AM',
    '12:50 AM',
    '3:30 PM',
    '5:30 PM',
    '7:30 PM',
  ];
}
