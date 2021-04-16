class Planet {
  final String id;
  final String name;
  final String location;
  final String image;

  const Planet({this.id, this.name, this.location, this.image});
}

List<Planet> planets = [
  const Planet(
    id: "1",
    name: "Message",
    location: "your message here ",
    image: "assets/images/message.png",
  ),
  const Planet(
    id: "2",
    name: "Order",
    location: "your prize order here ",
    image: "assets/images/order.png",
  ),
  const Planet(
    id: "3",
    name: "Finished Task",
    location: "your finished task here ",
    image: "assets/images/task.png",
  ),
];
