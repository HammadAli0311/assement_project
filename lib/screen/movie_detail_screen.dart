import 'dart:math';

import 'package:assemement_test/constant/colors.dart';
import 'package:assemement_test/constant/icons.dart';
import 'package:assemement_test/model/movie_model.dart';
import 'package:assemement_test/providers/movie_provider.dart';
import 'package:assemement_test/providers/video_provider.dart';
import 'package:assemement_test/screen/seat_mapping_ui.dart';
import 'package:assemement_test/screen/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../apis.dart';
import '../constant/textStyle.dart';
import '../constant/widgets.dart';

class MovieDetailScreen extends StatefulWidget {
  static const routeName = '/MovieDetailScreen';
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  int seconds = 0;
  late YoutubePlayerController _controller;
  bool autoPlay = true;

  void initState() {
    super.initState();
    setState((){
      DeviceOrientation.portraitDown;
      String id=Provider.of<VideoProvider>(context,listen: false).id;
      _controller=YoutubePlayerController(
        params: const YoutubePlayerParams(
          showVideoAnnotations: false,
          showControls: true,
          showFullscreenButton: true,
          loop:false,
          enableCaption: false,
        )
      )
        ..onInit = () {
          if (autoPlay) {
            _controller.loadVideoById(videoId: id, startSeconds: 0);
          } else {
            _controller.cueVideoById(videoId: id, startSeconds: 0);
          }
        }..playerState.whenComplete(() => Navigator.of(context).pop());
    });
    _controller.playerState.whenComplete(() => Navigator.of(context).pop());

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final movieModal = ModalRoute.of(context)!.settings.arguments as MovieModel;

    Provider.of<MovieProvider>(context, listen: false).getGenres(movieModal.id);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                FadeInImage(
                  fit: BoxFit.fill,
                  imageErrorBuilder: (context,Object,StackTrace){
                    return Image.asset(
                        "assets/image.png"
                    );
                  },
                  image: NetworkImage(
                    '${imagePath + movieModal.posterPath}?api_key=${apikey}',
                  ),
                  placeholder: AssetImage(
                      "assets/image.png"
                  ),
                  height: height * .65,
                  width: double.infinity,

                ),
                Positioned(
                    top: height * .02,
                    left: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: backIcon,
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          "Watch",
                          style: TextStyle(color: whiteColor),
                        ),
                      ],
                    )),
                Positioned(
                    bottom: height * .25,
                    left: width * .15,
                    right: width * .15,
                    child: Center(
                        child: Text(
                      'In Theaters ${movieModal.releaseDate}',
                      style: BoldStyle,
                    ))),
                Positioned(
                    bottom: height * .16,
                    left: width * .15,
                    right: width * .15,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, SeatMapping.routeName,arguments: movieModal.title),
                      child: buttonContainer(
                          BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          Text("Get Tickets",
                              style: BoldStyle.copyWith(fontSize: 14)),
                          height,
                          width),
                    )),
                Positioned(
                    bottom: height * .06,
                    left: width * .15,
                    right: width * .15,
                    child: GestureDetector(
                      onTap: () => {
                       Navigator.pushNamed(context, VideoPlayer.routeName,arguments: _controller),

                      },
                      child: buttonContainer(
                          BoxDecoration(
                            border: Border.all(color: blueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              videoIcon,
                              Text("Watch Trailer",
                                  style: BoldStyle.copyWith(fontSize: 14)),
                            ],
                          ),
                          height,
                          width),
                    )),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Genres", style: BoldStyle.copyWith(color: blackColor)),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer<MovieProvider>(
                    builder: (context, genres, child) => SizedBox(
                      height: height * .04,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: genres.genres.length,
                        itemBuilder: (context, index) {
                          print(Random().nextInt(4));
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: colorsList[Random().nextInt(4)],
                            ),
                            child: Center(
                                child: Text(
                              genres.genres[index],
                              style: BoldStyle.copyWith(
                                fontSize: 12,
                              ),
                            )),
                          );
                        },
                      ),
                    ),
                  ),
                  Divider(),
                  Text("Overview",
                      style: BoldStyle.copyWith(color: blackColor)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    movieModal.overview,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: greyColor),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
