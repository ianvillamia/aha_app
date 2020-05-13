import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:aha_app/Widgets/bottomBar.dart';
class NoteList extends StatefulWidget {
  NoteList({Key key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    final _navigationProvider = Provider
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Wrap(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => ScaleAnimation(
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                bigCard(size: size),
                littleCard(size: size),
                bigCard(size: size),
                littleCard(size: size),
                bigCard(size: size),
                littleCard(size: size),
                bigCard(size: size),
                littleCard(size: size),
                bigCard(size: size),
                littleCard(size: size),
              ],
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

  bigCard({@required size}) {
    return Container(
      // color: Colors.red,
      width: size.width * .5,
      height: size.height * .2,
      child: Card(),
    );
  }

  littleCard({@required size}) {
    return Container(
      //color: Colors.blue,
      width: size.width * .5,
      height: size.height * .2,
      child: Card(
        child: InkWell(
          onTap: () {},
          splashColor: Colors.blue,
        ),
      ),
    );
  }
}
