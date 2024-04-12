import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:google_fonts/google_fonts.dart';

class haha extends StatefulWidget {
  const haha({super.key});

  @override
  State<haha> createState() => _hahaState();
}

class _hahaState extends State<haha> {
/////////////////////////////////////
//@CodeWithFlexz on Instagram
//
//AmirBayat0 on Github
//Programming with Flexz on Youtube
/////////////////////////////////////
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 16 * 10), curve: Curves.linear);
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            MasonryGridView.builder(
              itemCount: 16,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (context, index) => Opacity(
                opacity: 0.4,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/pic${index + 1}.png',
                      ),
                    )),
              ),
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
