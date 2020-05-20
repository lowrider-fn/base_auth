import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({
    Key key,
    @required this.items,
    @required this.selected,
    @required this.onChanged,
  })  : assert(items != null),
        assert(selected != null),
        assert(onChanged != null),
        super(key: key);

  final List items;
  final ValueChanged onChanged;
  final selected;

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  List<DropdownMenuItem> _options;

  @override
  void didUpdateWidget(Select old) {
    super.didUpdateWidget(old);

    if (old.items != widget.items) {
      _createDropdownMenu();
    }
  }

  @override
  void initState() {
    super.initState();
    _createDropdownMenu();
  }

  void _createDropdownMenu() {
    var newItems = <DropdownMenuItem>[];
    for (var item in widget.items) {
      newItems.add(DropdownMenuItem(
        value: item.name,
        child: Container(
          child: Text(
            item.name,
            softWrap: true,
          ),
        ),
      ));
    }
    setState(() {
      _options = newItems;
    });
  }

  void _changeSelected(dynamic name) {
    widget.onChanged(widget.items.firstWhere((item) => item.name == name));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(
          color: Colors.grey[400],
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[50],
        ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: widget.selected.name,
              items: _options,
              onChanged: _changeSelected,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}
