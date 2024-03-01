import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 93),
                child: Text(
                  'Aspen',
                  style: TextStyle(
                      color: Colors.white, fontSize: 116, fontFamily: 'Hiatus'),
                ),
              ),
            ),
            const SizedBox(height: 270),
            const Padding(
              padding: EdgeInsets.only(left:32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plan your',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Luxurious',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    'Vacation',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed('/explore');
                },
                child: Container(
                  margin: EdgeInsets.only(top:15),
                  width: 335,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Color(0xFF176FF2),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(
                    child: Text(
                      'Explore',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
