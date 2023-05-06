import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenericCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final void Function()? onTap;

  const GenericCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      this.onTap})
      : super(key: key);

  @override
  State<GenericCard> createState() => _GenericCardState();
}

class _GenericCardState extends State<GenericCard>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    _rotationAnimation = Tween(
      begin: 0.0,
      end: pi,
    )
        .chain(
          CurveTween(
            curve: Curves.easeInOut,
          ),
        )
        .animate(_rotationController);
  }

  void _toggleCard() {
    if (_rotationController.isCompleted ) {
      _rotationController.reverse();
    } else {
      _rotationController.forward();
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedBuilder(
          animation: _rotationController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..rotateY(
                  _rotationAnimation.value,
                ),
              alignment: Alignment.center,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(82),
                ),
                elevation: 5,
                clipBehavior: Clip.hardEdge,
                child: Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                         bottom: 25,
                         right: 20, left:20),
                    child: _rotationController.isCompleted
                        ? Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment:  CrossAxisAlignment.center ,
                                children: [

                                  Text(widget.description),
                                  InkWell(
                                    onTap: _toggleCard,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [
                                        const Icon(
                                          Icons.arrow_back,
                                          size: 25,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.backToMain,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Icon(
                                widget.icon,
                                size: 80,
                              ),
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: _toggleCard,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:  [
                                    Text(
                                      AppLocalizations.of(context)!.description,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                   const Icon(
                                             Icons.arrow_forward,
                                        size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
              ),
            );
          }),
    );
  }
}
