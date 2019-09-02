class YardimMenu {
  String hash;
  Menu menu;

  YardimMenu({this.hash, this.menu});

  factory YardimMenu.fromJson(Map<String, dynamic> parsedJson) {
    return YardimMenu(
        hash: parsedJson["hash"], menu: Menu.fromJson(parsedJson["menu"]));
  }
}

class Menu {
  final String title;

  final List<SubMenu> submenu;

  Menu({
    this.title,
    this.submenu,
  });

  factory Menu.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['subMenus'] as List;
    print(list.runtimeType);
    List<SubMenu> submenuList = list.map((i) => SubMenu.fromJson(i)).toList();

    return Menu(title: parsedJson['title'], submenu: submenuList);
  }
}

class SubMenu {
  final String title;
  final List<SubMenu2> subMenu2;

  SubMenu({this.title, this.subMenu2});

  factory SubMenu.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['subMenus'] as List;
    print(list.runtimeType);
    List<SubMenu2> submenuList2 =
        list.map((i) => SubMenu2.fromJson(i)).toList();

    return SubMenu(title: parsedJson['title'], subMenu2: submenuList2);
  }
}

class SubMenu2 {
  final String title;
  final List<SubMenu3> subMenu3;

  SubMenu2({this.title, this.subMenu3});

  factory SubMenu2.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['subMenus'] as List;
    print(list.runtimeType);
    List<SubMenu3> submenuList3 =
        list.map((i) => SubMenu3.fromJson(i)).toList();

    return SubMenu2(title: parsedJson['title'], subMenu3: submenuList3);
  }
}

class SubMenu3 {
  String title;

  SubMenu3({this.title});

  factory SubMenu3.fromJson(Map<String, dynamic> parsedJson) {
    return SubMenu3(title: parsedJson["title"]);
  }
}
