import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/providers/state/vehicle_list_state.dart';
import 'package:state_notifier/state_notifier.dart';

class VehicleListNotifier extends StateNotifier<VehicleListState> {

  VehicleListNotifier(
  ) : super(const VehicleListState.initial());

  bool get isFetching =>
      state.state != VehicleListConcreteState.loading &&
      state.state != VehicleListConcreteState.fetchingMore;

  Future<void> fetchProducts() async {
   
  }

  void resetState() {
    state = const VehicleListState.initial();
  }
}