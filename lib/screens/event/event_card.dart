import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/routes/router.gr.dart';
import 'package:proyecto4_mobile/size_data.dart';

class EventCard extends StatefulWidget {
  final int id;
  final String name;
  final String description;
  final String date;

  const EventCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.description,
      required this.date})
      : super(key: key);

  @override
  EventCardState createState() => EventCardState();
}

class EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 125,
          color: Colors.blueGrey.shade100,
          child: Row(
            children: <Widget>[
              Container(
                width: 90,
                height: 125,
                child: Image(
                  image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(7.5),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height:
                      getProportionateScreenHeight(5),
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.date),
                        TextButton(
                          child: Text('Detalle >'),
                          onPressed: () {/*
                           widget.id
                           */},
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
