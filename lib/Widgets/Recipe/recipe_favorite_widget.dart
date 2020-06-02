import 'package:flutter/material.dart';
import '../../Theme/AppStyles.dart';

class FavoriteWidget extends StatelessWidget {
  final double opacity;
  final bool isFavorite;

  const FavoriteWidget({
    Key key,
    this.opacity,
    this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 5,
      child: Opacity(
        /* Show the favorite button only for the current slide*/
        opacity: opacity,
        //
        child: Container(
          decoration: BoxDecoration(
            color: isFavorite ? AppStyles.primaryColor : Colors.white54,
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            border: isFavorite
                ? Border.all(color: Colors.transparent, width: 1)
                : Border.all(color: AppStyles.primaryColor, width: 1),
            boxShadow: <BoxShadow>[
              if (isFavorite)
                BoxShadow(
                  color: AppStyles.primaryColor_Alpha,
                  offset: Offset(5.0, 5.0),
                  blurRadius: 8.0,
                ),
            ],
          ),
          child: IconButton(
            color: isFavorite ? Colors.white : AppStyles.primaryColor,
            splashColor: AppStyles.primaryColor_Alpha,
            highlightColor: AppStyles.primaryColor_Alpha,
            iconSize: 18,
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
