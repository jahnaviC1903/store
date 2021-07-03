import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Grocery extends StatefulWidget {
   Grocery();

  @override
  _GroceryState createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  _GroceryState();

Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[900],
      appBar: AppBar(
            title:Text("Grocery"), 
            backgroundColor: Colors.cyan[900], //background color of app bar
        ),
      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('shop').where('product', isEqualTo: 'grocery').snapshots(),
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
                          child: Text(document['store'],),
                          
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
    );
  }
}


 