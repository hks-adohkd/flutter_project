import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/data_layer/model/task/taskType_model.dart';

class TaskBundle {
  final int id, person, points;
  final String hours;
  final String title, description, imageSrc;
  final String startDate, endDate;
  final IconData icon;
  final Color color;
  final bool isDone, isReachLimit, stared, isForAll;
  final String link, packageName, pageId, videoId, tutorailLink;
  final int videoDuration;
  final TaskTypeModel taskType;
  TaskBundle(
      {this.id,
      this.person,
      this.hours,
      this.points,
      this.title,
      this.description,
      this.imageSrc,
      this.icon,
      this.color,
      this.endDate,
      this.startDate,
      this.taskType,
      this.videoDuration,
      this.stared,
      this.pageId,
      this.packageName,
      this.link,
      this.isReachLimit,
      this.isForAll,
      this.isDone,
      this.videoId,
      this.tutorailLink});
}

// Demo list
// List<TaskBundle> recipeBundles = [
//   TaskBundle(
//     id: 1,
//     person: 16,
//     hours: 95,
//     points: 100,
//     title: "Youtube",
//     description: "Subscribe to youtube channel",
//     imageSrc: "assets/images/youtubeTask.png",
//     icon: FontAwesomeIcons.youtube,
//     color: kYoutubeCardColor, //Color(0xFFD82D40),
//   ),
//   TaskBundle(
//     id: 2,
//     person: 1000,
//     hours: 48,
//     points: 200,
//     title: "Watch Video",
//     description: "watch full video to get reward",
//     imageSrc: "assets/images/watchVideo2.png",
//     icon: FontAwesomeIcons.video,
//     color: kWatchVideoCardColor,
//   ),
//   TaskBundle(
//     id: 3,
//     person: 5000,
//     hours: 43,
//     points: 1000,
//     title: "Questionnaire",
//     description: "respond to questions to get reward",
//     imageSrc: "assets/images/question.png",
//     icon: FontAwesomeIcons.question,
//     color: kQuestionnaireCardColor,
//   ),
//   TaskBundle(
//     id: 4,
//     person: 1000,
//     hours: 48,
//     points: 200,
//     title: "Watch Video",
//     description: "watch full video to get reward",
//     imageSrc: "assets/images/watchVideo2.png",
//     icon: FontAwesomeIcons.video,
//     color: kWatchVideoCardColor,
//   ),
// ];
