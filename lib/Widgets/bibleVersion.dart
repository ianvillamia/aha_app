import 'package:flutter/material.dart';

class BibleDropDown extends StatefulWidget {
  BibleDropDown({Key key}) : super(key: key);

  @override
  _BibleDropDownState createState() => _BibleDropDownState();
}

class _BibleDropDownState extends State<BibleDropDown> {
  String _selectedMenuItem;
  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _selectedMenuItem = _dropDownMenuItems[0].value;
  }

  List<DropdownMenuItem<String>> _dropDownMenuItems;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    items.add(itemadd(value: 'niv',text: 'NIV'));
    items.add(itemadd(value: 'esv',text: 'ESV'));
   
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(

      underline: SizedBox(),
      value: _selectedMenuItem,
      items: _dropDownMenuItems,
      onChanged: changeDropDownItem,

      //call a function that hanldes these changes
      //logout and routing
    );
  }

  void changeDropDownItem(String selected) {
    switch (selected.toLowerCase()) {
      case 'niv':
        //route to profile
        //change both morning and evening provider to current bible 
        //prob create bible listener

        break;
      case 'esv':
        //route to quizes

        break;
      case 'log-out':
        break;
    }
    setState(() {
      _selectedMenuItem = selected;
    });
  }

  itemadd({@required String value,@required String text}){
    return DropdownMenuItem(
      value: value,
      child: Text(
        text,
      ),
    );
  }
}
