import 'package:flutter/material.dart';

import '../models/wellcome_card.dart';
import '../widgets/ui_elements/page_indicator.dart';

class WellcomePage extends StatefulWidget {
  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage>
    with TickerProviderStateMixin {
  PageController _pageController;
  AnimationController animationController;

  Animation<double> _scaleAnim;
  int currentpage = 0;
  bool lastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentpage);
    animationController =
        AnimationController(duration: Duration(microseconds: 400), vsync: this);
    _scaleAnim = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _pageController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: _buildBackgroundGradient()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentpage = index;
                  if (currentpage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                  }
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        var page = pageList[index];

                        var delta;
                        var y = 1.0;

                        if (_pageController.position.haveDimensions) {
                          delta = _pageController.page - index;
                          y = 1 - delta.abs().clamp(0.0, 1.0);
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 42),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        page.title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 36.0,
                                            fontFamily: 'Montserrat-Black',
                                            letterSpacing: 1.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.only(left: 36, right: 36),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(page.imageUri),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40, bottom: 20),
                                    child: Text(page.body,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 21.0,
                                            fontFamily: 'Montserrat-Medium',
                                            color: Color(0xFF2E071B))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 35.0, //antes era 55
              child: Container(
                width: 150.0,
                child: PageIndicator(currentpage, pageList.length),
              ),
            ),
            Positioned(
                right: 30.0,
                bottom: 20.0, //antes era 30
                child: ScaleTransition(
                  scale: _scaleAnim,
                  child: lastPage
                      ? FloatingActionButton(
                          backgroundColor: Color(0xFFBE0028),
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/authpage');
                          },
                        )
                      : Container(),
                ))
          ],
        ),
      ),
    );
  }

  LinearGradient _buildBackgroundGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [const Color(0xFFBE0028), const Color(0xFF2E071B)],
      tileMode: TileMode.clamp,
    );
  }
}
