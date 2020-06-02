import 'package:flutter/material.dart';

class RecipeImageWidget extends StatelessWidget {
  final double ratationFactor;
  final String imagePath;
  final String recipeId;

  const RecipeImageWidget({
    Key key,
    this.recipeId,
    this.ratationFactor,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 0,
      // Rotate the image as scroll happens
      child: Transform.rotate(
        // hack to make it work with the page transition
        angle: ratationFactor>0 ? (3 * ratationFactor + 3.29) : 0,
        child: Hero(
          tag: "recipe-image-$recipeId",
          child: Image.asset(
            imagePath,
            width: 200,
          ),
        ),
      ),
    );
  }
}
