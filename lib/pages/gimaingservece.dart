import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otherservice.dart';

class GamingServicePage extends StatelessWidget {
  final List<Game> games = [
    Game(
      name: 'PUBG',
      image: 'assets/images/pubg.png',
      route: '/pubg', // Define the route for PUBG
    ),
    Game(
      name: 'Clash',
      image: 'assets/images/clash.png',
      route: '/clash', // Define the route for Clash
    ),
    Game(
      name: 'FreeFire',
      image: 'assets/images/freefir.png',
      route: '/freefire', // Define the route for FreeFire
    ),
    Game(
      name: 'NetFlex',
      image: 'assets/images/netflex.png',
      route: '/game2', // Define the route for Game 2
    ),
    // Add more games here
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Display two cards in each row
            childAspectRatio: 0.75, // Adjust the aspect ratio as needed
          ),
          itemCount: games.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: double.infinity, // Allow cards to expand horizontally
              child: GameButtonCard(
                game: games[index],
                onPressed: () {
                  switch (games[index].name) {
                    case 'PUBG':
                      Get.to(ComingSoonPage());
                      break;
                    case 'Clash':
                      Get.to(ComingSoonPage());
                      break;
                    case 'FreeFire':
                      Get.to(ComingSoonPage());
                      break;
                    case 'Game 2':
                      Get.to(ComingSoonPage());
                      break;
                    default:
                      break;
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void navigateToGamePage(String route) {
    // Here, you can define the logic to navigate to the specific game page
    Get.toNamed(route);
  }
}

class Game {
  final String name;
  final String image;
  final String route;

  Game({required this.name, required this.image, required this.route});
}

class GameButtonCard extends StatelessWidget {
  final Game game;
  final VoidCallback onPressed;

  const GameButtonCard({
    required this.game,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      color: Colors.white70,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Image.asset(
              game.image,
              height: 180,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                game.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}