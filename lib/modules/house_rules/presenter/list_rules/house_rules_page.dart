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
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const Text('Hello, '),
              Text(widget.cubit.user.name.toUpperCase()),
            ],
          ),
          actions: [
            IconButton(
              onPressed: widget.cubit.doLogout,
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocConsumer<HouseRulesCubit, HouseRulesState>(
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
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () async {
                            await widget.cubit.openCreateRule(context);
                          },
                          child: const Text('Add new rule +'),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.houseRules.entities.length,
                          itemBuilder: (context, index) {
                            final item = state.houseRules.entities[index];
                            return Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(item.active == 1 ? 0.8 : 0.2),
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item.active.toString(),
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is ErrorState) {
                  return const Center(
                    child: Text('something is wrong'),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      );
}
