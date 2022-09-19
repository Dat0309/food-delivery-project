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
    '10:00 AM',
    '11:30 AM',
    '12:50 AM',
    '1:30 AM',
    '2:30 PM',
    '3:30 PM',
    '4:00 PM',
    '5:30 PM',
    '7:30 PM',
    '8:00 PM',
    '8:30 PM',
    '9:00 PM',
    '9:30 PM',
  ];
}
