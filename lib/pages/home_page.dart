import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant/data_json.dart';
import 'package:tiktok_clone/theme/colors.dart';
import 'package:tiktok_clone/widgets/icon_widgets.dart';
import 'package:tiktok_clone/widgets/tiktok_icons.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _tabController.dispose();
  }

  Widget getVideo() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
          controller: _tabController,
          children: List.generate(items.length, (index) {
            return RotatedBox(
              quarterTurns: -1,
              child: VideoItem(
                size: size,
                name: items[index]['name'],
                videoUrl: items[index]['videoUrl'],
                caption: items[index]['caption'],
                song: items[index]['songName'],
                profileImg: items[index]['profileImg'],
                totalLikes: items[index]['likes'],
                totalComments: items[index]['comments'],
                totalShares: items[index]['shares'],
                albumImg: items[index]['albumImg'],
              ),
            );
          })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getVideo();
  }
}

class VideoItem extends StatefulWidget {
  final String profileImg;
  final String videoUrl;
  final String totalLikes;
  final String totalComments;
  final String totalShares;
  final String albumImg;
  final String name;
  final String caption;
  final String song;

  const VideoItem({
    Key key,
    @required this.size,
    this.profileImg,
    this.totalLikes,
    this.totalComments,
    this.totalShares,
    this.albumImg,
    this.name,
    this.caption,
    this.song,
    this.videoUrl,
  }) : super(key: key);

  final Size size;

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  bool isShowingPlayArrow = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoPlayerController.play();
        setState(() {
          isShowingPlayArrow = false;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoPlayerController.value.isPlaying && !isShowingPlayArrow
              ? _videoPlayerController.pause()
              : _videoPlayerController.play();
        });
      },
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        child: Stack(
          children: [
            Container(
              width: widget.size.width,
              height: widget.size.height,
              child: Stack(children: [
                VideoPlayer(_videoPlayerController),
                _videoPlayerController.value.isPlaying
                    ? Container()
                    : Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: 80,
                          color: white.withOpacity(0.5),
                        ),
                      )
              ]),
            ),
            Container(
              width: widget.size.width,
              height: widget.size.height,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, right: 15, left: 15, bottom: 10),
                  child: Column(
                    children: [
                      HeaderHomePage(),
                      Flexible(
                        child: Row(
                          children: [
                            HomeLeftWidget(
                              size: widget.size,
                              name: widget.name,
                              caption: widget.caption,
                              song: widget.song,
                            ),
                            HomeRightWidget(
                              size: widget.size,
                              profileImg: widget.profileImg,
                              totalLikes: widget.totalLikes,
                              totalComments: widget.totalComments,
                              totalShares: widget.totalShares,
                              albumImg: widget.albumImg,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeRightWidget extends StatelessWidget {
  final String profileImg;
  final String totalLikes;
  final String totalComments;
  final String totalShares;
  final String albumImg;
  const HomeRightWidget({
    Key key,
    @required this.size,
    this.profileImg,
    this.totalLikes,
    this.totalComments,
    this.albumImg,
    this.totalShares,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: [
            Container(
              height: size.height * 0.25,
            ),
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getProfile(profileImg),
                  getIcons(TiktokIcons.heart, 20.0, totalLikes),
                  getIcons(TiktokIcons.chatBubble, 20.0, totalComments),
                  getIcons(TiktokIcons.reply, 20.0, totalShares),
                  getAlbum(albumImg)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class HomeLeftWidget extends StatelessWidget {
  final String name;
  final String caption;
  final String song;

  const HomeLeftWidget({
    Key key,
    @required this.size,
    this.name,
    this.caption,
    this.song,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            name,
            style: TextStyle(color: white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: TextStyle(color: white),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.music_note,
                color: white,
                size: 15,
              ),
              Text(
                song,
                style: TextStyle(color: white, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Following",
          style: TextStyle(color: white.withOpacity(0.5), fontSize: 16),
        ),
        SizedBox(width: 5),
        Text(
          "|",
          style: TextStyle(color: white.withOpacity(0.3), fontSize: 16),
        ),
        SizedBox(width: 5),
        Text(
          "For You",
          style: TextStyle(
              color: white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
