import 'package:cooking_recipe_app/Widgets/Recipe/recipe_background_widget.dart';
import 'package:cooking_recipe_app/screens/recipe_detail_screen.dart';
import 'package:flutter/material.dart';

import './Recipe/recipe_content_widget.dart';
import './Recipe/recipe_image_widget.dart';
import '../Widgets/recipe.dart';
import './Recipe/recipe_favorite_widget.dart';
import 'fade_router.dart';

class RecipePageViewItem extends StatefulWidget {
  final Recipe recipe;
  final PageController controller;
  final int currentPage;
  final Color backgroundColor;
  final bool isFavorite;

  RecipePageViewItem({
    Key key,
    this.recipe,
    this.controller,
    this.currentPage,
    this.backgroundColor,
    this.isFavorite,
  }) : super(key: key);

  @override
  _RecipePageViewItemState createState() => _RecipePageViewItemState();
}

class _RecipePageViewItemState extends State<RecipePageViewItem> {

  // The selected recipe 
  var lastSelected;

  @override
  Widget build(BuildContext context) {
    
      // When navigatin to the Recipe Detail Screen, 
      // we wait for a Future to be fulfilled  when twe Pop back to the home screen
      // send the Selected Recipe index from there 
      // see: onPressed: () => Navigator.pop(context, recipes.indexOf(recipe)),
     _navigateAndDisplaySelection(BuildContext context) async{
       lastSelected = await  Navigator.push(
          context,
          FadeRoute(
            // page: CharacterScreen(character: character),
            page: RecipeDetailScreen(recipe: widget.recipe),
          ),
        );

        // convert lastSelected to double
        lastSelected = lastSelected.toDouble();
        
    }

    return InkWell(
      onTap: () => _navigateAndDisplaySelection(context),
      child: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          double value = 1.0;
    
          // The Magic hapens here
          if (widget.controller.position.haveDimensions) {

            value = widget.controller.page - widget.currentPage;
            
            value = (1 - (value.abs() * 1)).clamp(0.0, 1.0);

          } else {
            
            // Before ani swipe widget.controller.position.haveDimenssions will be null
            // so we fallback here
            // set value to 1 for the first slide and 0 for the others
            // When we return from the detail screen we also need to tell what was the selected slide
            // so we show it properly, otherwise it will assume the first slide
            value = 
            // if current page is 0 -> value = 1 
            (widget.currentPage == 0) ? 1 
            // Otherwise
            // if we coming from the Detail Screen -> value = lastSelected
            // otherwise -> value  = 0
            : (lastSelected != null) ? lastSelected : 0;

          }

          // Show the next slide by translating it
          // when the slide is current, the value will be 1 so the translateX will be 0
          double translateX = 40.0 * value - 40.0;

          return Transform.translate(
            /* only to non current pages get offset*/
            offset: Offset(translateX, 0.0),
            //
            child: Container(
              margin: EdgeInsets.only(bottom: 60),
              padding: EdgeInsets.only(left: 30),
              child: Stack(
                children: <Widget>[
                  
                  // BACKGROUND
                  RecipeBackgroundWidget(
                    recipeId: widget.recipe.id,
                    backgroundColor: widget.recipe.backgroundColor,
                  ),

                  // FAVORITE BUTTON
                  FavoriteWidget(
                    opacity: value,
                    isFavorite: widget.recipe.isFavorite,
                  ),

                  // CONTENT
                  RecipeContentWidget(
                    title1: widget.recipe.title1,
                    title2: widget.recipe.title2,
                    description: widget.recipe.description,
                    opacity: value,
                  ),

                  // IMAGE
                  RecipeImageWidget(
                    recipeId: widget.recipe.id,
                    imagePath: widget.recipe.imagePath,
                    ratationFactor: value,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


/*
  know scroll direction

              if(widget.controller.position.isScrollingNotifier.value){
                
                if(widget.controller.page > prevPage){
                  testScale = -value;
                  print("Swipe right $testScale");
                }else{
                  testScale = value;
                  print("Swipe left $testScale");
                }

              }else{
                prevPage = widget.controller.page.round();

              }
*/