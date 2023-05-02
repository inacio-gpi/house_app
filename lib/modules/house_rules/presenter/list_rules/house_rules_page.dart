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
    widget.cubit.setUser();
    widget.cubit.getHouseRules();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Hi ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.cubit.user.name.toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
                  return CustomScrollView(
                    primary: true,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () async {
                              await widget.cubit.openCreateRule(context);
                            },
                            child: const Text('Add new rule +'),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.houseRules.entities.length,
                          (final context, final index) {
                            final item = state.houseRules.entities[index];

                            return Column(
                              children: [
                                Card(
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withOpacity(item.active == 1 ? 0.8 : 0.2),
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              ),
                                              onTap: () async {
                                                await widget.cubit.openUpdateRule(context, rule: item);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: double.infinity,
                                            width: 1,
                                            // color: Theme.of(context).colorScheme.onPrimary,
                                            color: Colors.black.withOpacity(0.4),
                                          ),
                                          InkWell(
                                            borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                            ),
                                            onTap: () async {
                                              await widget.cubit.deleteRule(item);
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                              child: const Icon(Icons.delete_forever),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            );
                          },
                        ),
                      ),
                      if (widget.cubit.hasBottomPagination)
                        SliverFillRemaining(
                          fillOverscroll: false,
                          hasScrollBody: false,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ListPaginationComponent(cubit: widget.cubit),
                              ],
                            ),
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
