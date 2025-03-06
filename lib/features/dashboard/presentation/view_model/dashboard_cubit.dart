import 'package:features/dashboard/presentation/view_model/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  // Method to handle the tab selection change
  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
