import 'package:adventuregame/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,

        // Font Family
        fontFamily: 'DeliciousHandrawn',
      ), // we are using the dark theme
      home: StoryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Create a storyBrain list
StoryBrain storyBrain = new StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),

        // Add the background Image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/starry.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    // Get the story from storyBrain
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // Choice 1 made by user
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red),
                    foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                    // shape: MaterialStateProperty.resolveWith(
                    //         (states) => BeveledRectangleBorder()),
                    shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  child: Text(
                    // Get the choice 1 from storyBrain
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  // When story is end this button will not pop up
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      // Choice 2 made by user
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.blue),
                      foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                      // shape: MaterialStateProperty.resolveWith(
                      //         (states) => BeveledRectangleBorder()),
                      shape: MaterialStateProperty.resolveWith(
                                (states) => RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                      ),

                    ),
                    child: Text(
                      // Get the choice 2 from storyBrain
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 23.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

