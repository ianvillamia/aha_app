import 'package:aha_app/Services/Local/db.dart';
import 'package:aha_app/Widgets/fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:aha_app/Widgets/bottomBar.dart';
import 'package:aha_app/Providers/navigationProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoteList extends StatefulWidget {
  NoteList({Key key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    final _navigationProvider = Provider.of<NavigationProvider>(context);
    _navigationProvider.selected = 3;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Notes',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(color: Color(0xFF110133)),
            fontSize: 25.0,
          ),
        ),
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: DatabaseHelper.instance.queryAll(),
          initialData: List(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                 child:  AnimationLimiter(
                  child: GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                 shrinkWrap: true,
                physics: ScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, int position) {
                      return AnimationConfiguration.staggeredList(
                        position: position,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: ScaleAnimation(
                            child: cardItem(
                                size: size, doc: snapshot, position: position),
                          ),
                        ),
                      );
                      // print('position is$position');
                      // final item = snapshot.data[position];

                      //get your item data here ...
                      // return cardItem(
                      //     size: size, doc: snapshot, position: position);
                    },
                  ),
                )
                );
               
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),
    );
  }

  cardItem({@required size, @required doc, @required position}) {
    return Container(
      // color: Colors.red,
      width: size.width * .45,
      height: size.height * .2,
      child: Card(
        child: InkWell(
          splashColor: Colors.blue,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    doc.data[position].row[1].toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('Body....'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text('.:. click'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
