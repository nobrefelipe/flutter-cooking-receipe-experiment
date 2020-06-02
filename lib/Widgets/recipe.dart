import 'package:flutter/material.dart';

class Recipe {
  final String id;
  final String title1;
  final String title2;
  final String imagePath;
  final String description;
  final Color backgroundColor;
  final bool isFavorite;

  Recipe({
    this.id,
    this.title1,
    this.title2,
    this.imagePath,
    this.description,
    this.backgroundColor,
    this.isFavorite,
  });
}
