import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/providers/state/vehicle_list_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_notifier/state_notifier.dart';

class VehicleListNotifier extends StateNotifier<VehicleListState> {

  VehicleListNotifier(
  ) : super(const VehicleListState.initial());

  bool get isFetching => state.state == VehicleListConcreteState.loading;

  var db = FirebaseFirestore.instance; 

  Future<void> fetchProducts() async {
    db.collection("vehicles").get().then((vehicle) => {
        updateStateFromResponse(vehicle)
    });
  }

  void updateStateFromResponse(QuerySnapshot<Map<String, dynamic>> response) {
    
    final productList = response.docs;
    
    state = state.copyWith(
        productList: productList,
        state: VehicleListConcreteState.loaded,
        hasData: true,
        message: productList.isEmpty ? 'No vehicles found' : '',
        page: 0,
        total:1,
        isLoading: false,
      );
  }

  void resetState() {
    state = const VehicleListState.initial();
  }
}