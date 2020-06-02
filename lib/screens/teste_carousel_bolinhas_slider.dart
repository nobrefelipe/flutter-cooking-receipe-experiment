import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pageViewController = PageController();
  var currentPageValue = 0;

  @override
  initState() {
    super.initState();
    pageViewController = new PageController(
      initialPage: currentPageValue,
      keepPage: false,
      viewportFraction: 0.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(height: 200),
          
          Center(
            child: Container(
              height: 200,
//               color: Colors.blue,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPageValue = value;
                  });
                },
                controller: pageViewController,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: pageViewController,
                    builder: (context, child) {
       
                      double value ;
                      if (pageViewController.position.haveDimensions) {
                        value = pageViewController.page - index;
//                         value = (1 - (value.abs() * 1)).clamp(0.0, 1.0);
                        value = (1 + (value.abs() * .5)).clamp(0.0, 2.0);
                      }

                      if (index == currentPageValue.floor()) {
                        
                        
                        return new FittedBox(
                          child: meuQuadrado(value ),
                        );
                      } else if (index == currentPageValue.floor() + 1) {
                        
                        //next
                        return new FittedBox(
                          child: meuQuadrado(value ),
                        );
                      } else {
                      
                        //prev
                        return new FittedBox(
                          child: meuQuadrado(value ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox meuCirculo(value) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(50.0),
        child: DecoratedBox(
          child: null,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  carouselSlide(offset) {
    return Transform.scale(
      scale: 2.5 - offset,
      child: meuCirculo(offset),
    );
  }

  meuQuadrado(offset) {
    return SizedBox(
      width: 140,
      height: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(
//           color: Colors.grey,
        ),
        child: Stack(children: [
          Transform.translate(
            offset:  Offset(30.0, offset * 80),
            child: carouselSlide(offset),
          )
        ]),
      ),
    );
  }
}

// SizedBox(
//   width: 42.0,
//   height: 42.0,
//   child: const DecoratedBox(
//     decoration: const BoxDecoration(
//       color: Colors.red
//     ),
//   ),

/*
 * 
 * decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
 * 
 *  itemBuilder: (context, position) {
               var i = -1 * (currentPageValue - position);
              
              if (position == currentPageValue.floor()) {
                
                var scale = (i<0) ?  i + 0.6 : i + 0.6;
               
                return carouselSlide(context, i , scale);
                
              } else if (position == currentPageValue.floor() + 1){
                
                 var scale = (i<0) ?  i + 0.6 : i - 0.6;
                return carouselSlide(context,  i,  scale);
                
              } else {
                
                return carouselSlide(context, i , 0.4);
                
              }
            },*/
