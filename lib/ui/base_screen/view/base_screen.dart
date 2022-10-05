import 'package:currency/app/theme/app_dark_theme.dart';
import 'package:currency/ui/base_screen/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseController>(
          create: (final BuildContext context) {
            return BaseController();
          },
        ),
      ],
      child: SafeArea(
          top: true,
          right: true,
          bottom: true,
          left: true,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: buildAppBar(),
                  body: Consumer(
                    builder: (
                      final BuildContext context,
                      final BaseController baseController,
                      final Widget? child,
                    ) =>
                        baseController.widgetOptions
                            .elementAt(baseController.selected),
                  ),
                  bottomNavigationBar: BottomNavigationBarTheme(
                    data: AppDarkTheme().bottomNavigationBarThemeData,
                    child: buildBottomNavBar(),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.change_circle_outlined),
          SizedBox(
            width: 4,
          ),
          Text(
            "Currency",
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  buildBottomNavBar() {
    return Consumer(
        builder: (
      final BuildContext context,
      final BaseController baseController,
      final Widget? child,
    ) =>
            BottomNavigationBar(
              currentIndex: baseController.selected,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.compare_arrows_outlined),
                  label: 'Exchange',
                )
              ],
              onTap: (value) {
                baseController.selected = value;
              },
            ));
  }
}
