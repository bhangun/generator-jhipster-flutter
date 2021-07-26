
import 'package:provider/single_child_widget.dart';

abstract class Module {
  String? name;
  List<Page> pages();
  void services();
  List<SingleChildWidget> providers();
  List routes();
}

class Page{
  String? name;
  String? title;
  String? route;
  bool showInDrawer;
  bool showInHome;

  Page(
      {
        this.name,
        this.title,
        this.route,
        this.showInDrawer = false,
        this.showInHome = false});
}
