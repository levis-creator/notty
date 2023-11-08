import 'package:flutter/material.dart';
import 'package:notty/styles/styles.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.size,
  });

  final dynamic size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width / 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Notty", style: Styles.headLineStyle))),
                  Text(
                    "Recently added",
                    style: Styles.headLineStyle3,
                  )
                ]),
          ),
          Container(
            width: size.width / 2,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.4), BlendMode.dstATop),
                image: const AssetImage("assets/images/img2.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
