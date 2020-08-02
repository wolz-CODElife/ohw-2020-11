import 'package:budget_app/screens/edit_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budget_app/utilities/styles.dart' as Style;
import 'package:budget_app/utilities/constants.dart' as Constant;

class ScreenBackgroundGradient extends StatelessWidget {
  ScreenBackgroundGradient({this.child, this.constraints, this.fill = 67});

  final Widget child;
  final BoxConstraints constraints;
  final _gradientColors = [
    Style.backgroundColor,
    Style.backgroundColor,
    Style.themeWhite,
    Style.themeWhite,
  ];
  final double fill;

  @override
  Widget build(BuildContext context) {
    final double fillPercent = fill; // fills 67% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return Container(
      child: child,
      constraints: constraints,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _gradientColors,
          stops: stops,
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      ),
    );
  }
}

class HomeBudgetCard extends StatelessWidget {
  const HomeBudgetCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Style.themeWhite,
        borderRadius: BorderRadius.circular(24),
        boxShadow: Constant.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Budget for May",
            style: Style.labelText.copyWith(color: Style.alternateTextColor),
          ),
          Text(
            "N200,000",
            style: Style.heading1Text.copyWith(color: Style.backgroundColor),
          ),
          Text(
            "+N10,000 income",
            style: Style.labelText.copyWith(color: Colors.green),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "-N5,000 expense",
                style: Style.labelText.copyWith(color: Style.themeRed),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) => EditCategories(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Style.backgroundColor.withOpacity(0.1)),
                  child: Icon(
                    Icons.more_horiz,
                    color: Style.backgroundColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.backgroundColor,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: (){Navigator.pop(context);},
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Style.themeWhite,
            ),
          ),
          Spacer(),
          Text(
            title,
            style:
            Style.heading3Text.copyWith(color: Style.themeWhite),
          ),
          Spacer()
        ],
      ),
      height: Constant.screenSize.height * 0.2,
    );
  }
}

class ExpenseCard extends StatelessWidget {
  const ExpenseCard(
      {Key key,
      @required this.amountRemaining,
      @required this.amountSpent,
      @required this.category,
      @required this.percentageLeft})
      : super(key: key);
  final String category;
  final String percentageLeft;
  final String amountRemaining;
  final String amountSpent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
          color: Style.themeWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: Constant.boxShadow),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                category,
                style: Style.labelText.copyWith(color: Style.darkBlue),
              ),
              Text(
                'N$amountRemaining',
                style: Style.labelText.copyWith(color: Style.backgroundColor),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "$percentageLeft% left",
                style: Style.heading4Text
                    .copyWith(color: Style.alternateTextColor),
              ),
              Text(
                'N$amountSpent spent',
                style: Style.heading4Text
                    .copyWith(color: Style.alternateTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomLongButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final Color color;
  final Color labelColor;

  const CustomLongButton(
      {@required this.label,
      @required this.onTap,
      this.color,
      this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(
        height: 40,
        width: double.infinity,
      ),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: color ?? Style.themeWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: onTap,
        child: Text(
          label ?? '',
          textAlign: TextAlign.center,
          style: Style.heading4Text.copyWith(
            color: labelColor ?? Style.backgroundColor,
          ),
        ),
      ),
    );
  }
}

class CustomMediumSizedButton extends StatelessWidget {
  CustomMediumSizedButton({this.onTap, this.label});

  final Function onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(
        height: 40,
      ),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 8),
        color: Style.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: onTap,
        child: Text(
          label ?? '',
          textAlign: TextAlign.center,
          style: Style.heading4Text.copyWith(
            color: Style.themeWhite,
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key key,
      this.controller,
      this.hintText,
      this.keyboardType,
      this.validator})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: Style.labelText.copyWith(color: Style.themeWhite),
      keyboardType: keyboardType,
      obscureText: keyboardType == TextInputType.visiblePassword ? true : false,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintStyle: Style.labelText.copyWith(
          color: Style.themeWhite.withOpacity(0.75),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Style.themeWhite.withOpacity(0.25),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Style.themeWhite),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  MenuButton({
    this.pressed = false,
    this.label,
    @required this.onTap,
  });

  final bool pressed;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: Style.heading2Text
                  .copyWith(color: Style.themeWhite, fontSize: 23),
            ),
            SizedBox(
              height: 8,
            ),
            if (pressed == true)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constant.screenSize.width * 0.24),
                child: Divider(
                  thickness: 4,
                  height: 0,
                  color: Style.themeWhite,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class CustomShortButton extends StatelessWidget {
  CustomShortButton({this.label, this.onTap,this.color,this.labelColor});

  final String label;
  final Function onTap;
  final Color labelColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15),
     //   width: 100,
        decoration: BoxDecoration(
          color: color??Style.backgroundColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: Style.heading4Text.copyWith(
            color: labelColor??Style.backgroundColor,
          ),
        ),
      ),
    );
  }
}


class CustomAdditionTextField extends StatelessWidget {
  const CustomAdditionTextField(
      {Key key,
        this.textStyle,
        this.hintStyle,
        this.hintText,
        this.keyboardType})
      : super(key: key);
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constant.screenSize.width * 0.4,
      child: TextFormField(
        keyboardType: keyboardType,
        style: textStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, top: 0, bottom: 0),
          hintText: hintText,
          hintStyle: hintStyle,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Style.alternateTextColor.withOpacity(0.25),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Style.alternateTextColor),
          ),
        ),
      ),
    );
  }
}
