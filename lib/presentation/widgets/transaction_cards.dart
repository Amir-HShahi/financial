import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/transaction_model.dart';
import 'expense_card.dart';

class TransactionCards extends StatefulWidget {
  const TransactionCards({super.key});

  @override
  State<TransactionCards> createState() => _TransactionCardsState();
}

class _TransactionCardsState extends State<TransactionCards> {
  bool isSelecting = false;

  void toggleSelectingState(bool isSelecting) {
    setState(() {
      this.isSelecting = isSelecting;
    });
  }

  void deleteHandler() {
    setState(() {
      isSelecting = false;
    });
  }

  void selectHandler() {
    setState(() {
      isSelecting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Transactions',
              style: TextStyle(
                color: DesignColors.deepDarkBlue,
                fontWeight: FontWeight.w500,
                fontSize: Scale.height(16),
                height: 1,
              ),
            ),
            isSelecting
                ? _DeleteButton(deleteHandler: deleteHandler)
                : _SelectButton(selectHandler: selectHandler),
          ],
        ),
        SizedBox(height: Scale.height(16)),
        ExpenseCard(
          expenseModel: TransactionModel(
            amount: 50,
            title: 'Shampoo',
            category: CategoryModel(
              title: 'Healthcare',
              color: Color(0xff89FF72), iconPath: '',
            ),
            date: DateTime(2025, 2, 6),
            transactionType: TransactionType.expense,
          ),
          toggleSelectingState: toggleSelectingState,
        ),
      ],
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final Function() deleteHandler;
  const _DeleteButton({required this.deleteHandler});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: deleteHandler,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/trash_bin.svg',
            height: Scale.height(16),
          ),
          SizedBox(width: Scale.width(4)),
          Text(
            'Delete',
            style: TextStyle(
              color: DesignColors.red,
              fontWeight: FontWeight.w400,
              fontSize: Scale.height(14),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectButton extends StatelessWidget {
  final Function() selectHandler;
  const _SelectButton({required this.selectHandler});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: selectHandler,
      child: Text(
        'Select',
        style: TextStyle(
          color: DesignColors.cyan,
          fontWeight: FontWeight.w400,
          fontSize: Scale.height(14),
          height: 1,
        ),
      ),
    );
  }
}
