import 'package:currency/app/model/currency_model.dart';
import 'package:currency/app/theme/app_colors.dart';
import 'package:currency/app/theme/app_dark_theme.dart';
import 'package:currency/core/helper/request_helper.dart';
import 'package:currency/ui/exchange_page/controller/exchange_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangePage extends StatelessWidget {
  ExchangePage({Key? key}) : super(key: key);

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExchangeController>(
          create: (final BuildContext context) {
            return ExchangeController();
          },
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: buildBody(context),
        ),
      ),
    );
  }

  buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Base Currency : ",
                            style: AppDarkTheme().textTheme.subtitle1,
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
                            final ExchangeController exchangeController,
                            final Widget? child,
                          ) =>
                              DropdownButton<String>(
                            items: exchangeController.items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    value,
                                    style: AppDarkTheme().textTheme.bodyText1,
                                  ),
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
                            value: exchangeController.selectedBase,
                            icon: const Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: Icon(Icons.arrow_drop_down_rounded)),
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.black26,
                            underline: Container(),
                            isExpanded: true,
                            onChanged: (value) {
                              exchangeController.selectedBase = value!;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Target Currency : ",
                            style: AppDarkTheme().textTheme.subtitle1,
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
                            final ExchangeController exchangeController,
                            final Widget? child,
                          ) =>
                              DropdownButton<String>(
                            items: exchangeController.items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    value,
                                    style: AppDarkTheme().textTheme.bodyText1,
                                  ),
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
                            value: exchangeController.selectedTarget,
                            icon: const Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: Icon(Icons.arrow_drop_down_rounded)),
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.black26,
                            underline: Container(),
                            isExpanded: true,
                            onChanged: (value) {
                              exchangeController.selectedTarget = value!;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.16,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Amount :",
                        style: AppDarkTheme().textTheme.subtitle1,
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
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: myController,
                        obscureText: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '1',
                            hintStyle: AppDarkTheme().textTheme.bodyText1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                child: Consumer(
              builder: (
                final BuildContext context,
                final ExchangeController exchangeController,
                final Widget? child,
              ) =>
                  ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.change_circle_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Exchange'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.opaqueBackground.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.08),
                ),
                onPressed: () {
                  exchangeController.futureVal = RequestHelper()
                      .getExchangeRate(exchangeController.selectedBase,
                          exchangeController.selectedTarget);
                  exchangeController.baseValue =
                      double.parse(myController.text);
                },
              ),
            )),
            const SizedBox(
              height: 25,
            ),
            Consumer(
              builder: (
                final BuildContext context,
                final ExchangeController exchangeController,
                final Widget? child,
              ) =>
                  FutureBuilder<CurrencyModel>(
                      future: exchangeController.futureVal,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                                color:
                                    AppColors.opaqueBackground.withOpacity(0.2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    exchangeController.baseValue
                                        .toStringAsFixed(4),
                                    style: AppDarkTheme().textTheme.bodyText1,
                                  ),
                                  Text(
                                    (exchangeController.baseValue *
                                            snapshot.data!.value!)
                                        .toStringAsFixed(4),
                                    style: AppDarkTheme().textTheme.subtitle1,
                                  ),
                                ],
                              ),
                            ),
                          );
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
    );
  }
}
