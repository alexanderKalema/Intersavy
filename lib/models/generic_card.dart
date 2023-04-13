import 'package:flutter/material.dart';
import 'package:android_app_development/constants.dart';

class GenericCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const GenericCard({Key? key, required this.icon, required this.title, required this.description})
      : super(key: key);

  @override
  State<GenericCard> createState() => _GenericCardState();
}

class _GenericCardState extends State<GenericCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:  EdgeInsets.only(top: _isExpanded? 10: 15 , bottom: _isExpanded? 10: 15, left: 20, right: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color(CARD_SECONDARY),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                            "Description"
                        ),
                       const Expanded(child: SizedBox()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          icon: Icon(
                            _isExpanded ? Icons.arrow_drop_up_sharp : Icons.arrow_drop_down_sharp,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    _isExpanded?
                    SizedBox(
                      height: 60,
                      child: SingleChildScrollView(
                        child: Text(
                          widget.description,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ): const SizedBox(height: 5,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
