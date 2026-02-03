class Memory {
  static const List<String> listOperation = const [
    '%',
    '/',
    'x',
    '-',
    '+',
    '=',
  ];
  final List<double> _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operation;
  String _value = '0';
  bool _wipeValue = false;
  String? _lastOperation;

  void applyCommand({required String value}) {
    if (_isReplacementOperation(command: value)) {
      _operation = value;
      return;
    }
    if (value == 'AC') {
      _allClean();
    } else if (listOperation.contains(value)) {
      _setOperation(newOperation: value);
    } else {
      _addDigit(digit: value);
    }

    _lastOperation = value;
  }

  bool _isReplacementOperation({required String command}) {
    return listOperation.contains(_lastOperation) &&
        listOperation.contains(command) &&
        _lastOperation != '=' &&
        command != '=';
  }

  void _setOperation({required String newOperation}) {
    bool isEqualsSign = newOperation == '0';
    if (_bufferIndex == 0) {
      if (!isEqualsSign) {
        _bufferIndex = 1;
        _operation = newOperation;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      _operation = isEqualsSign ? null : newOperation;
      _bufferIndex = isEqualsSign ? 0 : 1;
    }
    _wipeValue = true;
  }

  void _addDigit({required String digit}) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;
    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }
    final emptyValue = isDot ? '0' : '';

    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  void _allClean() {
    _value = '0';
    _bufferIndex = 0;
    _buffer.setAll(0, [0.0, 0.0]);
    _operation = null;
    _wipeValue = false;
  }

  double _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value => _value;
}
