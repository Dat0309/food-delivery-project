class DateTimeModel {
  final String day;
  final String number;
  final String month;
  final String year;

  DateTimeModel(this.day, this.number, this.month, this.year);

  DateTime now = DateTime.now();

  static List<DateTimeModel> dates = [
    DateTimeModel('Thứ Hai', '02', '01', '2023'),
    DateTimeModel('Thứ Ba', '03', '01', '2023'),
    DateTimeModel('Thứ Tư', '04', '01', '2023'),
    DateTimeModel('Thứ Năm', '05', '01', '2023'),
    DateTimeModel('Thứ Sáu', '06', '01', '2023'),
    DateTimeModel('Thứ Bảy', '07', '01', '2023'),
    DateTimeModel('Chủ Nhật', '08', '01', '2023'),
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
