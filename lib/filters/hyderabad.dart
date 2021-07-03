import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Hyderabad extends StatefulWidget {
  Hyderabad();

  @override
  _HyderabadState createState() => _HyderabadState();
}

class  _HyderabadState extends State<Hyderabad> {
  _HyderabadState();

  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[900],
      appBar: AppBar(
            title:Text("Hyderabad"), 
            backgroundColor: Colors.cyan[900], //background color of app bar
        ),
      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('shop').where('location', isEqualTo: 'hyderabad').snapshots(),
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
