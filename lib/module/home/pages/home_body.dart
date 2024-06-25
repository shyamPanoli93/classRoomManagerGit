import 'package:flutter/material.dart';
import 'package:hamon_student_pro/utils/common_method.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';

import '../../../constant/constant.dart';
import '../../../routes/routes.dart';
import '../model/cardDetails.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool isGridView = true;
  int _currIndex = 0;

  void toggleView() {
    setState(() {
      isGridView = !isGridView;
      _currIndex = _currIndex == 0 ? 1 : 0; // Toggle the state
    });
  }

  void cardClick(String selectedItem) {
    switch (selectedItem) {
      case CARD_ONE:
        navigator(context, Routes.studentScreen);
        break;
      case CARD_TWO:
        navigator(context, Routes.subjectScreen);
        break;
      case CARD_THREE:
        navigator(context, Routes.classRoomScreen);
        break;
      case CARD_FOUR:
        navigator(context, Routes.registrationScreen);
        break;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.8,
            vertical: 20.8,
          ),
          child: Column(
            children: [
              _buildHeaderText(),
              isGridView
                  ? Expanded(child: _buildGridCard())
                  : Expanded(child: _buildListCard()),
            ],
          ),
        ));
  }

  Widget _buildHeaderText() {
    return SizedBox(
      width: MediaQuery
          .sizeOf(context)
          .width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'sf_display',
                  fontSize: 28,
                ),
              ),
              Text(
                'Good Morning',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'sf_display',
                  fontSize: 22,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: toggleView,
            icon: AnimatedSwitcher(
              duration: const Duration(microseconds: 350),
              transitionBuilder: (child, anim) =>
                  RotationTransition(
                    turns: child.key == const ValueKey('icon1')
                        ? Tween<double>(begin: 1, end: 1).animate(anim)
                        : Tween<double>(begin: 0.75, end: 1).animate(anim),
                    child: ScaleTransition(scale: anim, child: child),
                  ),
              child: _currIndex == 0
                  ? const Iconify(Ic.round_menu,
                  size: 32, key: ValueKey('icon1'))
                  : const Iconify(
                Bi.grid_1x2,
                size: 32,
                key: ValueKey('icon2'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 100, 5, 0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // Number of columns
          crossAxisSpacing: 10.0,
          // Spacing between columns
          mainAxisSpacing: 10.0,
          // Spacing between rows
          childAspectRatio: 0.8,
        ),
        itemCount: Constants.cardDetails.length,
        itemBuilder: (context, index) {
          var items = Constants.cardDetails[index];
          return _buildGridViewCard(items);
        },
      ),
    );
  }

  Widget _buildListCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 100, 2, 0),
      child: ListView.builder(
        itemCount: Constants.cardDetails.length,
        itemBuilder: (context, index) {
          var items = Constants.cardDetails[index];
          return _buildGridViewCard(items);
        },
      ),
    );
  }

  Widget _buildGridViewCard(CardDetails cardDetail) {
    return GestureDetector(
      onTap: () => cardClick(cardDetail.title),
      child: Container(
        width: isGridView ? 175 : 356,
        height: isGridView ? 216 : 48,
        margin: EdgeInsets.symmetric(
          horizontal: isGridView ? 5 : 20,
          vertical: isGridView ? 5 : 20,
        ),
        decoration: BoxDecoration(
          color: cardDetail.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              isGridView
                  ? Image.asset(
                cardDetail.icon,
                height: 48,
                width: 48,
              )
                  : Container(),
              SizedBox(height: isGridView ? 10 : 0),
              Text(
                cardDetail.title,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontFamily: 'sf_display',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
