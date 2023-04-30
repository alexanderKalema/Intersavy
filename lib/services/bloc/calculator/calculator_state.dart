part of 'calculator_bloc.dart';

 class CalculatorState {

  String operandOne = '0';
  String operandTwo = '';
  String mathOperators = '';
  String mathEquation = '0';
  String mathResult = '';
  double equationFontSize = 35.0;
  double resultFontSize = 25.0;

 CalculatorState copyWith(CalculatorState old){
   return CalculatorState() .. operandOne = old.operandOne
                            .. operandTwo = old.operandTwo
                            .. mathOperators = old.mathOperators
                            .. mathEquation = old.mathEquation
                            .. mathResult = old.mathResult
                            .. equationFontSize = old.equationFontSize
                            .. resultFontSize = old.resultFontSize;


 }

}

class CalcInitial extends CalculatorState {

  CalcInitial._sharedInstance();
  static final CalcInitial _shared = CalcInitial._sharedInstance();
  factory CalcInitial() => _shared;
}

class CalcError extends CalculatorState {
  final String error;

  CalcError(this.error);
}
