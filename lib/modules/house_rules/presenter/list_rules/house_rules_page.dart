import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app/lib.dart';

class HouseRulesPage extends StatefulWidget {
  const HouseRulesPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final HouseRulesCubit cubit;

  @override
  State<HouseRulesPage> createState() => _HouseRulesPageState();
}

class _HouseRulesPageState extends State<HouseRulesPage> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getHouseRules();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: widget.cubit.doLogout,
          //   icon: const Icon(Icons.arrow_back),
          // ),
          automaticallyImplyLeading: false,
          title: const Text('House Rules'),
          actions: [
            IconButton(
              onPressed: widget.cubit.doLogout,
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
            ),
          ],
        ),
        body: BlocConsumer<HouseRulesCubit, HouseRulesState>(
          bloc: widget.cubit,
          listener: (context, state) {
            if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.failure.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is SuccessState) {
              return ListView.builder(
                itemCount: state.houseRules.entities.length,
                itemBuilder: (context, index) {
                  final item = state.houseRules.entities[index];
                  return ListTile(
                    title: Text(
                      item.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      item.active.toString(),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      );
}
