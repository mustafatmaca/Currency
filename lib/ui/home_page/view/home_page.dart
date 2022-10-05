import 'package:currency/app/components/custom_widgets/currency_container.dart';
import 'package:currency/app/model/currency_model.dart';
import 'package:currency/app/theme/app_colors.dart';
import 'package:currency/app/theme/app_dark_theme.dart';
import 'package:currency/core/helper/request_helper.dart';
import 'package:currency/ui/home_page/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Api api = const Api();

  // late Future<List<CurrencyModel>> futureCurrency;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (final BuildContext context) {
            return HomeController();
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 16),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.16,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Base Currency : ",
                          style: AppDarkTheme().textTheme.bodyText1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.opaqueBackground.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Consumer(
                        builder: (
                          final BuildContext context,
                          final HomeController homeController,
                          final Widget? child,
                        ) =>
                            DropdownButton<String>(
                          items: homeController.items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Please choose a currency",
                              style: AppDarkTheme().textTheme.bodyText1,
                            ),
                          ),
                          value: homeController.selected,
                          icon: const Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Icon(Icons.arrow_drop_down_rounded)),
                          iconEnabledColor: Colors.white,
                          dropdownColor: Colors.black26,
                          underline: Container(),
                          isExpanded: true,
                          onChanged: (value) {
                            homeController.selected = value!;
                            homeController.futureCur =
                                RequestHelper().getCurrencies(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Currencies",
                      style: AppDarkTheme().textTheme.headline1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Consumer(
                        builder: (
                          final BuildContext context,
                          final HomeController homeController,
                          final Widget? child,
                        ) =>
                            FutureBuilder<List<CurrencyModel>>(
                                future: homeController.futureCur,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              CurrencyContainer(
                                                      currencyModel:
                                                          snapshot.data![index])
                                                  .showContainer(context)!,
                                              const SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          );
                                        });
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }

                                  // By default, show a loading spinner.
                                  return const CircularProgressIndicator();
                                }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
