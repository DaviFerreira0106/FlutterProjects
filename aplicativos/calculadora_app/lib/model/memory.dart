class Memory {
  String _value = '0';

  void applyCommand({required String value}) {
    if (value == 'AC') {
      _allClean();
    } else {
      _value += value;
    }
  }

  void _allClean() {
    _value = '0';
  }

  String get value => _value;
}
