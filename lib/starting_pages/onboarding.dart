import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/loginStudent.dart';
import 'splash_content.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  int currentPage = 0;
  bool isLastPage = false;
  List<Map<String, String>> splashContent = [
    {
      "imgUrl": "assets/second_page/Group 33694.png",
      "title": "Solve your Issues",
      "text": "Contact to authorities whenever you have any complaints",
    },
    {
      "imgUrl": "assets/third_page/undraw_fast_loading_0lbh 2.png",
      "title": "Fast & Easy!",
      "text": "Now you can mark your entry and exit in just a tap.",
    },
    {
      "imgUrl": "assets/fourth_page/undraw_Account_re_o7id 1.png",
      "title": "Keep Track!",
      "text": "Now keep track of hostelites with our enhanced location tracker",
    }
  ];
  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        softWrap: true,
                      )),
                ],
              ),
              SizedBox(height: 50),
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                        if (currentPage == 2) {
                          setState(() {
                            isLastPage = true;
                          });
                        } else {
                          isLastPage = false;
                        }
                      });
                    },
                    itemCount: splashContent.length,
                    itemBuilder: (context, index) => SplashContent(
                      imgUrl: splashContent[index]["imgUrl"]!,
                      headTitle: splashContent[index]["title"]!,
                      text: splashContent[index]["text"]!,
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            splashContent.length, (index) => buildDot(index)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: isLastPage
                            ? TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  primary: Colors.white,
                                  backgroundColor: Colors.purple,
                                ),
                                onPressed: () async {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: ((context) => LoginStudent()),
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Get Started",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              )
                            : FloatingActionButton(
                                onPressed: () {
                                  print(isLastPage);
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 45.0,
                                ),
                                backgroundColor: Colors.purple,
                              ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildDot(int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        height: 6,
        width: currentPage == index ? 40 : 6,
        decoration: BoxDecoration(
          color: currentPage == index ? Colors.purple : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
