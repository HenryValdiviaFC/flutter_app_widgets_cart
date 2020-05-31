import 'package:flutter/material.dart';

//PASO 6 -- IMPLEMENTACION DEL METODO DETALLE

class DetailsPage extends StatefulWidget{
  final heroTag;
  final foodName;
  final foodPrice;

  DetailsPage({this.heroTag,this.foodName,this.foodPrice});

  @override
  _DetailsPageState  createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{

  //PASO 11 -- CONTENEDOR ANIMADO  
  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    //PASO 6
    /*
    return Container(

    );*/
    //PASO 7 Scaffold barra y color de fondo
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Details',
          style: TextStyle(fontFamily: 'Roboto',
          fontSize: 18.0,
          color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white
          )
        ],
      ),
      // PASO 8 -- Detalle lista forma
      body: ListView(
        children: [

          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent
              ),
              
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                      
                    ),
                    color: Colors.white

                  ),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            
              // PASO 9 -- ITEM Colocado con animacion
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.heroTag),
                        fit: BoxFit.cover
                      )
                    ),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),
            
              //PASO 10 Nombre, botones y textos
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.foodName,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    
                    SizedBox(height: 20.0),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.foodPrice,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20.0,
                                color: Colors.grey
                              )),
                        Container(
                          height: 25.0,color: Colors.grey, width: 1.0
                        ),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: Color(0XFF7A9BEE)
                          ),
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xFF7A9BEE)
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20.0,
                                    )
                                  ),
                                ),
                              ),

                              Text('2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontSize: 15.0
                                    )), 


                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.white
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF7A9BEE),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        )      
                      ],
                    ),
                    //PASO 11 - CONTENEDORES ANIMADOS Y TRANSICIONES
                    SizedBox(height: 20.0),
                    Container(
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          //PASO 12 - AGREGAR ITEMS INFO CARD
                          _buildInfoCard('WEIGHT', '300', 'KG'),
                          SizedBox(width: 10.00),
                           _buildInfoCard('CALORIES', '267', 'CAL'),
                           SizedBox(width: 10.00),
                           _buildInfoCard('VITAMINS', 'A,B6', 'VIT'),
                           SizedBox(width: 10.00),
                           _buildInfoCard('AVAIL', 'NO', 'AV'),
                           //PASO 12 - FIN 
                        ],
                      ),
                    ),
                    //PASO 13 --- BOTON DE PRECIO
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0)),
                          color: Colors.black
                        ),
                        height: 50.0,
                        child: Center(
                          child: Text(
                            '\$52.00',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto'    
                              )
                          )
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )

        ],
      ),
    );
  }

  //PASO 11 -- CONTENEDORES
  Widget _buildInfoCard(String cardTitle, String info, String unit){
    return InkWell(
      onTap: (){
        selectCard(cardTitle);
      },
      child: AnimatedContainer
      (
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: cardTitle == selectedCard ? Colors.transparent : Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
            width: 0.75
          )
        ),
        height: 100.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(cardTitle,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.0,
                        color: cardTitle == selectedCard ? Colors.white : Colors.grey.withOpacity(0.7)
                      ),),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(info,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.0,
                    color: cardTitle == selectedCard? Colors.white: Colors.black,
                    fontWeight: FontWeight.bold
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(unit,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12.0,
                    color: cardTitle == selectedCard? Colors.white: Colors.black,
                    fontWeight: FontWeight.bold
                  )),
            ),
          ],
        ),
      ),
    );  
  }

  selectCard(cardTitle){
    setState(() {
      selectedCard = cardTitle;

    });
  }
}