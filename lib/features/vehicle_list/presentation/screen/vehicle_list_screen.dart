import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/providers/state/vehicle_list_state.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/providers/vehicle_list_state_provider.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/screen/children/vehicle_list_item.dart';
import 'package:awr_vehicle_tracker/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


@RoutePage()
class VehicleListScreen extends ConsumerStatefulWidget {
  static const String routeName = '/vehicleListScreen';
  const VehicleListScreen({super.key});

  @override
  ConsumerState<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends ConsumerState<VehicleListScreen> {
  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchVehicles();
  }

  void fetchVehicles() {
    final notifier = ref.read(vehicleListNotifierProvider.notifier);
    notifier.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(vehicleListNotifierProvider);

    ref.listen(
      vehicleListNotifierProvider.select((value) => value),
      ((VehicleListState? previous, VehicleListState next) {
        print(next.message);
      }),
    );
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: const Text('Dashboard', 
        style: TextStyle(color: AppColors.primary, 
        fontSize: 30,
        fontWeight: FontWeight.bold)),
      ),
      body: state.state == VehicleListConcreteState.loading
          ? const Center(child: CircularProgressIndicator())
          : state.hasData
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:  SearchBar(
                        controller: searchController,
                        textInputAction: TextInputAction.search,
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.only(left: 16.0)),
                        hintText: 'Search',
                        leading: const Icon(Icons.search_rounded),
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(
                        controller: scrollController,
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: state.productList.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data = state.productList[index].data();
                            Vehicle vehicle = Vehicle.fromJson(data); 
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: VehicleListItem(vehicle: vehicle)
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
    );
  }
}