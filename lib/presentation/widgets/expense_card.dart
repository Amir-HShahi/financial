import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/transaction_model.dart';
import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';


class ExpenseCard extends StatefulWidget {
  final TransactionModel expenseModel;
  final Function(bool) toggleSelectingState;

  const ExpenseCard({
    super.key,
    required this.expenseModel,
    required this.toggleSelectingState,
  });

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  bool isSelected = false;

  void onPressed() {
    if (isSelected) {
      setState(() {
        isSelected = false;
      });
    }
  }

  void onLongPress() {
    setState(() {
      widget.toggleSelectingState(true);
      isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.expenseModel.title;

    String categoryTitle = widget.expenseModel.category.title;

    String date = DateFormat('yyyy/MM/dd').format(widget.expenseModel.date);

    String amount = '-\$${widget.expenseModel.amount}';

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
        boxShadow: [
          BoxShadow(
            color: DesignColors.deepDarkBlue.withValues(alpha: 0.01),
            offset: Offset(0, Scale.height(2)),
            spreadRadius: Scale.height(1),
            blurRadius: Scale.height(8),
          ),
        ],
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: OutlinedButton.styleFrom(
          fixedSize: Size(Scale.width(345), Scale.height(66)),
          animationDuration: Duration(milliseconds: 150),
          side: BorderSide(
            width: Scale.height(1),
            color: isSelected ? DesignColors.red : Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Scale.width(16),
            vertical: Scale.height(16),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
          ),
          backgroundColor: DesignColors.white,
          elevation: 0,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// leading icon
                Container(
                  height: maxHeight,
                  width: maxHeight,
                  margin: EdgeInsetsDirectional.only(end: Scale.width(8)),
                  decoration: BoxDecoration(
                    color: Color(0xff89FF72).withValues(
                      alpha: 0.2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(Scale.height(10)),
                    ),
                  ),
                ),

                /// title and category
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: DesignColors.deepDarkBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 0.45 * maxHeight,
                        height: 1,
                      ),
                    ),
                    Text(
                      categoryTitle,
                      style: TextStyle(
                        color: DesignColors.deepDarkBlue.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                        fontSize: 0.4 * maxHeight,
                        height: 1,
                      ),
                    ),
                  ],
                ),

                /// push to end
                const Spacer(),

                /// data and amount
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        color: DesignColors.deepDarkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 0.35 * maxHeight,
                        height: 1,
                      ),
                    ),
                    Text(
                      amount,
                      style: TextStyle(
                        color: DesignColors.deepDarkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 0.41 * maxHeight,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
