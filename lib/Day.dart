class Autogenerated {
  List<Day> day;

  Autogenerated({this.day});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['day'] != null) {
      day = new List<Day>();
      json['day'].forEach((v) {
        day.add(new Day.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.day != null) {
      data['day'] = this.day.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Day {
  String day;
  String date;
  List<Activity> activity;

  Day({this.day, this.date, this.activity});

  Day.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    date = json['date'];
    if (json['activity'] != null) {
      activity = new List<Activity>();
      json['activity'].forEach((v) {
        activity.add(new Activity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['date'] = this.date;
    if (this.activity != null) {
      data['activity'] = this.activity.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activity {
  String desc;
  String endtime;
  String starttime;

  Activity({this.desc, this.endtime, this.starttime});

  Activity.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    endtime = json['endtime'];
    starttime = json['starttime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['endtime'] = this.endtime;
    data['starttime'] = this.starttime;
    return data;
  }
}