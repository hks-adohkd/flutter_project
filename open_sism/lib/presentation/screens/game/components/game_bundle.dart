class Game {
  final String id;
  final String name;
  final String details;
  final String image;

  const Game({this.id, this.name, this.details, this.image});
}

List<Game> games = [
  const Game(
    id: "1",
    name: "Spin Wheel",
    details: "spin to win ",
    image: "assets/images/spin.png",
  ),
  const Game(
    id: "2",
    name: "Golden Spin Wheel",
    details: "spin to win ",
    image: "assets/images/spingolden.png",
  ),
];
