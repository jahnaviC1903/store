import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/add.dart';
import 'package:store/filter.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen();

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  var title;


 VideoScreenState();
    
    String selectedFilter;
  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
       appBar: AppBar(
         leading: IconButton(
            icon: Icon(FontAwesomeIcons.home, color: Colors.white,),
            onPressed: () {
               Navigator.pop(context);
            }),

            title:Text("All Stores"), 
            backgroundColor: Colors.cyan[900], 
            actions: [
              Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white38,
                iconTheme: IconThemeData(color: Colors.black),
                
                textTheme: TextTheme().apply(bodyColor: Colors.black),
          
              ),
              child: PopupMenuButton<int>(
                color: Colors.grey[850],
                onSelected: (item)=> onSelected(context,item),
                itemBuilder: (context) =>[
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children:[
                        Icon(Icons.sort ,color:Colors.white),
                        Text(' Filters'),
                        ],),  ),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children:[
                        Icon(Icons.add ,color:Colors.white),
                        Text(' Add Store'),
                        ],),
                  ),

                ],
                        ),          ),  ],
        ),
      floatingActionButton: null,
      body: 
      
      Column(
        children: [
        /*  DropdownButton<String>(
            value:selectedFilter,
            items: _dropDownItem(),
            style: TextStyle(color:Colors.white),
            iconEnabledColor: Colors.black,
            onChanged: (value){
               selectedFilter = value;
               switch(value){
                 case "hyderabad":
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context)=> Hyderabad()),
                 );
                 break;
                 /*case "jaipur":
                  Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context)=> Jaipur(selectedValue: '',)),
                 );
                 break;
                */ case "grocery":
                  Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context)=> Grocery()),
                 );
                 break;
                 case "tshirt":
                  Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context)=> Tshirt()),
                 );
                 break;




               }
              },
              hint: Text("select filter",
              style: TextStyle(color: Colors.white),),
               ),*/
        
             
            
          Flexible(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('shop').snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView(
                  children: snapshot.data.docs.map((document) {
                    var url = document['url'];

                    YoutubePlayerController _controller = YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(url),
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                        disableDragSeek: false,
                        loop: false,
                        isLive: true,
                        forceHD: false,
                      ),
                    );

                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 5,),
                              child: Text(document['store'],
                              style: TextStyle (color: Colors.white),
                             
                              ),
                             
                              
                            ),
                            YoutubePlayer(
                              controller: _controller,
                              liveUIColor: Colors.amber,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ),
        ],
      ),    );
  }
  /*List<DropdownMenuItem<String>> _dropDownItem() {
              List<String> filters= ["hyderabad","jaipur","grocery","tshirt"];
              return filters.map(
                (value) =>
                DropdownMenuItem(
                  value: value,
                  child: Text(value,
                 style: TextStyle(color:Colors.grey[800]), ),
                  
                  
                  
              )
              ).toList();
            } */

    void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Filter()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddPage()),
          
        );
        
    }
    }
        
}





