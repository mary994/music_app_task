import 'package:flutter/material.dart';

class AppbarSearchButton extends StatelessWidget {
  AppbarSearchButton({
    @required this.onClick,
    Key? key,
  }) : super(key: key);
  Function? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
