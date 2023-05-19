import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:line_icons/line_icons.dart';
import 'package:spotify_clone/utils/notifier.dart';
import 'package:get/get.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AudioPlayerPro extends StatefulWidget {
  AudioPlayerPro(
      {super.key,
      required this.audiourl,
      required this.image,
      required this.name});

  final String audiourl;
  final String image;
  final String name;
  @override
  State<AudioPlayerPro> createState() => _AudioPlayerProState();
}

class _AudioPlayerProState extends State<AudioPlayerPro> {
  Notify notify = Get.find();
  Duration _duration = Duration();
  Duration _position = Duration();
  static AudioPlayer advancedPlayer = AudioPlayer();
  @override
  void initState() {
    initplayer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initplayer() {
    advancedPlayer = AudioPlayer();
    advancedPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    advancedPlayer.onPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });
  }

  void seekToSecond(second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  double setChanged() {
    Duration newduration = Duration(seconds: 0);
    advancedPlayer.seek(newduration);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 40),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.brown, Colors.black87])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  LineIcons.angleDown,
                  color: Colors.greenAccent,
                ),
                Column(
                  children: [
                    Text(
                      'PLAYING FROM ALBUM',
                      style: TextStyle(
                          letterSpacing: 1, fontSize: 11, color: Colors.white),
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LibreFranklin',
                          fontSize: 13,
                          color: Colors.white),
                    )
                  ],
                ),
                Icon(
                  LineIcons.verticalEllipsis,
                  color: Colors.greenAccent,
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: 325,
              child: ClipRRect(child: Image.asset(widget.image)),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            wordSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LibreFranklin',
                            fontSize: 13,
                            color: Colors.white),
                      ),
                      Text(
                        'Classics',
                        style: TextStyle(
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LibreFranklin',
                            fontSize: 13,
                            color: Colors.grey.shade400),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      notify.isheartpresed.value =
                          notify.isheartpresed.value ? false : true;
                    },
                    icon: Obx(() => (notify.isheartpresed.value)
                        ? Icon(
                            Icons.favorite,
                            size: 24,
                            color: Colors.greenAccent,
                          )
                        : Icon(
                            LineIcons.heart,
                            size: 24,
                            color: Colors.white,
                          )),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 4),
                        thumbColor: Colors.white,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade300,
                        activeTickMarkColor: Colors.white),
                    child: Slider(
                      value: (_position.inSeconds.toDouble() !=
                              _duration.inSeconds.toDouble()
                          ? _position.inSeconds.toDouble()
                          : setChanged()),
                      onChanged: (value) {
                        setState(() {
                          seekToSecond(value.toInt());
                          value = value;
                        });
                      },
                      max: _duration.inSeconds.toDouble(),
                      min: 0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_position.inMinutes.toInt()}:${(_position.inSeconds % 60).toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LibreFranklin',
                        color: Colors.grey.shade400),
                  ),
                  Text(
                    '${_duration.inMinutes.toInt()}:${(_duration.inSeconds % 60).toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LibreFranklin',
                        color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(LineIcons.random, color: Colors.grey.shade700),
                      InkWell(
                          child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 40,
                      )),
                      Container(
                        child: Center(
                          child: IconButton(
                            iconSize: 70,
                            onPressed: () {
                              notify.isiconplay.value =
                                  notify.isiconplay.value ? false : true;
                              if (notify.isiconplay.value) {
                                advancedPlayer.play(UrlSource(widget.audiourl));
                              } else {
                                advancedPlayer.pause();
                              }
                              AwesomeNotifications().createNotification(
                                  content: NotificationContent(
                                      id: 78,
                                      channelKey: 'Spotify',
                                      title: 'Now Playing- ${widget.name}',
                                      autoDismissible: false,
                                      displayOnBackground: true),
                                  actionButtons: [
                                    NotificationActionButton(
                                      key: 'play',
                                      label: 'play',
                                      autoDismissible: false,
                                      showInCompactView: true,
                                    ),
                                    NotificationActionButton(
                                      key: 'pause',
                                      label: 'pause',
                                      autoDismissible: false,
                                      showInCompactView: true,
                                    ),
                                    NotificationActionButton(
                                      key: 'stop',
                                      label: 'stop',
                                      autoDismissible: false,
                                      showInCompactView: true,
                                    )
                                  ]);
                            },
                            icon: Obx(() => (notify.isiconplay.value)
                                ? Icon(
                                    Icons.pause_circle_filled,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.white,
                                  )),
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.skip_next,
                            color: Colors.white,
                            size: 40,
                          )),
                      Icon(
                        Icons.repeat,
                        color: Colors.grey.shade400,
                      )
                    ]),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(children: [
                  Icon(Icons.speaker_group_outlined,
                      color: Colors.grey.shade700),
                  Spacer(
                    flex: 5,
                  ),
                  InkWell(
                      onTap: () {
                        FlutterShare.share(
                            title: 'song', linkUrl: 'https://spotify');
                      },
                      child: Icon(
                        Icons.share_outlined,
                        color: Colors.grey.shade400,
                      )),
                  Spacer(),
                  Icon(
                    Icons.line_weight_sharp,
                    color: Colors.grey.shade400,
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
