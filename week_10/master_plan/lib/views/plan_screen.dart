import 'package:flutter/material.dart';
import '../models/data_layers.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key, required this.plan});
  final Plan plan;

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan get plan => widget.plan;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    final plansNotifier = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          final currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    final plansNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final planIndex = plansNotifier.value.indexWhere(
          (p) => p.name == plan.name,
        );
        if (planIndex == -1) return;
        final currentPlan = plansNotifier.value[planIndex];
        final updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());
        plansNotifier.value = List<Plan>.from(plansNotifier.value)
          ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    final plansNotifier = PlanProvider.of(context);
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final planIndex = plansNotifier.value.indexWhere(
            (p) => p.name == plan.name,
          );
          if (planIndex == -1) return;
          final currentPlan = plansNotifier.value[planIndex];
          plansNotifier.value = List<Plan>.from(plansNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final planIndex = plansNotifier.value.indexWhere(
            (p) => p.name == plan.name,
          );
          if (planIndex == -1) return;
          final currentPlan = plansNotifier.value[planIndex];
          plansNotifier.value = List<Plan>.from(plansNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(description: text, complete: task.complete),
            );
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
