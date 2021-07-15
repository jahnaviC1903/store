import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/filters/applied.dart';



class Filter extends StatefulWidget {
  const Filter( {Key key,this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => FilterState();
}

class FilterState extends State<Filter> {
  int _selectedlocation;
  int _selectedproduct;
  int _selectedprice;
  int _selectedtime;
  int _selectedrate;
  
  List<String> _location = ['jaipur','hyderabad','5KM'];
  Widget _locationChips(){
List<Widget> loc = [];
for(int i=0;i< _location.length;i++){
  ChoiceChip locChip = ChoiceChip(
        selected: _selectedlocation == i,
        label: Text(_location[i], style: TextStyle(color: Colors.black87,fontSize: 16.0,fontWeight: FontWeight.bold),),
        elevation: 3,
        pressElevation: 5,
         backgroundColor: Colors.grey[600],
        selectedColor: Colors.white,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedlocation = i;
            }
          });
        },
      );
      loc.add(locChip);
      }
      return Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: loc,
      );

  

  }
   List<String> _product=['grocery','Tshirt','sports'];
  Widget _productChips(){
    List<Widget> pro=[];
    for(int j=0;j<_product.length;j++){
      ChoiceChip proChip = ChoiceChip(
        selected: _selectedproduct == j,
        label: Text(_product[j],style: TextStyle(color: Colors.black87,fontSize: 16.0,fontWeight: FontWeight.bold),),
        elevation: 3,
        pressElevation: 5,
         backgroundColor: Colors.grey[600],
        selectedColor: Colors.white,
        onSelected: (bool selected){
          setState((){
            if (selected){
              _selectedproduct=j;
            }
          }
          );
        },
      );
      pro.add(proChip);
    }
     return Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: pro,
     );
  }
    List<String> _price=['below 500','below 1000','above 1500'];
  Widget _priceChips(){
    List<Widget> pro=[];
    for(int k=0;k<_price.length;k++){
      ChoiceChip priChip = ChoiceChip(
        selected: _selectedprice == k,
        label: Text(_price[k],style: TextStyle(color: Colors.black87,fontSize: 16.0,fontWeight: FontWeight.bold),),
        elevation: 3,
        pressElevation: 5,
         backgroundColor: Colors.grey[600],
        selectedColor: Colors.white,
        onSelected: (bool selected){
          setState((){
            if (selected){
              _selectedprice=k;
            }
          }
          );
        },
      );
      pro.add(priChip);
    }
     return Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: pro,
     );
  }
   List<String> _time=['recent','one hour ago','four hours ago'];
  Widget _timeChips(){
    List<Widget> tim=[];
    for(int l=0;l<_time.length;l++){
      ChoiceChip timChip = ChoiceChip(
        selected: _selectedtime == l,
        label: Text(_time[l],style: TextStyle(color: Colors.black87,fontSize: 16.0,fontWeight: FontWeight.bold),),
        elevation: 3,
        pressElevation: 5,
         backgroundColor: Colors.grey[600],
        selectedColor: Colors.white,
        onSelected: (bool selected){
          setState((){
            if (selected){
              _selectedtime=l;
            }
          }
          );
        },
      );
      tim.add(timChip);
    }
     return Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tim,
     );
  }
   List<String> _rate=['5 star','3 star','below 3 star'];
  Widget _rateChips(){
    List<Widget> rat=[];
    for(int m=0;m<_rate.length;m++){
      ChoiceChip ratChip = ChoiceChip(
        selected: _selectedrate == m,
        label: Text(_rate[m],style: TextStyle(color: Colors.black87,fontSize: 16.0,fontWeight: FontWeight.bold),),
        elevation: 3,
        pressElevation: 5,
        backgroundColor: Colors.grey[600],
        selectedColor: Colors.white,
        onSelected: (bool selected){
          setState((){
            if (selected){
              _selectedrate=m;
            }
          }
          );
        },
      );
      rat.add(ratChip);
    }
     return Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rat,
     );
  }
   Container categoryDivider() {
    return Container(
      height: 1.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color: Colors.grey,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
                leading: IconButton(
            icon: Icon(FontAwesomeIcons.times, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            }),

        title: Text('filter'),
        backgroundColor: Colors.cyan[900],
      ),
      body: Center(
        child: Column(
          /*mainAxisAlignment: MainAxisAlignment.center,*/
          children: <Widget>[
       Align
            (
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Products",
              style: TextStyle(color: Colors.white,fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: <Widget>[
                      
                       _productChips(),

                    ],
                  )
              ),
            ),
          ),

            

      
       Divider(color: Colors.blueGrey, height: 10.0,),
            
       Align
            (
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("location",
              style: TextStyle(color: Colors.white,fontSize: 24.0, fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Flexible(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: <Widget>[
                      
                       _locationChips(),

                    ],
                  )
              ),
            ),
          ),

         Divider(color: Colors.blueGrey, height: 10.0,),

      
      
           
       Align
            (
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Price",
              style: TextStyle(color: Colors.white,fontSize: 24.0, fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: <Widget>[
                      
                       _priceChips(),

                    ],
                  )
              ),
            ),
          ),

    
        Divider(color: Colors.blueGrey, height: 10.0,),
            
       Align
            (
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Uploaded Time",
              style: TextStyle(color: Colors.white,fontSize: 24.0, fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: <Widget>[
                      
                      
                         
                          _timeChips(),

                    ],
                  )
              ),
            ),
          ),

       
        Divider(color: Colors.blueGrey, height: 10.0,),
            
       Align
            (
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Ratings",
              style: TextStyle(color: Colors.white,fontSize: 24.0, fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Flexible(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: <Widget>[
                      
                       _rateChips(),

                    ],
                  )
              ),
            ),
          ),

       
     Divider(color: Colors.blueGrey, height: 10.0,),
           _selectedrate == null
           
            
            
            
            ? Container()
            : Column(
              children: [
               /* Text(
                  '${_location[_selectedlocation]} and ${_product[_selectedproduct]} and ${_price[_selectedprice]} and ${_time[_selectedtime]} and ${_rate[_selectedrate]}' ,
                 style: Theme.of(context).textTheme.headline4,
                ),
               */
                
              
              SizedBox(height: 20,),
                
                
                ElevatedButton(
                   style: ElevatedButton.styleFrom(
                  
                  primary: Colors.blueGrey[100], //background color of button
                  side: BorderSide(width:3, color:Colors.white), //border width and color
                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(10)
                  ),
                  
                  padding: EdgeInsets.all(20) //content padding inside button
                ),
                        child: Text('Apply Filters',
                        style: TextStyle(color: Colors.black),),
                        onPressed: () {
                           
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder:  (context) => Applied(
                                      selectedLocation: _location[_selectedlocation],
                                      selectedProduct: _product[_selectedproduct],
                                      selectedPrice: _price[_selectedprice],
                                      selectedTime: _time[_selectedtime],
                                      selectedRate: _rate[_selectedrate],
                                     
                                     
                                     
                           )), );}),

             ])],
            )

      )
      );
     
        
      
    
  }
 

}




