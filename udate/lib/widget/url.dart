import 'package:url_launcher/url_launcher.dart';
/*

class Url {
  static String host = "sites.google.com";
  static String principles = "view/udat-system/the-principles";
  static String principlesFragment = 'h.iyo4ftl287n4';
  static String website = 'view/udat-system/home';

  static Uri example = Uri(
      scheme: 'https',
      host: "sites.google.com",
      path: "view/udat-system/the-principles",
      fragment: 'h.iyo4ftl287n4'
  );

  Future<void> launchFormatExample() async {
    if (!await launchUrl(example, mode: LaunchMode.externalApplication,)) {
      throw 'Could not launch $example';
    }
  }
}
*/

Future<void> launchURL({bool example=false}) async {
  /*
  String host = "sites.google.com";
  String principles = "view/udat-system/the-principles";
  String principlesFragment = 'h.iyo4ftl287n4';
  String website = 'view/udat-system/home';
  */
  Uri exampleUri = Uri(
      scheme: 'https',
      host: "sites.google.com",
      path: "view/udat-system/the-principles",
      fragment: 'h.iyo4ftl287n4'
  );
  Uri url;
  if(example){url=exampleUri;}
  else{url=exampleUri;}

  if (!await launchUrl(url, mode: LaunchMode.externalApplication,)) {
    throw 'Could not launch $url';
  }
}