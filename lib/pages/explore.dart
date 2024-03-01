import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/place_model.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  List<PlaceModel> places = [];

  @override
  void initState() {
    // TODO: implement initState
    places = PlaceModel.getPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 44, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.location_pin,
                          color: Color(0xFF176FF2),
                        ),
                      ),
                      Text('Aspen, USA'),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SvgPicture.asset(
                          'assets/images/chevron-down-solid.svg',
                          width: 14,
                          height: 14,
                          colorFilter: ColorFilter.mode(
                              Color(0xFF176FF2), BlendMode.srcIn),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'Aspen',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SearchBox(),
            SizedBox(
              height: 25,
            ),
            Container(
              child: TabBar(
                controller: _tabController,
                labelColor: Color(0xFF176FF2),
                unselectedLabelColor: Color(0xFFB8B8B8),
                isScrollable: true,
                indicator: BoxDecoration(
                  color: Color(0xFF176FF2).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                tabs: [
                  Tab(text: 'Location'),
                  Tab(text: 'Hotels'),
                  Tab(text: 'Food'),
                  Tab(text: 'Adventure'),
                  Tab(text: 'Adventure')
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(child: locationTab()),
                  SingleChildScrollView(child: locationTab()),
                  SingleChildScrollView(child: locationTab()),
                  SingleChildScrollView(child: locationTab()),
                  SingleChildScrollView(child: locationTab()),
                ],
              )),
            )
          ],
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }

  ClipRRect MyBottomAppBar() {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(30), right: Radius.circular(30)),
      child: BottomAppBar(
        height: 72,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/Home.svg',
                width: 19.17,
                height: 20,
              ),
              SvgPicture.asset(
                'assets/images/Ticket.svg',
                width: 19.17,
                height: 20,
              ),
              SvgPicture.asset(
                'assets/images/Heart.svg',
                width: 19.17,
                height: 20,
              ),
              SvgPicture.asset(
                'assets/images/Profile.svg',
                width: 19.17,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding locationTab() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('See all printed');
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'see all',
                    style: TextStyle(
                      color: Color(0xFF176FF2),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              height: 219,
              child: locationsListView(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Recommended',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              height: 219,
              child: RcommendedListView(),
            ),
          ),
        ],
      ),
    );
  }

  ListView locationsListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/place',
                  arguments: places[index],
                );
              },
              child: Container(
                width: 170,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(places[index].photo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF4D5652),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 9),
                              child: Text(
                                places[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 52,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4D5652),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Color(0xFFF8D675),
                                    ),
                                    Text(
                                      places[index].rating.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFF3F8FE),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    'assets/images/heart-solid.svg',
                                    width: 12,
                                    height: 12,
                                    color: Color(0xFFEC5655),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  ListView RcommendedListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 170,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(places[index].photo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF4D5652),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 9),
                            child: Text(
                              places[index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 52,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Color(0xFF4D5652),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Color(0xFFF8D675),
                                  ),
                                  Text(
                                    places[index].rating.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF3F8FE),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SvgPicture.asset(
                                  'assets/images/heart-solid.svg',
                                  width: 12,
                                  height: 12,
                                  color: Color(0xFFEC5655),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Container SearchBox() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Color(0xFFF3F8FE),
            filled: true,
            hintText: 'Find things to do',
            hintStyle: TextStyle(
              color: Color(0xFFB8B8B8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFFB8B8B8),
            )),
      ),
    );
  }
}
