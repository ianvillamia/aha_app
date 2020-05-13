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
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Wrap(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                childAnimationBuilder: (widget) => ScaleAnimation(
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  cardItem(size: size), cardItem(size: size),
                cardItem(size: size), cardItem(size: size),
                cardItem(size: size), cardItem(size: size),
                cardItem(size: size), cardItem(size: size),cardItem(size: size), cardItem(size: size),
                cardItem(size: size), cardItem(size: size),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
   bottomNavigationBar: BottomBar(),
    );
  }

  cardItem({@required size}) {
    return Container(
      // color: Colors.red,
      width: size.width * .45,
      height: size.height * .2,
      child: Card(
        child: InkWell(
          splashColor: Colors.blue,
          onTap: (){
            
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Align(alignment: Alignment.topLeft,child: Text('title'),),
              Align(alignment: Alignment.center,child: Text('Body....'),),
              Align(alignment: Alignment.bottomRight,child: Text('.:. click'),),
            ],),
          ),
        ),
      ),
    );
  }

}
