//
// MSV: 19020445
// Họ tên: Bùi Thị Phương Thảo
//

import 'package:math_expressions/math_expressions.dart';

class Math {
  String _his = '';
  String _exp = '';
  bool haveResult = false;
  bool point = false;

  String cutNumber0(String result) {
    //loại bỏ số 0 nếu có .0
    if (result.toString().contains('.')) {
      // kiểm tra có dấu '.' không
      List<String> splitDecimal =
          // cắt thành mảng 2 phần tử
          result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }

  void callBack(String btn) {
    if (btn == 'C') {
      _his = '';
      _exp = '';
    } else if (btn == '=') {
      // nếu ấn = thì bắt đầu tính toán
      _exp = _exp.replaceAll('x', '*');
      _exp = _exp.replaceAll(':', '/');
      Parser p = Parser();
      Expression exp = p.parse(_exp);
      ContextModel cm = ContextModel();
      _exp = _exp.replaceAll('*', 'x');
      _exp = _exp.replaceAll('/', ':');

      _his = _exp;
      _exp = exp.evaluate(EvaluationType.REAL, cm).toString();
      // gọi hàm bỏ số 0 nếu thừa
      _exp = cutNumber0(_exp);

      haveResult = true;
      point = false;
    } else if (btn == "+/-") {
      //neu an vao nut '+/-'
      if (_exp.toString().startsWith('-')) {
        //bỏ kí tự đầu tiên
        _exp = _exp.toString().substring(1);
      } else {
        _exp = '-' + _exp;
      }
    } else if (btn == '%') {
      double tmp = double.parse(_exp);
      _exp = (tmp / 100).toString();
    } else if (btn == '.') {
      if (point == false) {
        _exp += btn;
      }
      point = true;
    } else {
      if (haveResult &&
          (btn == '0' ||
              btn == '1' ||
              btn == '2' ||
              btn == '3' ||
              btn == '4' ||
              btn == '5' ||
              btn == '6' ||
              btn == '7' ||
              btn == '8' ||
              btn == '9')) {
        // khi có kết quả mà ấn số thì reset
        _exp = '';
        _his = '';
      }
      if (btn == '+' || btn == '-' || btn == 'x' || btn == ':') {
        //khi ấn dấu thì reset cho nhập dấu '.'
        point = false;
      }
      haveResult = false;
      _exp += btn;
    }
  }

  String getHistory() {
    return _his;
  }

  String getExpression() {
    return _exp;
  }
}
