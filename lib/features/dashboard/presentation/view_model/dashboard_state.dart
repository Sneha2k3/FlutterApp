class DashboardState {
  final List<Widget> views;
  final int selectedIndex;

  DashboardState({required this.views, required this.selectedIndex});

  // Initial state method
  factory DashboardState.initial() {
    return DashboardState(
      views: [HomeView(), AppointmentView(), ProfileView()], // Your views
      selectedIndex: 0, // Initial index
    );
  }

  // Copy method for updating state
  DashboardState copyWith({List<Widget>? views, int? selectedIndex}) {
    return DashboardState(
      views: views ?? this.views,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
