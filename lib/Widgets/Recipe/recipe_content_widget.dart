import '../../Theme/AppStyles.dart';
import 'package:flutter/material.dart';

class RecipeContentWidget extends StatelessWidget {
  final double opacity;
  final String title1;
  final String title2;
  final String description;

  const RecipeContentWidget(
      {Key key, this.title1, this.title2, this.description, this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Positioned(
      left: 40,
      bottom: 40,
      width: 210,
      child: Opacity(
        opacity: opacity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // TITLE
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: new BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: title1,
                    style: AppStyles.h2,
                    children: <TextSpan>[
                      TextSpan(text: '\n'),
                      TextSpan(text: title2, style: AppStyles.h2_bold),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // CONTENT
            Text(
              description,
              style: AppStyles.bodyFont,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
