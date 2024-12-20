List<T> filtrar<T>(List<T> list, bool Function(T) fn){
  List<T> listFilter = [];
  for(T element in list){
    if(fn(element)){
      listFilter.add(element);
    }
  }

  return listFilter;
}

void main(){
  List<int> listInt = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<double> listDouble = [8.5, 9.1, 3.6, 3.2, 8.9, 9.4, 10.0, 4.7, 7.8];
  List<String> listString = ['Davi', 'Mariana', 'Laura', 'Levi', 'Matheus', 'Elisa', 'Maria', 'José'];
  List<bool> listBool = [true, false, false, true, true, false, false, true, true];

  bool Function(int) fnInt = (int x) => x < 5;
  bool Function(double) fnDouble = (double x) => x > 7;
  bool Function(String) fnString = (String x) => x.length > 5;
  bool Function(bool) fnBool = (bool x) => x == true;

  print(filtrar(listInt, fnInt));
  print(filtrar(listDouble, fnDouble));
  print(filtrar(listString, fnString));
  print(filtrar(listBool, fnBool).length);
}

