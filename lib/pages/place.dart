import 'package:aspen/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Place extends StatefulWidget {
  const Place({super.key});

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  @override
  Widget build(BuildContext context) {
    PlaceModel place = ModalRoute.of(context)?.settings.arguments as PlaceModel;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:30, bottom: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(place.photo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFF3F8FE),
                          image: DecorationImage(
                              image: AssetImage('assets/images/back.png')),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:320, left: 260),
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF3F8FE),
                      image: DecorationImage(
                          image: AssetImage('assets/images/Heart.png')),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    place.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Show map',
                    style: TextStyle(
                      color: Color(0xFF176FF2),
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 12,
                    color: Color(0xFFDF9652),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      place.rating.toString(),
                      style: TextStyle(
                        color: Color(0xFF606060),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      '(${place.reviews.toString()})',
                      style: TextStyle(
                        color: Color(0xFF606060),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                place.description,
                style: TextStyle(
                  color: Color(0xFF3A544F),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Read More',
                    style: TextStyle(
                      color: Color(0xFF176FF2),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'assets/images/chevron-down-solid.svg',
                    width: 12,
                    height: 12,
                    colorFilter: const ColorFilter.mode(
                        Color(0xFF176FF2), BlendMode.srcIn),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Facilities',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 77,
                    height: 74,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/images/Heater.png'))),
                  ),
                  Container(
                    width: 77,
                    height: 74,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/images/Dinner.png'))),
                  ),
                  Container(
                    width: 77,
                    height: 74,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/images/Tub.png'))),
                  ),
                  Container(
                    width: 77,
                    height: 74,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/images/Pool.png'))),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        '\$${place.price.toString()}',
                        style: TextStyle(
                          color: Color(0xFF2DD7A4),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 223,
                      height: 56,
                      decoration: BoxDecoration(
                          color: Color(0xFF176FF2),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF176FF2).withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                            )
                          ]),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                                image: AssetImage(
                                    'assets/images/Arrow - Right.png')),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
