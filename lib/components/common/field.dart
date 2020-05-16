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
    this.action = TextInputAction.done,
    this.controller,
    this.onInput,
    this.onValidate,
  }) : super(key: key);
  final bool isPwd;
  final bool isEnabled;
  final bool isReadonly;
  final String label;
  final String value;
  final TextInputType type;
  final TextInputAction action;
  final TextEditingController controller;
  final ValueChanged onInput;
  final Function onValidate;

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
    }
  }

  bool get _isValidate => widget.onValidate != null;
  bool get _isPwd => widget.isPwd && _isShowPwd;

  TextEditingController get _controller =>
      widget.controller != null ? widget.controller : _textController;

  IconButton get _iconPwd => IconButton(
        onPressed: () => setState(() => _isShowPwd = !_isShowPwd),
        icon: Icon(
          _isShowPwd ? Icons.visibility : Icons.visibility_off,
          color: Colors.black,
        ),
      );

  void _changeHandler(val) {
    setState(() => _isDirty = true);
    if (_isValidate) {
      widget.onInput(val);
    }
  }

  InputDecoration _createInputDecoration(TextStyle styles) => InputDecoration(
      labelText: widget.label,
      labelStyle: styles,
      suffixIcon: widget.isPwd ? _iconPwd : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
      ));

  Widget _textField(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: TextFormField(
            enabled: widget.isEnabled,
            autovalidate: _isValidate && _isDirty,
            validator: widget.onValidate,
            controller: _controller,
            obscureText: _isPwd,
            style: TextStyle(fontSize: 16),
            keyboardType: widget.type,
            textInputAction: widget.action,
            onChanged: _changeHandler,
            onSaved: widget.onInput,
            decoration: _createInputDecoration(null)));
  }

  Widget _readonlyField(BuildContext context) {
    return InputDecorator(
        child: Text(
          widget.value,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: _createInputDecoration(
            TextStyle(fontSize: 20, color: Colors.grey[700])));
  }

  @override
  Widget build(BuildContext context) {
    return widget.isReadonly ? _readonlyField(context) : _textField(context);
  }
}
