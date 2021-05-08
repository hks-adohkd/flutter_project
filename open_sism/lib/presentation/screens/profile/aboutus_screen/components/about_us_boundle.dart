import 'package:flutter/material.dart';

// class has the variable of about us object to simulate server object
class Video {
  Video({
    @required this.title,
    @required this.thumbnail,
    @required this.url,
  });

  final String title;

  final String thumbnail;

  final String url;
}

class DEV {
  DEV({
    @required this.firstName,
    @required this.lastName,
    @required this.avatar,
    @required this.backdropPhoto,
    @required this.location,
    @required this.biography,
    @required this.videos,
    @required this.contactTitle,
    @required this.email,
    @required this.phone,
  });

  final String firstName;

  final String lastName;

  final String avatar;

  final String backdropPhoto;

  final String location;

  final String biography;

  final String email;
  final String phone;

  final List<Video> videos;
  final String contactTitle;
}
