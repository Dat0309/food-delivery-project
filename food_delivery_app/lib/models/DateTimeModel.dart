class DateTimeModel {
  final String day;
  final String number;
  final String month;
  final String year;

  DateTimeModel(this.day, this.number, this.month, this.year);

  DateTime now = DateTime.now();

  static List<DateTimeModel> dates = [
    DateTimeModel('Thứ Hai', '21', '11', '2022'),
    DateTimeModel('Thứ Ba', '22', '11', '2022'),
    DateTimeModel('Thứ Tư', '23', '11', '2022'),
    DateTimeModel('Thứ Năm', '24', '11', '2022'),
    DateTimeModel('Thứ Sáu', '25', '11', '2022'),
    DateTimeModel('Thứ Bảy', '26', '11', '2022'),
    DateTimeModel('Chủ Nhật', '27', '11', '2022'),
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
