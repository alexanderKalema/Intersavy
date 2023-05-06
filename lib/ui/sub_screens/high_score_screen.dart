import 'package:android_app_development/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class HighScore extends StatefulWidget {
  const HighScore({Key? key}) : super(key: key);

  @override
  State<HighScore> createState() => _HighScoreState();
}

class _HighScoreState extends State<HighScore> {
  late DatabaseService db;

  @override
  void initState() {
    db = DatabaseService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF094074),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 40) ,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(height: 80),
                    Center(
                      child: Text(
                          AppLocalizations.of(context)!.highScore,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ])),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children:  [
              Text(
                AppLocalizations.of(context)!.date,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                AppLocalizations.of(context)!.trials,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(

            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )
                ),
                child: FutureBuilder(
                  future: db.getScores(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.only(
                                top:20,
                                bottom: 20,
                                left: 20,
                                right: 55,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF094074),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data![index]['date'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index]['trials_count'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                ),
          ))
        ]));
  }
}
