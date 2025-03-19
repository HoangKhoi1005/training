void main(){
  final values = List.generate(5, (index) => index + 1,);

  final others = List.unmodifiable(values);

  for(int i = 0; i < others.length; i++){
    print(others.elementAt(i));
  }

  for(final value in values){
    print(value);
  }
  
  others.forEach(print);
}
