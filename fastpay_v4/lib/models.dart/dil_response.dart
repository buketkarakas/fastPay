class LanguageData {
  final List<ListData> languageList;  

  LanguageData({
    this.languageList,
});

  factory LanguageData.fromJson(List<dynamic> parsedJson) {

    List<ListData> languageList = new List<ListData>();
    languageList = parsedJson.map((i)=>ListData.fromJson(i)).toList();

    return new LanguageData  (
      languageList: languageList
    );
  }
}

class ListData{
  final String name;
  final String code;
  

  ListData({
    this.name,
    this.code,
    
}) ;

  factory ListData.fromJson(Map<String, dynamic> json){
    return new ListData(
      name: json['name'],
      code: json['code'],
    );
  }

  

}
