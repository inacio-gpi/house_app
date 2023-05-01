import 'package:flutter/material.dart';
import 'package:house_app/lib.dart';

class ListPaginationComponent extends StatelessWidget {
  const ListPaginationComponent({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final HouseRulesCubit cubit;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Visibility(
              visible: cubit.isValidBackButton,
              child: TextButton(
                onPressed: cubit.backPage,
                child: const Icon(Icons.chevron_left),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text('${cubit.houseRules.pagination.currentPage}/${cubit.houseRules.pagination.totalPages}'),
          ),
          Expanded(
            child: Visibility(
              visible: cubit.isValidNextButton,
              child: TextButton(
                onPressed: cubit.nextPage,
                child: const Icon(Icons.chevron_right),
              ),
            ),
          ),
        ],
      );
}
