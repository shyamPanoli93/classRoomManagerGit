import 'package:flutter/cupertino.dart';

void navigator(BuildContext context,String route){
  Navigator.pushNamed(context, route);
}
void navigatorReplacement(BuildContext context,String route){
  Navigator.pushReplacementNamed(context, route);
}