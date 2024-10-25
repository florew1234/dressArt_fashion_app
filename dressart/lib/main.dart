import 'package:camera/camera.dart';
import 'package:dressart/addPicture.dart';
import 'package:dressart/allSection.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(Home(camera: firstCamera));
}

class Home extends StatelessWidget {
  final CameraDescription camera;

  const Home({super.key, required this.camera });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(camera: camera,),
    );
  }
}

class HomePage extends StatefulWidget {
  final CameraDescription camera;

  const HomePage({super.key, required this.camera });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: Image.asset(
            '../assets/images/DressArt_text.png',
            width: 130,
            height: 130,
          ),
          toolbarHeight: 100,
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: ListView(
          children: [
            // const Text(
            //   "Home",
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            // ),
            Container(
              height: 500,
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                colors: [Color(0xffffffff), Color(0xff000000)],
                stops: [0, 1],
                center: Alignment.center,
              )),
              child: Image.asset('../assets/images/home.jpeg'),
            ),

            // Container(
            //   child: const Text(
            //       'Plateforme de modélisation 3D pour optimiser le procesus de confection de tenue basée sur la réalité virtuelle.',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 16,
            //       )),
            // ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              // height: 50,
              child: ElevatedButton(
              
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddPicture(camera: widget.camera))
                  ),
                  child: const Text('Commencez maintenant', style: TextStyle(color: Colors.black, fontSize: 20),),),
            )
          ],
        ));
  }
}
