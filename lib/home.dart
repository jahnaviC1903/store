import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/hyderabad.dart';
import 'package:store/grocery.dart';
import 'package:store/jaipur.dart';
import 'package:store/tshirt.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen();

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  VideoScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
       appBar: AppBar(
            title:Text("Stores"), 
            backgroundColor: Colors.cyan[900], //background color of app bar
        ),
      floatingActionButton: null,
      body: 
      Column(
        children: [
          Row(
            children: [
              ElevatedButton(style: ElevatedButton.styleFrom(
                  
                  primary: Colors.white54, //background color of button
                 
                  elevation: 3, //elevation of button
                 
                  padding: EdgeInsets.all(20) //content padding inside button
                ),
               
                onPressed: () {  
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Jaipur(),),);
                },
                child: Text("Jaipur") 
              ),
               SizedBox(
              height: 5,
              width:10,
            ),
               ElevatedButton(style: ElevatedButton.styleFrom(
                  
                  primary: Colors.white54, //background color of button
                 
                  elevation: 3, //elevation of button
                 
                  padding: EdgeInsets.all(20) //content padding inside button
                ),
               
                onPressed: () {  
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Hyderabad(),),);
                },
                child: Text("Hyderabad") 
              ),
               SizedBox(
              height: 5,
              width:10,
            ),
              ElevatedButton(style: ElevatedButton.styleFrom(
                  
                  primary: Colors.white54, //background color of button
                 
                  elevation: 3, //elevation of button
                 
                  padding: EdgeInsets.all(20) //content padding inside button
                ),
               
                onPressed: () {   Navigator.push(context,MaterialPageRoute(builder: (context) => Grocery(),),);},
                child: Text("grocery") 
              ),
               SizedBox(
              height: 5,
              width:10,
            ),
              ElevatedButton(style: ElevatedButton.styleFrom(
                  
                  primary: Colors.white54, //background color of button
                 
                  elevation: 3, //elevation of button
                 
                  padding: EdgeInsets.all(20) //content padding inside button
                ),
               
                onPressed: () {  Navigator.push(context,MaterialPageRoute(builder: (context) => Tshirt(),),);
                 },
                child: Text("Tshirt")
              ), 
            ],
            
          ),
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
                        isLive: false,
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
}


