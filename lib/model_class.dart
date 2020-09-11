
class Records {
  Records({
    this.id,
    this.title,
    this.shortDescription,
    this.collectedValue,
    this.totalValue,
    this.startDate,
    this.endDate,
    this.mainImageUrl,
  });

  int id;
  String title;
  String shortDescription;
  int collectedValue;
  int totalValue;
  String startDate;
  String endDate;
  String mainImageUrl;

  factory Records.fromJson(Map<String, dynamic> json) => Records(
    id: json["Id"] as int ,
    title: json["title"]as String,
    shortDescription: json["shortDescription"]as String,
    collectedValue: json["collectedValue"]as int,
    totalValue: json["totalValue"]as int,
    startDate: json["startDate"]as String,
    endDate: json["endDate"]as String,
    mainImageUrl: json["mainImageURL"]as String,
  );

}
