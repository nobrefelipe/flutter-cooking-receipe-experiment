import 'package:flutter/material.dart';
import '../Widgets/recipe.dart';

List recipes = [

  Recipe(
    id: "blue-salad",
    title1: "Blue",
    title2: "Salad",
    description: "This hearty salad serves as a filling lunch or delicious dinner starter.",
    imagePath: "assets/images/plate.png",
    backgroundColor: Color.fromRGBO(222, 232, 254, 1),
    isFavorite: true,
  ),

  Recipe(
    id: "red-salad",
    title1: "Red",
    title2: "Salad",
    description: "This hearty salad serves as a filling lunch or delicious dinner starter.",
    imagePath: "assets/images/plate.png",
    backgroundColor: Color.fromRGBO(249, 209, 202, 1),
    isFavorite: false,
  ),
  

];