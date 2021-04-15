import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';

class TaskBundle {
  final int id, person, hours, points;
  final String title, description, imageSrc;
  final Color color;

  TaskBundle(
      {this.id,
      this.person,
      this.hours,
      this.points,
      this.title,
      this.description,
      this.imageSrc,
      this.color});
}

// Demo list
List<TaskBundle> recipeBundles = [
  TaskBundle(
    id: 1,
    person: 16,
    hours: 95,
    points: 100,
    title: "Youtube",
    description: "Subscribe to youtube channel",
    imageSrc: "assets/images/youtubeTask.png",
    color: kYoutubeCardColor, //Color(0xFFD82D40),
  ),
  TaskBundle(
    id: 2,
    person: 1000,
    hours: 48,
    points: 200,
    title: "Watch Video",
    description: "watch full video to get reward",
    imageSrc: "assets/images/watchVideo2.png",
    color: kWatchVideoCardColor,
  ),
  TaskBundle(
    id: 3,
    person: 5000,
    hours: 43,
    points: 1000,
    title: "Questionnaire",
    description: "respond to questions to get reward",
    imageSrc: "assets/images/question.png",
    color: kQuestionnaireCardColor,
  ),
  TaskBundle(
    id: 4,
    person: 1000,
    hours: 48,
    points: 200,
    title: "Watch Video",
    description: "watch full video to get reward",
    imageSrc: "assets/images/watchVideo2.png",
    color: kWatchVideoCardColor,
  ),
];
