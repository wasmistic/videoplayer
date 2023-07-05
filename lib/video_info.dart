import 'dart:convert';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import 'colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfo = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.gradientFirst.withOpacity(0.9),
              AppColor.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h, top:40.h),
                    //width: MediaQuery.of(context).size.width,
                    height: 200.h,
                    //color: Colors.red.withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           GestureDetector(
                             child: Icon(
                               Icons.arrow_back_ios,
                               size: 20.sp,
                               color: AppColor.secondPageIconColor,
                             ),
                             onTap: ()=>Get.back(),
                           ),
                            Icon(
                              Icons.info_outline,
                              size: 20.sp,
                              color: AppColor.secondPageIconColor,
                            ),
                          ],
                        ),
                        Text(
                          'Legs Toning \nand Glutes Workout',
                          style: GoogleFonts.quicksand(
                            height: 1.2,
                            fontSize: 20.sp,
                            color: AppColor.secondPageTitleColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 20.sp,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  Text(
                                    ' 68 min',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 16.sp,
                                      color: AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20.sp,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  Text(
                                    ' Resistant band, Kettlebell',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 16.sp,
                                      color: AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [

                        Container(
                          height: 100.h,
                          padding: EdgeInsets.only(
                            top:40.h,
                            left: 20.w,
                            right: 20.w
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20.sp,
                                  color: AppColor.secondPageIconColor,
                                ),
                              ),
                              Icon(
                                Icons.info_outline,
                                size: 20.sp,
                                color: AppColor.secondPageIconColor,
                              ),
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70.r),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Circuit 1: Legs Toning',
                          style: GoogleFonts.quicksand(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.circuitsColor,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.loop,
                          size: 30.sp,
                          color: AppColor.loopColor,
                        ),
                        Text(
                          ' 3 sets',
                          style: GoogleFonts.quicksand(
                            fontSize: 16.sp,
                            color: AppColor.setsColor,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: _listView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertTwo(int value){
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data:SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 2.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              thumbColor: Colors.redAccent,
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: Colors.red[700],
              inactiveTickMarkColor: Colors.red[100],
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.redAccent,
              valueIndicatorTextStyle: TextStyle(
                  color: Colors.white
              )
          ),
          child: Slider(
            value: max(0, min(_progress * 100, 100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged:(value){
              setState(() {
                _progress = value * 0.01;
              });
            },
            onChangeStart: (value){
              _controller?.pause();
            },
            onChangeEnd: (value){
              final duration = _controller?.value?.duration;
              if(duration!=null){
                var newValue = max(0, min(value, 99)) * 0.01;
                var millis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },
          ),),
        Container(
          height: 40.h,
          width: MediaQuery.of(context).size.width,
          color: AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width:20.w,),
              InkWell(
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {});
                },
                child: Padding(
                  padding:  EdgeInsets.all(6.sp),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0),
                        ),
                      ],
                    ),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final index = _isPlayingIndex - 1;
                          if (index >= 0 && videoInfo.length >= 0) {
                            _initializeVideo(index);
                          } else {
                            Get.snackbar('Video', "No more video to play");
                          }
                        },
                        child: Icon(
                          Icons.fast_rewind,
                          size: 36.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width:30.w,),
                      GestureDetector(
                        onTap: () async {
                          if (_isPlaying) {
                            setState(() {
                              _isPlaying = false;
                            });
                            _controller?.pause();
                          } else {
                            setState(() {
                              _isPlaying = true;
                            });
                            _controller?.play();
                          }
                        },
                        child: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 36.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width:30.w,),
                      GestureDetector(
                        onTap: () async {
                          final index = _isPlayingIndex + 1;
                          if (index <= videoInfo.length - 1) {
                            _initializeVideo(index);
                          } else {
                            Get.snackbar(
                              'Video',
                              'No more video available',
                              snackPosition: SnackPosition.BOTTOM,
                              icon: Icon(
                                Icons.face,
                                size: 30.sp,
                                color: Colors.white,
                              ),
                            );
                          }
                        },
                        child: Icon(
                          Icons.fast_forward,
                          size: 36.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width:30.w,),
                      Text(
                        "$mins:$secs",
                        style: TextStyle(
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 4.0,
                                  color: Color.fromARGB(150, 0, 0, 0)
                              )
                            ]
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text('Being initialized, please wait.'),
        ),
      );
    }
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  void _onControllerUpdate() async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime =0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if(_onUpdateControllerTime > now){
      return;
    }
    _onUpdateControllerTime = now*500;

    final controller = _controller;
    if(controller==null){
      return;
    }
    if(!controller.value.isInitialized){
      return;
    }
    if(_duration==null){
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if(duration==null){
      return;
    }
    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if(playing){
      if(_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() / duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializeVideo(int index) async {
    final controller =
        VideoPlayerController.network(videoInfo[index]['videoUrl']);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((value) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _onTapVideo(int index) {
    _initializeVideo(index);
  }

  _listView() {
    return ListView.builder(
        itemCount: videoInfo.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      //padding: EdgeInsets.all(10),
      height: 120.h,
      // color: Colors.red.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      videoInfo[index]['thumbnail'],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.quicksand(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    videoInfo[index]['time'],
                    style: GoogleFonts.quicksand(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),)
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.sp),
                // width: 80,
                // height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xffeaeefc),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  '15 sec rest',
                  style:GoogleFonts.quicksand(
                    fontSize:11.sp,
                    color: Color(0xff839fed),
                  ),
                ),
              ),
              Expanded(child: Row(
                children: [
                  for (int i = 0;
                  i < MediaQuery.of(context).size.width / 5;
                  i++)
                    i.isEven
                        ? Container(
                      width: 3.w,
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: Color(0xff839fed),
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    )
                        : Container(
                      width: 3.w,
                      height: 1.h,
                      color: Colors.white,
                    ),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
