import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/components/assets.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/components/video_card.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/components/about_us_boundle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_sism/logic/blocs/aboutBloc/about.dart';

class BuildContent {
  // final DEV dev;

  final DEV dev = DEV(
    firstName: 'Open',
    lastName: 'Simsm',
    avatar: "assets/images/logoBodyCircle.png",
    backdropPhoto: backdrop,
    location: 'Riyadh, saudi Arabia',
    biography: 'Siddhartha  Joshi is a Flutter dev  '
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.  '
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    contactTitle: "Contact",
    email: "yazbek@gmail.com",
    phone: "+963934631746",
    videos: <Video>[
      Video(
        title: 'Yazbek Flutter',
        thumbnail: "assets/images/logoBody2.png",
        url: 'https://www.youtube.com/watch?v=06qoTsKYWKE',
      ),
      Video(
        title: 'WIFI hacking part 2',
        thumbnail: sidVideoThumbs[1],
        url: 'https://www.youtube.com/watch?v=3XG4c5_mGCM',
      ),
      Video(
        title: 'WIFI hacking part 3',
        thumbnail: sidVideoThumbs[2],
        url: 'https://www.youtube.com/watch?v=C29QstsxWQE',
      ),
      Video(
        title: 'Find facebook users location',
        thumbnail: sidVideoThumbs[3],
        url: 'https://www.youtube.com/watch?v=J9zhKtL_gH0',
      ),
    ],
  );

  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildInfo(),
          _buildTitle(dev.contactTitle),
          _buildContactInfo(),
          _buildSocialsRow(),
          _buildTitle("About Video"),
          _buildVideoScroller(),

          // _buildbuton(context),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white30),
      ),
      margin: const EdgeInsets.only(top: 32.0, left: 16.0),
      padding: const EdgeInsets.all(3.0),
      child: ClipOval(
        child: Image(
          image: AssetImage(dev.avatar),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is AboutLoadedSuccess) {
                return Text(
                  "Open Simsm",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                );
              } else
                return Text("");
            },
          ),
          Text('\n'),
          BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is AboutLoadedSuccess) {
                return Text(
                  state.aboutData.content.location != null
                      ? state.aboutData.content.location.value
                      : " ",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontWeight: FontWeight.w500,
                  ),
                );
              } else
                return Text("");
            },
          ),
          Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 225.0,
            height: 1.0,
          ),
          BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is AboutLoadedSuccess) {
                return Text(
                  state.aboutData.content.aboutUs != null
                      ? state.aboutData.content.aboutUs.script
                      : " ",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    height: 1.4,
                  ),
                );
              } else
                return Text("");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildVideoScroller() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(220.0),
        child: BlocBuilder<AboutBloc, AboutState>(builder: (context, state) {
          if (state is AboutLoadedSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: state.videoList.length,
              itemBuilder: (BuildContext context, int index) {
                //var video = state.videoList[index];
                return VideoCard(state.videoList[index]);
              },
            );
          } else
            return VideoCard(Video(title: "No Data Available", url: " "));
        }),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black54,
          ),
          //_buildSocialsRow(),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5.0),
          Row(
            children: <Widget>[
              SizedBox(width: 30.0),
              Icon(
                Icons.mail,
                color: Colors.black54,
              ),
              SizedBox(width: 10.0),
              BlocBuilder<AboutBloc, AboutState>(
                builder: (context, state) {
                  if (state is AboutLoadedSuccess) {
                    return Text(
                      state.email,
                      style: TextStyle(fontSize: 16.0),
                    );
                  } else
                    return Text("");
                },
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              SizedBox(width: 30.0),
              Icon(
                Icons.phone,
                color: Colors.black54,
              ),
              SizedBox(width: 10.0),
              BlocBuilder<AboutBloc, AboutState>(
                builder: (context, state) {
                  if (state is AboutLoadedSuccess) {
                    return Text(
                      state.phone,
                      style: TextStyle(fontSize: 16.0),
                    );
                  } else
                    return Text("");
                },
              ),
            ],
          ),
          // _buildSocialsRow(),
        ],
      ),
    );
  }

  // 'whatsapp://send?phone=${state.about.whatsup}'
  Widget _buildSocialsRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20.0),
          BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is AboutLoadedSuccess) {
                if (state.faceBook != " ") {
                  return IconButton(
                    //color: Colors.indigo,
                    icon: Icon(FontAwesomeIcons.facebookSquare),
                    onPressed: () {
                      print(state.faceBook);
                      _launchURL(state.faceBook);
                    },
                  );
                } else
                  return Text("");
              } else
                return Text("");
            },
          ),
          SizedBox(width: 5.0),
          BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is AboutLoadedSuccess) {
                if (state.whats != " ") {
                  return IconButton(
                    icon: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      print(state.whats);
                      _launchURL('whatsapp://send?phone=${state.whats}');
                    },
                  );
                } else
                  return Text(" ");
              } else
                return Text(" ");
            },
          ),
          SizedBox(width: 5.0),
          BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is AboutLoadedSuccess) {
                if (state.youtube != " ") {
                  return IconButton(
                    color: Colors.red,
                    icon: Icon(FontAwesomeIcons.youtube),
                    onPressed: () {
                      print(state.youtube);
                      _launchURL(state.youtube);
                    },
                  );
                } else
                  return Text("");
              } else
                return Text("");
            },
          ),
          SizedBox(width: 5.0),
          BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is AboutLoadedSuccess) {
                if (state.instagram != " ") {
                  return IconButton(
                    color: Colors.purple,
                    icon: Icon(FontAwesomeIcons.instagram),
                    onPressed: () {
                      print(state.instagram);
                      _launchURL(state.instagram);
                    },
                  );
                } else
                  return Text("");
              } else
                return Text("");
            },
          ),
          SizedBox(width: 5.0),
          BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is AboutLoadedSuccess) {
                if (state.telegram != " ") {
                  return IconButton(
                    // color: Colors.purple,
                    icon: Icon(FontAwesomeIcons.telegram),
                    onPressed: () {
                      print(state.telegram);
                      _launchURL(state.telegram);
                    },
                  );
                } else
                  return Text("");
              } else
                return Text("");
            },
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
