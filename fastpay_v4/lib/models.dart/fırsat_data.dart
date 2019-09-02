class CampaignData {
  final List<ListData> campaignList;  

  CampaignData({
    this.campaignList,
});

  factory CampaignData.fromJson(List<dynamic> parsedJson) {

    List<ListData> campaignList = new List<ListData>();
    campaignList = parsedJson.map((i)=>ListData.fromJson(i)).toList();

    return new CampaignData  (
      campaignList: campaignList
    );
  }
}

class ListData{
  final String text;
  final String title;
  final String url;
  final String subtitle;
  final String url2;

  ListData({
    this.text,
    this.url,
    this.title,
    this.subtitle,
    this.url2
}) ;

  factory ListData.fromJson(Map<String, dynamic> json){
    return new ListData(
      text: json['text'],
      title: json['title'],
      url: json['headerImage'],
      subtitle: json["subtitle"],
      url2: json["bodyImage"]
    );
  }

  

}
