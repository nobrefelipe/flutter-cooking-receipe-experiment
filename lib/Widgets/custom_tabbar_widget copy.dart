
import 'package:flutter/material.dart';
import '../Theme/AppStyles.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with TickerProviderStateMixin{

  AnimationController _fadeOutController;
  Animation _fadeOutAnimation;

  double _opacity = 1;

  var currentSelected = 0;

  @override
  void initState() {
    super.initState();

    // Set up the FADE OUT Animation Controller
    _fadeOutController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: (500 ~/ 3),
      ),
    );

    // Create the FADE OUT Animation
    _fadeOutAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut))

      //Set the Alpha value : will get animated from 1 to 0
      ..addListener(() {
        setState(() {
          _opacity = _fadeOutAnimation.value;
        });
      })

      // Listen to the end of the Fade Out animation and ...
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            //activeIcon = nextIcon;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          
          Expanded(
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: AppStyles.textColorAlpha,
                  icon: Icon(Icons.home),
                  onPressed: (){
                    setState(() {
                      currentSelected = 0;
                    });
                  },
                ),
                if(currentSelected == 0)
                  Text("Home", style: AppStyles.h6_bold),
              ],
            )
          ),

          Expanded(
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: AppStyles.textColorAlpha,
                  icon: Icon(Icons.person),
                  onPressed: (){
                    setState(() {
                      currentSelected = 1;
                    });
                  },
                ),
                if(currentSelected == 1)
                  Text("Profile", style: AppStyles.h6_bold),
              ],
            )
          ),

          Expanded(
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: AppStyles.textColorAlpha,
                  icon: Icon(Icons.bookmark),
                  onPressed: (){
                    setState(() {
                      currentSelected = 2;
                    });
                  },
                ),
                if(currentSelected == 2)
                  Text("Bookmarded", style: AppStyles.h6_bold),
              ],
            )
          ),

          Expanded(
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: AppStyles.textColorAlpha,
                  icon: Icon(Icons.sort),
                  onPressed: (){
                    setState(() {
                      currentSelected = 3;
                    });
                  },
                ),
                if(currentSelected == 3)
                  Text("Recipes", style: AppStyles.h6_bold),
              ],
            )
          ),
          

          // AnimatedContainer(
          //   // Use the properties stored in the State class. 
          //   width: (currentSelected == 0) ? 130 : 50,
          //   duration: Duration(milliseconds: 300),
          //   curve: Curves.easeOut,
          //   child: Row(
          //     children: <Widget>[
          //       IconButton(
          //         color: AppStyles.textColorAlpha,
          //         icon: Icon(Icons.home),
          //         onPressed: (){
          //           setState(() {
          //             currentSelected = 0;
          //           });
          //         },
          //       ),
          //       if(currentSelected == 0)
          //         Text("Home", style: AppStyles.h6_bold),
          //     ],
          //   ),
          // ),


        ],

      ),
    );
  }
}


/**

 
          AnimatedContainer(
            // Use the properties stored in the State class. 
            width: (currentSelected == 1) ? 130 : 50,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Row(
              children: <Widget>[
                IconButton(
                  color: AppStyles.textColorAlpha,
                  icon: Icon(Icons.person),
                  onPressed: (){
                    setState(() {
                      currentSelected = 1;
                    });
                  },
                ),
                if(currentSelected == 1)
                  Text("Profile", style: AppStyles.h6_bold),
              ],
            ),
          ),
          
          AnimatedContainer(
            // Use the properties stored in the State class. 
            width: (currentSelected == 2) ? 130 : 50,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Row(
              children: <Widget>[
                IconButton(
                  color: AppStyles.textColorAlpha,
                  icon: Icon(Icons.bookmark),
                  onPressed: (){
                    setState(() {
                      currentSelected = 2;
                    });
                  },
                ),
                if(currentSelected == 2)
                  Text("Bookmarked", style: AppStyles.h6_bold),
              ],
            ),
          ),

          AnimatedContainer(
            // Use the properties stored in the State class. 
            width: (currentSelected == 3) ? 130 : 50,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Row(
              children: <Widget>[
                IconButton(
                  color: AppStyles.textColorAlpha,
                  icon: Icon(Icons.sort),
                  onPressed: (){
                    setState(() {
                      currentSelected = 3;
                    });
                  },
                ),
                if(currentSelected == 3)
                  Text("Recipes", style: AppStyles.h6_bold),
              ],
            ),
          ),
          
           
 
 */