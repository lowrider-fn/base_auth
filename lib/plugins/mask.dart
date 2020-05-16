import 'package:flutter_masked_text/flutter_masked_text.dart';

class Mask {
  static MaskedTextController phone(String val) => MaskedTextController(
      text: val,
      mask: "+# (###) ###-##-##",
      translator: {"#": RegExp(r'[0-9]')});
}
