import 'package:awr_vehicle_tracker/extensions/view_extensions.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/providers/state/vehicle_list_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_notifier/state_notifier.dart';

class VehicleListNotifier extends StateNotifier<VehicleListState> {

  VehicleListNotifier(
  ) : super(const VehicleListState.initial());

  bool get isFetching => state.state == VehicleListConcreteState.loading;

  var db = FirebaseFirestore.instance; 

  Future<void> fetchProducts(String query) async {
    db.collection("vehicles").get().then((vehicle) => {
        updateStateFromResponse(vehicle, query)
    });
  }

  void updateStateFromResponse(QuerySnapshot<Map<String, dynamic>> response, String query) {
    
    final productList = response.docs.where((element) {
          Vehicle vehicle = Vehicle.fromJson(element.data());
          return query.isEmpty || vehicle.vehicleBrand.containsIgnoreCase(query) ||
          vehicle.vehicleModel.containsIgnoreCase(query) ||
          vehicle.vehicleDriver.containsIgnoreCase(query) ||
          vehicle.vehiclePlate.containsIgnoreCase(query);
        },).toList();
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