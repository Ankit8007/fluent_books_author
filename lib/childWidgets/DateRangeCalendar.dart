import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/size.dart';

class DateRangeCalendar extends StatelessWidget {
  const DateRangeCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration outerDatesDecoration = BoxDecoration(
        color: greyHint.withOpacity(0.2),
    );
    TextStyle normalBlackTextStyle = txt_16_black;
    TextStyle monthStyle = txt_16_black_600;
    TextStyle normalWhiteTextStyle = txt_16_white;
    TextStyle normalGreyTextStyle = txt_16_black;
    Color weekBackground = greyHint.withOpacity(0.3);
    Color background = white;
    Color selectBackground = pink_magentaRed;
    Color selectRangeBackground = blue.withOpacity(0.17);
    double headersHeight = s20 * 3;
    return Container(
      height: 450,
      //padding: EdgeInsets.symmetric(vertical: s5,horizontal: s5),
      decoration: boxDecoration(
        radius: s5,
        borderColor: greyHint,

      ),

      child: SfDateRangePicker(
        backgroundColor: background,
        endRangeSelectionColor: selectBackground,
        rangeSelectionColor: selectRangeBackground,
        startRangeSelectionColor: selectBackground,


        selectionTextStyle: normalWhiteTextStyle,
        rangeTextStyle: normalBlackTextStyle,

        headerHeight: headersHeight,

        view: DateRangePickerView.month,
        selectionShape: DateRangePickerSelectionShape.rectangle,
        selectionMode: DateRangePickerSelectionMode.single,
        onSelectionChanged: onChangeSelection,

        showNavigationArrow: true,



        enablePastDates: false,
        todayHighlightColor: Colors.transparent,

        headerStyle: DateRangePickerHeaderStyle(
          backgroundColor: background,
          textAlign: TextAlign.center,
          textStyle: monthStyle,
        ),

        monthCellStyle: DateRangePickerMonthCellStyle(
            textStyle: normalBlackTextStyle,
            leadingDatesDecoration: outerDatesDecoration,
            trailingDatesDecoration: outerDatesDecoration,
            trailingDatesTextStyle: normalGreyTextStyle,
            leadingDatesTextStyle: normalGreyTextStyle,
            todayTextStyle: txt_16_blue_600,
        ),
        monthViewSettings: DateRangePickerMonthViewSettings(
            firstDayOfWeek: 1,
            showTrailingAndLeadingDates: true,
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: normalBlackTextStyle,
             // backgroundColor: weekBackground,
            ),
            viewHeaderHeight: headersHeight
        ),

      ),
    );
  }
}

onChangeSelection(DateRangePickerSelectionChangedArgs args){
  print(args.value);
}
