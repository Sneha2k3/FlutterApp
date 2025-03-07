import 'package:flutter/material.dart';
import 'package:flutterapp/view/signup.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: PageView(
        children: [
          // Page 1
          const OnboardingPage(
            imagePath: 'assets/images/landing22.jpg',
            title: "Welcome to \nHealthBag",
            description: "Your Health, Your Priority",
            pageIndex: 0,
          ),

          // Page 2
          const OnboardingPage(
            imagePath: 'assets/images/landingg.jpg',
            title: "Book appointments \nseemlessly",
            description:
                "Monitor your health data anytime, anywhere, and stay ahead with real-time updates and insights.",
            slogan: "Stay Informed, Stay Healthy",
            pageIndex: 1,
          ),

          // Page 3
          OnboardingPage(
            imagePath: 'assets/images/landing33.jpg',
            title: "Achieve Your Health Goals",
            description:
                "Set personalized goals, track progress, and achieve milestones for a healthier you.",
            slogan: "Empower Your Wellness Journey",
            isFinalPage: true,
            pageIndex: 2,
            onButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String? slogan;
  final bool isFinalPage;
  final VoidCallback? onButtonPressed;
  final int pageIndex;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.slogan,
    this.isFinalPage = false,
    this.onButtonPressed,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final screenWidth = MediaQuery.of(context).size.width;
    final titleFontSize = screenWidth * (isPortrait ? 0.08 : 0.06);
    final descriptionFontSize = screenWidth * 0.04;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: titleFontSize,
                    fontFamily: 'OpenSans ExtraBold',
                  ),
                ),
              ),
              if (slogan != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Text(
                      slogan!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 119, 119, 119),
                        fontSize: descriptionFontSize,
                        fontFamily: 'OpenSans SemiBoldItalic',
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 95, 95, 95),
                      fontSize: descriptionFontSize,
                      fontFamily: 'OpenSans Regular',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color:
                          index == pageIndex ? Colors.blueAccent : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              if (isFinalPage)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'OpenSans ExtraBold',
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
