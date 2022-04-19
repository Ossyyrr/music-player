import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          Icon(FontAwesomeIcons.chevronLeft),
          Spacer(),
          Icon(FontAwesomeIcons.comment),
          SizedBox(width: 20),
          Icon(FontAwesomeIcons.headphones),
          SizedBox(width: 20),
          Icon(FontAwesomeIcons.fileExport),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
