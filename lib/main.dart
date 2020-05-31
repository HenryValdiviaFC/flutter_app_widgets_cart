import 'package:flutter/material.dart';
import 'package:nutrition_app/detailsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0,left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: (){},
                ),
              Container(
                width: 125,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.filter_list),
                      color: Colors.white,
                      onPressed: (){} ,
                    ),
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                      onPressed: (){} ,
                    )
                  ],
                ),
              )
              ],
            ),
          ),
          // --- PARTE 2 INICIO --//
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                
                Text('Healthy',
                style: TextStyle(
                  fontFamily: 'Arial',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                )),
              
                SizedBox(height: 10.0),

                 Text('Food',
                style: TextStyle(
                  fontFamily: 'Arial',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ))


              ],
            ),
          ),
          SizedBox(height: 40.0),
          // -- PARTE 3 INICIO
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left:25.0,right:20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300,
                    child: ListView(
                      children: [
                        //PASO 4 -- AGREGAR LOS ITEMS
                          _buildFoodItem('assets/plate1.png', 'Salmon Food', '\$24.00'),
                          _buildFoodItem('assets/plate2.png', 'Spring Bowl', '\$24.00'),
                          _buildFoodItem('assets/plate6.png', 'Avocado Bowl', '\$24.00'),
                          _buildFoodItem('assets/plate5.png', 'Berry Bowl', '\$24.00')

                      ],
                    ),
                  ),
                  ),
                // PASO 5
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Icon(Icons.search, color: Colors.grey)
                      ),
                    ),
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_basket, color: Colors.grey)
                      ),
                    )
                  ],
                )
              ],
            ),
          )
          // --- PARTE 2 FIN --//
        ],
      ),
    );
  }

  //PARTE 3 --
  Widget _buildFoodItem(String imgPath,String foodName,String price){
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child: InkWell(
        onTap: (){
          //PASO 6
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsPage(heroTag: imgPath,foodName: foodName,foodPrice: price)
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Hero(
                    tag: imgPath,
                    child: Image(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      height: 75.0,
                      width: 75.0,
                    )
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15.0,
                          color: Colors.grey
                        ),
                      )
                    ],
                  )
                ],
              )
            ),
            //BOTON al caso del item
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: (){},
              )
          ],
        ),
      ),
      );
  }
}
