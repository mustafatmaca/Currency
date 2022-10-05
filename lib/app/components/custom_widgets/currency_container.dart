import 'package:currency/app/model/currency_model.dart';
import 'package:currency/app/theme/app_colors.dart';
import 'package:currency/app/theme/app_dark_theme.dart';
import 'package:flutter/material.dart';

class CurrencyContainer {
  CurrencyModel? currencyModel;

  CurrencyContainer({this.currencyModel});

  Widget? showContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.opaqueBackground.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Text(currencyModel!.code!,
                    style: AppDarkTheme().textTheme.bodyText1),
              ],
            ),
            Text(currencyModel!.value!.toStringAsFixed(4),
                style: AppDarkTheme().textTheme.bodyText1)
          ],
        ),
      ),
    );
  }
}
