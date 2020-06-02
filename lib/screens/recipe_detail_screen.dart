import 'dart:async';
import '../Data/recipes.dart';
import 'package:flutter/material.dart';
import '../Theme/AppStyles.dart';
import '../Widgets/recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({
    Key key,
    this.recipe,
  }) : super(key: key);

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen>
    with TickerProviderStateMixin {
  // Animation Controller
  AnimationController _controller;

  // Fade in inits
  Animation<double> _fadeInAnimation;
  Tween<double> _fadeInTween;

  // Alpha : used for fade in and out  and translate the icons
  double fabIconAlpha = 0;
  final int _animationTime = 300;

  // Screen Height
  var screenHeight;

  // Dragable Bottom Sheet Inits
  AnimationController _heightFactorAnimationController;
  Animation<double> _heightFactorAnimation;

  bool isAnimationCompleted = false;

  @override
  void initState() {
    // Set up Tween init state
    _fadeInTween = Tween<double>(begin: 0.0, end: 1.0);

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: _animationTime));

    // Height Factor Animation :  Bottom sheet animation
    _heightFactorAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: _animationTime));
    _heightFactorAnimation = Tween<double>(begin: 0.8, end: 0.55)
        .animate(_heightFactorAnimationController);

    // Create the FADE IN Animation
    // Will be run everytime setState() is called
    // The Alpha value will be animated from 0 to 1
    _fadeInAnimation = _fadeInTween.animate(CurvedAnimation(
        parent: _controller, curve: Interval(0, 1, curve: Curves.easeOut)))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeInAnimation.value;
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _heightFactorAnimationController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set screen height
    screenHeight = MediaQuery.of(context).size.height;

    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
      _heightFactorAnimationController.forward();
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.recipe.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppStyles.textColor,
          // Pass the index of the current recipe  when navigation back to the home screen
          // so the PaveViewBuilder know which recipe was slected
          onPressed: () {
            _controller.reset();
            _heightFactorAnimationController.reverse();
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.pop(context, recipes.indexOf(widget.recipe));
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            color: AppStyles.textColor,
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            color: AppStyles.textColor,
            icon: Icon(Icons.local_dining),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // BACKGROUND
          Hero(
            tag: "recipe-bg-${widget.recipe.id}",
            child: Container(
              margin: EdgeInsets.only(left: 0, top: 0, right: 0),
              decoration: new BoxDecoration(
                color: widget.recipe.backgroundColor,
                borderRadius: new BorderRadius.all(Radius.circular(0.0)),
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

          /* PAGE TITLE */
          Padding(
            padding: EdgeInsets.all(25),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: _animationTime),
              opacity: fabIconAlpha,
              child: RichText(
                text: TextSpan(
                  text: "${widget.recipe.title1} ",
                  style: AppStyles.h1,
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.recipe.title2, style: AppStyles.h1_bold),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            left: 35,
            top: 160,
            width: 100,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: _animationTime),
              opacity: fabIconAlpha,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("assets/images/timer.png", width: 18),
                      SizedBox(width: 10),
                      Text("32 minutes", style: AppStyles.bodyFont),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("assets/images/person.png", width: 18),
                      SizedBox(width: 10),
                      Text("2 people", style: AppStyles.bodyFont),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("assets/images/fire.png", width: 18),
                      SizedBox(width: 10),
                      Text("23 calories", style: AppStyles.bodyFont),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // IMAGE
          Positioned(
            right: -80,
            top: 80,
            child: Hero(
              tag: "recipe-image-${widget.recipe.id}",
              child: Image.asset(
                widget.recipe.imagePath,
                width: 300,
              ),
            ),
          ),

          AnimatedBuilder(
            animation: _heightFactorAnimation,
            builder: (context, widget) {
              return GestureDetector(
                onTap: () => onTabBottomSheet(),
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                child: FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 1 - _heightFactorAnimation.value,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: _animationTime),
                    opacity: fabIconAlpha,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, left: 35, bottom: 15, right: 35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 145,
                            height: 5,
                            margin: EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Directions", style: AppStyles.h6_bold),
                                  SizedBox(height: 20),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // DOT
                                      Container(
                                        width: 6,
                                        height: 6,
                                        margin:
                                            EdgeInsets.only(top: 5, right: 15),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: AppStyles.primaryColor),
                                      ),

                                      Expanded(
                                        child: Text(
                                            "In a small bowl, mix together all ingredients for the salad dressing and stir until well combined. Option to put in a dressing container and shake to combine."),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // DOT
                                      Container(
                                        width: 6,
                                        height: 6,
                                        margin:
                                            EdgeInsets.only(top: 5, right: 15),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: AppStyles.primaryColor),
                                      ),

                                      Expanded(
                                        child: Text(
                                            "In a large salad bowl, toss together all salad ingredients. Cover with apricot dressing and serve."),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _onVerticalDragUpdate(DragUpdateDetails updateDetails) {
    double fractionDragged = updateDetails.primaryDelta / screenHeight;
    _heightFactorAnimationController.value =
        _heightFactorAnimationController.value - 5 * fractionDragged;
  }

  _onVerticalDragEnd(DragEndDetails dragEndDetails) {
    if (_heightFactorAnimationController.value > 0.5) {
      _heightFactorAnimationController.forward();
    } else {
      _heightFactorAnimationController.reverse();
    }
  }

  onTabBottomSheet() {
    setState(() {
      if (isAnimationCompleted) {
        _heightFactorAnimationController.reverse();
      } else {
        _heightFactorAnimationController.forward();
      }
      isAnimationCompleted = !isAnimationCompleted;
    });
  }
}
