import 'package:flutter/material.dart';



class AllSection extends StatefulWidget {
  const AllSection({super.key});

  @override
  State<AllSection> createState() => _AllSectionState();
}

class _AllSectionState extends State<AllSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("data"),
      // GridView.count(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 2,
      //   children: [
      //     Card(
      //       child: Image.asset('../assets/images/DressArt_text.png'),
      //     ),
      //     Card(
      //       child: Image.asset('../assets/images/DressArt_text.png'),
      //     ),
      //     Card(
      //       child: Image.asset('../assets/images/DressArt_text.png'),
      //     ),
      //     Card(
      //       child: Image.asset('../assets/images/DressArt_text.png'),
      //     ),
      //   ],
      // ),
    );
  }
}
