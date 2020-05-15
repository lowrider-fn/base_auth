import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  const Field({
    Key key,
    this.isPwd = false,
    this.isEnabled = true,
    this.isReadonly = false,
    this.label = '',
    this.value,
    this.type = TextInputType.text,
    this.controller,
    this.onInput,
    this.onValidate,
  }) : super(key: key);
  final TextEditingController controller;
  final bool isPwd;
  final bool isEnabled;
  final bool isReadonly;
  final String label;
  final ValueChanged onInput;
  final Function onValidate;
  final TextInputType type;
  final String value;

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool _isDirty = false;
  bool _isShowPwd = true;
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _textController.text = widget.value;
      print(_textController);
    }
  }

  bool get _isValidate => widget.onValidate != null;

  IconButton get _iconPwd => IconButton(
        onPressed: () => setState(() => _isShowPwd = !_isShowPwd),
        icon: Icon(
          _isShowPwd ? Icons.visibility : Icons.visibility_off,
          color: Colors.black,
        ),
      );

  void _changeHandler(val) {
    setState(() => _isDirty = true);
    // if (_isValidate) {
    widget.onInput(val);
    // }
  }

  Widget _textField(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: TextFormField(
            enabled: widget.isEnabled,
            autovalidate: _isValidate && _isDirty,
            validator: widget.onValidate,
            controller:
                widget.controller != null ? widget.controller : _textController,
            obscureText: widget.isPwd ? _isShowPwd : false,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
                labelText: widget.label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                suffixIcon: widget.isPwd ? _iconPwd : null),
            keyboardType: widget.type,
            onChanged: _changeHandler,
            onSaved: widget.onInput));
  }

  Widget _readonlyField(BuildContext context) {
    return InputDecorator(
      child: Text(
        widget.value,
        style: Theme.of(context).textTheme.headline6,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(fontSize: 20, color: Colors.grey[700]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isReadonly ? _readonlyField(context) : _textField(context);
  }
}
