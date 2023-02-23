import 'package:audio_player/utils/music_utils.dart';
import 'package:audio_player/views/screens/Music_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyAudio_APP());
}

class MyAudio_APP extends StatefulWidget {
  const MyAudio_APP({Key? key}) : super(key: key);

  @override
  State<MyAudio_APP> createState() => _MyAudio_APPState();
}

class _MyAudio_APPState extends State<MyAudio_APP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              "RAINBOW MUSIC",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, letterSpacing: 4),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
                children: MyMusicList.map((e) => Card(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      elevation: 3,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      borderOnForeground: false,
                      child: ListTile(
                        tileColor: Colors
                            .primaries[MyMusicList.indexOf(e) % 18].shade100,
                        leading: Image.asset(
                          e['Image'],
                          fit: BoxFit.cover,
                        ),
                        title: Text(e['Mname']),
                        subtitle: Text(e["AName"]),
                        trailing: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Music_Page(
                                        AName: e['AName'],
                                        Image: e['Image'],
                                        Music: e['Music'],
                                        Name: e['Mname'],
                                      )));
                            },
                            child: Icon(Icons.play_arrow)),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                    )).toList()),
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
