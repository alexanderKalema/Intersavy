import 'package:android_app_development/services/bloc/puzzle/puzzle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreviousAttemptScreen extends StatefulWidget {
  const PreviousAttemptScreen({Key? key}) : super(key: key);

  @override
  State<PreviousAttemptScreen> createState() => _PreviousAttemptScreenState();
}

class _PreviousAttemptScreenState extends State<PreviousAttemptScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/889.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Align(
        alignment: Alignment.center,

          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.95 ,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration:  BoxDecoration(
                color: Colors.white.withOpacity(0.8),

                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Center(child: Text(
                    AppLocalizations.of(context)!.previousAttempt,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),

                  )),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Text(AppLocalizations.of(context)!.number),
                      Text(AppLocalizations.of(context)!.guessedNumber,
                        style: const TextStyle(
                          fontSize: 14,
                        ),),
                      Text(AppLocalizations.of(context)!.magnitude,
                        style: const TextStyle(
                          fontSize: 14,
                        ),),
                      Text(AppLocalizations.of(context)!.order,
                        style: const TextStyle(
                          fontSize: 14,
                        ),)
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      // width:Sizes.getTotalWidth(context)*0.2,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  BlocBuilder<PuzzleBloc, PuzzleState>(
                    builder: (context, state){
                      if(state is PuzzleCurrentAnswer){
                        return Expanded(
                          child: ListView.builder(
                              itemCount: state.guesses.length,
                              itemBuilder: (context, index){
                                return  Padding(
                                  padding: const EdgeInsets.only(
                                    right: 45,
                                      left: 30.0,
                                      top: 12,
                                    bottom: 12
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  [
                                      Text((index + 1).toString()),
                                      Text("${state.guesses[index].guess}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),),
                                      Text("${state.guesses[index].magnitude}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),),
                                      Text("${state.guesses[index].order}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),)
                                    ],
                                  ),
                                );
                              }
                          ),
                        );
                      }
                      else{
                        return Column(
                          children:  [
                            const SizedBox(height: 180,),
                            Text(
                              AppLocalizations.of(context)!.noAttemptsMade,
                              style: const TextStyle(
                              fontSize: 16,
                            ),),
                          ],
                        );
                      }
                    },
                  )
                ],
              )),
        )
      ],
    );
  }
}
