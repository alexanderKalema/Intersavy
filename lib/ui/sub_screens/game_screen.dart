import 'package:android_app_development/models/generic_circle.dart';
import 'package:android_app_development/services/bloc/puzzle/puzzle_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/generic_dialog.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PuzzleBloc, PuzzleState>(listener: (context, state) {

      if (state is PuzzleInitial) {

        showGenericDialog(
          icon: Icons.rule,
            context: context,
            title: 'Rules',
            content: state.rule,
            optionsBuilder: state.rule.contains("3")? () => {
            "Done" : (){
              context.read<PuzzleBloc>().add(PuzzleFirstRun(rule:state.rule ) );
              context.router.popUntilRouteWithPath('/puzzle');
            }}:
                () => {
            "Next" : ()=> context.read<PuzzleBloc>().add(PuzzleFirstRun(rule:state.rule ) )})

        ;
      }
    }, builder: (context, state) {
      return Stack(
        // alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            'assets/images/36224.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 80,
                      left: MediaQuery.of(context).size.width / 2 - 180,
                      height: 350,
                      width: 360,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: const BoxDecoration(

                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child:
                        Builder(
                          builder: (context) {
                            if(state is PuzzleFinished){
                              return Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "You got the number!!!",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Center(
                                    child: Text(
                                      state.computerGuess,
                                      style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Text(
                                    "It took you",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Center(
                                    child: Text(
                                      "${state.trialCount} trials",
                                      style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            }
                            else if( state is PuzzleCurrentAnswer){
                              return  Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "The number you entered has:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Text(
                                    "Magnitude:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Center(
                                    child: Text(
                                      state.magnitude.toString(),
                                      style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Text(
                                    "Order:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Center(
                                    child: Text(
                                      state.order.toString(),
                                      style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            }
                            else if (state is PuzzleNewGame){
                              return  const Center(
                                child: Text(
                                  "Enter a number to start game",
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            }
                            else{
                              return const Center(
                                child: SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator()),
                              );
                            }

                          },
                        )

                      ),
                    ),
                     Align(
                      alignment: Alignment.bottomCenter,
                      child: GenericCircle(
                        onTap:
                        (state is PuzzleFinished)?
                        () {
                          _numberController.clear();
                          context.read<PuzzleBloc>().add(PuzzleStartGame());
                        } :
                            (){
                          if(_numberController.text.length == 4){
                            context.read<PuzzleBloc>().add(PuzzleTryAnother(currentGuess: int.parse(_numberController.text) ));
                          }
                            },
                        fillColor: Color(0xFFdb6400),
                        height: 70,
                        width: 380,
                        isCircle: false,
                        child: Center(
                            child: Text(
                              (state is PuzzleFinished)? "Play Another Game" : "Check Number",
                          style: TextStyle(fontSize: 24),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width / 2 - 180,
            height: 200,
            width: 360,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: const BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: (state is PuzzleFinished)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/trophy.jpg",
                          height: 120,
                          width: 120,
                          colorBlendMode: BlendMode.color,
                        ),
                        const Text(
                          "You won, Well Played !!",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter a 4 - digit number:",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                          child: GenericCircle(
                            isCalculatorButton: true,
                            height: 70,
                            width: 120,
                            isCircle: false,
                            fillColor: const Color.fromRGBO(242, 243, 247, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _numberController,
                                keyboardType: TextInputType.number,
                                maxLength: 4,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                                decoration: const InputDecoration(

                                  counterText: "",
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a number";
                                  }
                                  if (value.length != 4) {
                                    return "Please enter a 4 digit number";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      );
    });
  }
}
