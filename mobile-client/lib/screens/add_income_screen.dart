import 'package:budget_app/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:budget_app/utilities/constants.dart' as Constant;
import 'package:budget_app/utilities/styles.dart' as Style;

class AddIncome extends StatelessWidget {
  final GlobalKey<FormState> _addIncomeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Constant.screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.tight(Constant.screenSize),
          child: Column(
            children: <Widget>[
             CustomAppBar(
               title: "Add Income",
             ),
              SizedBox(
                height: 48,
              ),
              Form(
                key: _addIncomeFormKey,
                child: Column(
                  children: [
                    Text(
                      'Amount',
                      style: Style.labelText
                          .copyWith(color: Style.alternateTextColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomAdditionTextField(
                      hintText: 'Amount',
                      textStyle: Style.heading2Text
                          .copyWith(color: Style.backgroundColor),
                      hintStyle: Style.heading3Text.copyWith(
                        color: Style.themeGrey,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Category',
                      style: Style.labelText
                          .copyWith(color: Style.alternateTextColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Style.backgroundColor,
                        size: 30,
                      ),
                      value: "Income",
                      onChanged: (value) {},
                      items: [
                        //To be built from a list of categories
                        DropdownMenuItem(
                          child: Text(
                            'Income',
                            style: Style.heading2Text
                                .copyWith(color: Style.backgroundColor),
                          ),
                          value: "Income",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Description',
                      style: Style.labelText
                          .copyWith(color: Style.alternateTextColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomAdditionTextField(
                      hintText: "Description",
                      hintStyle:
                          Style.labelText.copyWith(color: Style.themeGrey),
                      textStyle:
                          Style.heading3Text.copyWith(color: Style.darkBlue),
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomMediumSizedButton(
                label: "Add to records",
                onTap: () {},
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}