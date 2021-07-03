import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';



class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _addItemController = TextEditingController();
  TextEditingController _addNewStoreName = TextEditingController();
    TextEditingController _addLocation = TextEditingController();
    TextEditingController _addPrice = TextEditingController();
    TextEditingController _addProduct = TextEditingController();

  CollectionReference linkRef;
  List<String> videoID = [];
  bool showItem = false;

  final utube =
      RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Store'),
        backgroundColor: Colors.cyan[900],
        
        ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                TextField(
                  controller: _addItemController,
            
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      labelText: 'url',
                  ),),
                TextField(
                  controller: _addNewStoreName,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      labelText: 'Store Name',
                      ),
                ),
                 TextField(
                    controller: _addLocation,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      labelText: 'Location',
                      ),),
                       TextField(
                    controller: _addProduct,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      labelText: 'Product sold',
                    ),),
                 TextField(
                    controller: _addPrice,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      labelText: 'Price',
                      ),),
                       ElevatedButton(
                     onPressed:(){
                      _addItemFuntion();
                  
                     },
                     child: Text("Submit"),
                ), 
              ],
            ),
            
          ),
          
        ],
      ),
      
    );
  }

 

  _addItemFuntion() async {
    await FirebaseFirestore.instance.collection("shop").add({
      "url": _addItemController.text.toString(),
      "store":_addNewStoreName.text,
      "location":_addLocation.text ,
      "product":_addProduct.text,
      "price":_addPrice.text

    },);
    
  }


}