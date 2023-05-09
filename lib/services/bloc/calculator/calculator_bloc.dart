import 'package:math_expressions/math_expressions.dart';
import 'package:android_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'calculator_state.dart';

class SimpleCalculatorCubit extends Cubit<CalculatorState> {
  SimpleCalculatorCubit() : super(CalculatorState());

  void calculate({String? buttonText}) {
    switch (buttonText) {
      case "AC":
        emit(CalculatorState().copyWith(state
          ..mathResult = "0.0"
          ..operandOne = '0'
          ..operandTwo = ''
          ..mathOperators = ''
          ..mathEquation = '0'
          ..mathResult = ''));

        break;
      case "⌫":
        if (state.mathEquation != '0') {
          emit(CalculatorState().copyWith(state
            ..mathEquation = state.mathEquation
                .substring(0, state.mathEquation.length - 1)));
        }

        if (state.mathOperators == '') {
          emit(CalculatorState().copyWith(state
            ..operandOne = (state.operandOne == '0')
                ? '0'
                : state.operandOne.substring(0, state.operandOne.length - 1)));
        } else {
          if (state.operandTwo == '') {
            emit(CalculatorState().copyWith(state..mathOperators = ''));
          }
          emit(CalculatorState().copyWith(state
            ..mathResult = ''
            ..operandTwo =
                state.operandTwo.substring(0, state.operandTwo.length - 1)));
        }
        break;
      case "=":
        if (state.mathResult == '') {
          _resultEvaluator();
        }
        break;
      default:
        _operands(buttonText);
    }
  }

  void _operands(value) {
    emit(state.copyWith(state
      ..mathEquation = (state.mathEquation == "0")
          ? state.mathEquation = value
          : state.mathEquation +=
              (state.mathEquation.contains(".") && value == '.') ? "" : value));

    switch (value) {
      case "%":
        if (state.mathResult != '') {
          emit(CalculatorState().copyWith(
              state
                ..operandOne =
                    (double.parse(state.mathResult) / 100).toString())
            ..mathResult = ''
            ..operandTwo = ''
            ..mathOperators = '');
        } else if (state.mathOperators != '') {
          if (state.operandTwo != "") {
            emit(CalculatorState().copyWith(state
              ..operandTwo =
                  (double.parse(state.operandTwo) / 100).toString()));
          }
        } else {
          if (state.operandOne != "") {
            emit(CalculatorState().copyWith(state
              ..operandOne =
                  (double.parse(state.operandOne) / 100).toString()));
          }
        }
        break;
      case ".":
        if (state.mathOperators != '') {
          if (!state.operandTwo.contains(".")) {
            if (state.operandTwo == "") {
              emit(CalculatorState().copyWith(state..operandTwo = "."));
            } else {
              emit(CalculatorState().copyWith(state..operandTwo += "."));
            }
          }
        } else {
          if (!state.operandOne.contains(".")) {
            if (state.operandOne == "") {
              emit(CalculatorState().copyWith(state..operandOne = "."));
            } else {
              emit(CalculatorState().copyWith(state..operandOne += "."));
            }
          }
        }
        break;
      case "+":
      case "-":
      case "*":
      case "/":
        if (state.mathResult != '') {
          emit(CalculatorState().copyWith(
              state..operandOne = (double.parse(state.mathResult)).toString())
            ..mathResult = ''
            ..operandTwo = ''
            ..mathOperators = value);
        }
        if (state.operandOne == '0') {
          if (value == "-") {
            emit(CalculatorState().copyWith(state..operandOne = "-"));
          }
        } else if (state.operandTwo == '' && state.mathOperators == '') {
          emit(CalculatorState().copyWith(state..mathOperators = value));
        }
        break;
      default:
        if (state.mathResult == '' &&
            state.operandTwo == '' &&
            state.mathOperators == '') {
          emit(CalculatorState().copyWith(state
            ..operandOne += value
            ..mathResult = ''
            ..operandTwo = ''
            ..mathOperators = ''));
        } else if (state.mathOperators != '' && state.mathResult == '') {
          emit(CalculatorState().copyWith(state..operandTwo += value));
        } else if (state.mathResult != '') {
          emit(CalculatorState().copyWith(state
            ..operandOne = value
            ..mathResult = ''
            ..operandTwo = ''
            ..mathOperators = ''));
        }
    }
  }

  String _expressionHandler() {
    bool scientific = false;

    SCIENTIFIC_CALCULATOR_KEYS
        .where((i) => !SIMPLE_CALCULTOR_KEYS.contains(i))
        .toList()
        .forEach((element) {
      if (state.mathEquation.contains(element)) {
        scientific = true;
      }
    });
    if (!scientific) {
      String expression =
          state.operandOne + state.mathOperators + state.operandTwo;
      return expression;
    } else {
      String expression = state.mathEquation;
      expression = expression.replaceAll("π", '3.1415926535897932');
      expression = expression.replaceAll("√", 'sqrt');
      expression = expression.replaceAll("%", '*(1/100)');
      expression = expression.replaceAll("asin", 'arcsin');
      expression = expression.replaceAll("acos", 'arccos');
      expression = expression.replaceAll("atan", 'arctan');
      expression = expression.replaceAll("log", '1/ln(10)* ln');
      expression = expression.replaceAll(" mód ", '%');

      return expression;
    }
  }

  void _resultEvaluator() {
    String expression = _expressionHandler();

    try {
      Parser p = Parser();

      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      String result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      if (result == 'NaN') {
        emit(CalcError(result));
      } else {
        emit(CalculatorState().copyWith(state
          ..mathResult = (state.mathResult.endsWith(".0"))
              ? int.parse(result.replaceAll(".0", "")).toString()
              : result));
      }
    } catch (e) {
      emit(CalcError(e.toString()));
    }
  }
}
