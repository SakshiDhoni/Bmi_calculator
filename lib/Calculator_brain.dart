import 'dart:math';

class Calculation{

  Calculation({ required this.height , required this.weight} );
  final int height;
  final int weight;
   double _bmi =0; // private property
  String calcBmi(){
     _bmi = weight/pow(height/100,2);
    return
      _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'OverWeight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){

    if(_bmi >=25){
      return 'you have a higher than normal body weight.Try to rexercise more.';
    }

    else if(_bmi >= 18.5){
      return 'You have normal bogy weight. Good job!';
    }

    else{
      return 'You have a lower than normal body weight. You have to eat more.';
    }
  }
}