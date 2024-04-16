import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Hahaha extends StatefulWidget {
  const Hahaha({Key? key}) : super(key: key);

  @override
  State<Hahaha> createState() => _HahahaState();
}

class _HahahaState extends State<Hahaha> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 4),
        curve: Curves.linear,
      );
    });
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
        child: SafeArea(
          child: Stack(
            children: [
              MasonryGridView.builder(
                controller: scrollController,
                itemCount: 16,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  // Determine if it's in the left column or the right column
                  bool isLeftColumn = index % 2 == 0;
                  // Calculate the offset and alignment based on the column
                  double offset = isLeftColumn ? 0.0 : 20.0;
                  Alignment alignment = isLeftColumn
                      ? Alignment.centerLeft
                      : Alignment.centerRight;
                  return Align(
                    alignment: alignment,
                    child: Transform.translate(
                      offset: Offset(0.0, isLeftColumn ? 0.0 : 30.0),
                      child: Opacity(
                        opacity: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/pic${index + 1}.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
