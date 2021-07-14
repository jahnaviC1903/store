import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Applied extends StatefulWidget {
  
final String selectedLocation;
final String selectedProduct;
final String selectedPrice;
final String selectedTime;
final String selectedRate;




 Applied({Key key, @required this.selectedLocation,@required this.selectedProduct,@required this.selectedPrice,@required this.selectedTime,@required this.selectedRate}) : super(key: key);


  @override
  _AppliedState createState() => new _AppliedState(selectedLocation,selectedProduct,selectedPrice,selectedTime,selectedRate);
}

class _AppliedState extends State<Applied> {
 
  String selectedLocation;
  String selectedProduct;
  String selectedPrice;
  String selectedTime;
  String selectedRate;
  

  

 _AppliedState(this.selectedLocation,this.selectedProduct,this.selectedPrice,this.selectedTime,this.selectedRate);

  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[900],
      appBar: AppBar(
            title:Text("Filters Applied"), 
            backgroundColor: Colors.cyan[900], //background color of app bar
        ),
      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('shop').where('location', isEqualTo: '$selectedLocation' )
         .where('product', isEqualTo: '$selectedProduct')
          .where('price', isEqualTo: '$selectedPrice').snapshots(),
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
