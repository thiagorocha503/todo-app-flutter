import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/list_overview/model/listing.dart';
import 'package:todo/selectable_list/bloc/selectable_list_bloc.dart';
import 'package:todo/selectable_list/bloc/selectable_list_event.dart';
import 'package:todo/selectable_list/bloc/selectable_list_state.dart';
import 'package:todo/shared/data/user_preferences.dart';
import 'package:todo/todo_overview/bloc/bloc.dart';
import 'package:todo/todo_overview/model/filter.dart';
import 'package:todo/todo_overview/model/todo.dart';
import 'package:todo/todo_overview/ui/widget/app_bar.dart';
import 'package:todo/todo_overview/ui/widget/todo_list_tile_selectable.dart';
import 'package:todo/todo_overview/ui/widget/todo_new_button.dart';

class ListingDetailsPage extends StatelessWidget {
  final Listing list;
  const ListingDetailsPage({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoOverviewBloc>(
          create: (context) => TodoOverviewBloc(
            TodoOverviewLoadingState(
              todos: const [],
              filter: TodoFilter(
                listing: TodoListingCriteria(id: list.id),
                status: TodoStatusCriteria(
                  status: RepositoryProvider.of<UserPreferences>(context)
                          .getShowComplete()
                      ? TodosStatus.all
                      : TodosStatus.activeOnly,
                ),
              ),
            ),
            repository: RepositoryProvider.of(context),
          )..add(TodoOverviewSubscriptionRequested()),
        ),
      ],
      child: ListingDetailsPageView(
        listing: list,
      ),
    );
  }
}

class ListingDetailsPageView extends StatefulWidget {
  final Listing listing;
  const ListingDetailsPageView({
    super.key,
    required this.listing,
  });

  @override
  State<ListingDetailsPageView> createState() => _ListingDetailsPageViewState();
}

class _ListingDetailsPageViewState extends State<ListingDetailsPageView> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: TodoOverviewAppBar(
          initialList: widget.listing,
        ),
      ),
      body: BlocConsumer<TodoOverviewBloc, TodoOverviewState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.todos.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context).noTodo),
            );
          }
          List<Todo> notComplete =
              state.todos.where((e) => e.completedAt == null).toList();
          List<Todo> complete =
              state.todos.where((e) => e.completedAt != null).toList();
          context.read<SelectableListBloc>().add(
                SelectableListUpdateItens(
                  itens: state.todos.map((todo) => todo.id!).toList(),
                ),
              );
          return ListView(
            children: [
              for (Todo oneTodo in notComplete) ...[
                TodoListTileSelectable(
                  todo: oneTodo,
                ),
                const Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                )
              ],
              if (complete.isNotEmpty &&
                  (state.filter.status.status == TodosStatus.all))
                StatefulBuilder(
                  builder: (context, setState) {
                    return Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: isExpanded,
                        title: Text(
                          AppLocalizations.of(context)
                              .complete(complete.length),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        onExpansionChanged: (value) {
                          setState(() {
                            isExpanded = value;
                          });
                        },
                        children: [
                          ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                              height: 1,
                              indent: 16,
                              endIndent: 16,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: complete.length,
                            itemBuilder: (context, index) {
                              return TodoListTileSelectable(
                                todo: complete[index],
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                )
            ],
          );
        },
      ),
      floatingActionButton:
          BlocBuilder<SelectableListBloc, SelectableListState>(
        builder: (context, state) {
          return Visibility(
            visible: !state.enabled,
            child: TodoNewFloatingButton(
              listing: widget.listing,
            ),
          );
        },
      ),
      // ),
    );
  }
}
