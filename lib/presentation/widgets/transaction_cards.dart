import 'package:financial/presentation/widgets/shimmer_expense_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/transaction_model.dart';
import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';
import '../../domain/entities/transaction.dart';
import 'expense_card.dart';

class TransactionCards extends StatefulWidget {
  const TransactionCards({super.key});

  @override
  State<TransactionCards> createState() => _TransactionCardsState();
}

class _TransactionCardsState extends State<TransactionCards> {
  bool isSelecting = false;
  bool isLoading = true;

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

  Future<void> awaiting() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    awaiting();
    return SingleChildScrollView(
      child: Column(
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
          isLoading
              ? Column(
                children: [
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ShimmerExpenseCard(),
                    ),
                ],
              )
              : ExpenseCard(
                expenseModel: TransactionModel(
                  1,
                  'Shampoo',
                  TransactionType.expense,
                  1,
                  DateTime(2025, 2, 6),
                  50,
                ),
                toggleSelectingState: toggleSelectingState,
              ),
        ],
      ),
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
