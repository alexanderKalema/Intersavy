import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:android_app_development/constants.dart';
import 'package:android_app_development/services/bloc/calculator/calculator_bloc.dart';
import 'package:android_app_development/models/keyboard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool scientificKeyboard = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.calculatorApp),
        bottom: TabBar(
          labelColor: Colors.black,
          controller: _tabController,
          tabs:  [
            Tab(icon: const Icon(Icons.calculate_outlined), text: AppLocalizations.of(context)!.basicCalculator),
            Tab(
                icon: const Icon(Icons.calculate_rounded),
                text: AppLocalizations.of(context)!.scientificCalculator),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocProvider(
            create: (context) => SimpleCalculatorBloc(),
            child: BlocConsumer<SimpleCalculatorBloc, CalculatorState>(
                listener: (context, state) {
              if (state is CalcError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }, builder: (context, state) {
              return Column(children: [
                Expanded(child: SizedBox()),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          state.operandOne != ''
                              ? _inOutExpression(
                                  state.operandOne, state.equationFontSize)
                              : Container(),
                          state.mathOperators != ''
                              ? _inOutExpression(
                                  state.mathOperators, state.equationFontSize)
                              : Container(),
                          state.operandTwo != ''
                              ? _inOutExpression(
                                  state.operandTwo, state.equationFontSize)
                              : Container(),
                          state.mathResult != ''
                              ? _inOutExpression(
                                  state.mathResult, state.resultFontSize)
                              : Container(),
                        ],
                      ),
                    )),
                Keyboard(
                  isScientific: false,
                  keyboardSigns: SIMPLE_CALCULTOR_KEYS,
                  onTap: context.read<SimpleCalculatorBloc>().calculate,
                ),
              ]);
            }),
          ),
          BlocProvider(
            create: (context) => SimpleCalculatorBloc(),
            child: BlocConsumer<SimpleCalculatorBloc, CalculatorState>(
                listener: (context, state) {
              if (state is CalcError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.blue,
                  ),
                );
              }
            }, builder: (context, state) {
              return Column(children: [
                Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        _inOutExpression(state.mathEquation ,state.equationFontSize),
                        state.mathResult != '' ? _inOutExpression(state.mathResult, state.resultFontSize) : Container(),
                      ],
                    ),
                  ),
                ),
                Keyboard(
                  isScientific: true,
                  keyboardSigns: SCIENTIFIC_CALCULATOR_KEYS,
                  onTap: context.read<SimpleCalculatorBloc>().calculate,
                ),
              ]);
            }),
          )
        ],
      ),
    );
  }

  Widget _inOutExpression(text, double size) {
    return SingleChildScrollView(
      reverse: true,
      scrollDirection: Axis.horizontal,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text is double ? text.toStringAsFixed(2) : text.toString(),
          style: TextStyle(
            color: Color(0xFF444444),
            fontSize: size,
          ),
        ),
      ),
    );
  }
}
