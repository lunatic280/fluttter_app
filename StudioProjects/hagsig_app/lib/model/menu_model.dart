// menu_model.dart
class Menu {  // 클래스 이름을 _Menu에서 Menu로 변경
  final String sikdanDt;
  final String menuNm;

  Menu({required this.sikdanDt, required this.menuNm});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      sikdanDt: json['SIKDAN_DT'],
      menuNm: json['MENU_NM'] ?? '',
    );
  }
}
