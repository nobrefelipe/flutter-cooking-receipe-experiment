import 'package:flutter/material.dart';

class RecipeBackgroundWidget extends StatelessWidget {
  final Color backgroundColor;
  final String recipeId;

  const RecipeBackgroundWidget({
    Key key,
    this.backgroundColor,
    this.recipeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 15, right: 50),
      child: Hero(
        tag: "recipe-bg-$recipeId",
        child: Container(
         
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                offset: Offset(20.0, 20.0),
                blurRadius: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
