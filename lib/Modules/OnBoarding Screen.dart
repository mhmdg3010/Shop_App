import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled1/Components/components.dart';
import 'package:untitled1/Modules/Login%20Screen/Login%20Screen.dart';
import 'package:untitled1/network/local/cache_helper.dart';



class onBoardModel
{
  String? image;
  String? title;
  String? body;
onBoardModel({
   required this.image,
  required this.body,
  required this.title,
});
}
class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController =PageController();

  List<onBoardModel> boarding =[
    onBoardModel(
        image: 'assets/images/onboarding.png', body: 'Body 1', title: 'title 1'),
    onBoardModel(
        image: 'assets/images/onboarding.png', body: 'Body 2', title: 'title 2'),
    onBoardModel(
        image: 'assets/images/onboarding.png', body: 'Body 3', title: 'title 3'),

  ];
  void submit(){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value!){
        navigateAndfinish(context, ShopLogin());
      }
    });
  }

  bool isLast =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          TextButton(
              onPressed: (){
                submit();
              },
              child: Text(
                'SKIP',
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              )),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index == boarding.length - 1)
                  {
                    setState(() {
                      isLast = true;
                    });
                  }else
                  {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                  controller: boardController,
                  itemBuilder: (context, index)=> buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    count: boarding.length,
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.orange,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(onPressed: ()
                {
                  if(isLast)
                  {
                    submit();
                  }else
                  {
                    boardController.nextPage(
                        duration: Duration(
                          milliseconds: 100,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }

                },
                child: Icon(Icons.arrow_forward_ios_outlined,),
                  backgroundColor: Colors.deepOrange,
                )
              ],
            ),

          ],
        ),
      ),

    );
  }

  Widget buildBoardingItem (onBoardModel)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Center(
          child: Container(
              height: 500,
              width: 300,
              child: Image.asset('${onBoardModel.image}',)),
        ),
      ),
      Text('${onBoardModel.title}',
        style: TextStyle(
          fontSize: 35,
          fontFamily: 'Robot',
          fontWeight: FontWeight.bold,
        ),),
      SizedBox(
        height: 15,),
      Text('${onBoardModel.body}',
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'Robot',
          fontWeight: FontWeight.bold,
        ),),
      SizedBox(height: 30,),


    ],
  );
}


