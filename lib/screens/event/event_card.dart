import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/routes/router.gr.dart';
import 'package:proyecto4_mobile/size_data.dart';

class EventCard extends StatefulWidget {
  final int id;
  final String name;
  final String description;
  final String date;
  final String route;

  const EventCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.description,
      required this.date,
      required this.route})
      : super(key: key);

  @override
  EventCardState createState() => EventCardState();
}

class EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 125,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryColorGradient, kPrimaryLightColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 90,
                height: 125,
                child: Image(
                  image: NetworkImage(
                    widget.route,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(7.5),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      widget.name,
                      textScaleFactor: 1.2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.description,
                      textAlign: TextAlign.justify,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.date),
                        TextButton(
                          child: const Text(
                            'Detalle >',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // color: kPrimaryColor,
                            ),
                          ),
                          onPressed: () {
                            AutoRouter.of(context)
                                .push(EventDetailRoute(id: widget.id));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
