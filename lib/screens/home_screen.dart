
import 'package:flutter/material.dart';
import '../Theme/AppStyles.dart';
import '../Widgets/custom_tabbar_widget.dart';

import '../Data/recipes.dart';
import '../Widgets/recipe_page_view_item.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pageViewController = PageController(viewportFraction: 1/1.26);

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            color: AppStyles.textColor,
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            color: AppStyles.textColor,
            icon: Icon(Icons.local_dining),
            onPressed: (){},
          ),
        ],
      ),

      bottomNavigationBar: CustomTabBar(),

      body: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            /* PAGE TITLE */
            Padding(
              padding: EdgeInsets.only(top:0, left: 25, bottom: 15, right: 25),
              child: RichText(
                text: TextSpan(
                  text: 'Break',
                  style: AppStyles.h1,
                  children: <TextSpan>[
                    TextSpan(text: 'fast', style: AppStyles.h1_bold),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: _screenHeight * 0.62,
              child: Stack(
                children: <Widget>[
                
                
                  // CAROUSEL
                  Positioned.fill(
                    
                    child: PageView(
                      controller: pageViewController,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        
                        for (var i = 0; i < recipes.length; i++)
                          RecipePageViewItem(
                            recipe: recipes[i],
                            controller: pageViewController,
                            currentPage: i,
                          ),  
                      
                      ],
                    ),
                    
                  ),



                  // FILTERS
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      children: <Widget>[
                        RotatedBox(
                          quarterTurns: -1,
                          child: FlatButton(
                            child: Text("Bread", style: AppStyles.h6_bold,),
                            onPressed: (){},
                          ),
                        ),

                        RotatedBox(
                          quarterTurns: -1,
                          child: FlatButton(
                            child: Text("Noodles", style: AppStyles.h6,),
                            onPressed: (){},
                          ),
                        ),

                        RotatedBox(
                          quarterTurns: -1,
                          child: FlatButton(
                            child: Text("Seafood", style: AppStyles.h6,),
                            onPressed: (){},
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
                
              ),

            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal:15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: <Widget>[
                  
                  Image.asset('assets/images/filter-icon.png', width: 20),

                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                         color: Color.fromRGBO(0, 0, 0, 0.03),
                         borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Text("Beer"),  
                    ),
                    onTap: (){},
                  ),

                  InkWell(
                    child: Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                         color: AppStyles.primaryColor,
                         borderRadius: new BorderRadius.all(Radius.circular(15.0)),
                      ),
                    
                      child: Text("Foods", style: TextStyle(color: Colors.white),),  
                    ),
                    onTap: (){},
                  ),

                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                         color: Color.fromRGBO(0, 0, 0, 0.03),
                         borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Text("wine"),  
                    ),
                    onTap: (){},
                  ),

                  

                ],
              ),
            ),

          ],
        ),
      )
      
    );
  }
}