import 'package:equatable/equatable.dart';

enum VehicleListConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllProducts
}

class VehicleListState extends Equatable {
  final List<String> productList;
  final int total;
  final int page;
  final bool hasData;
  final VehicleListConcreteState state;
  final String message;
  final bool isLoading;
  const VehicleListState({
    this.productList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = VehicleListConcreteState.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
  });

  const VehicleListState.initial({
    this.productList = const [],
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = VehicleListConcreteState.initial,
    this.message = '',
  });

  VehicleListState copyWith({
    List<String>? productList,
    int? total,
    int? page,
    bool? hasData,
    VehicleListConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return VehicleListState(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'DashboardState(isLoading:$isLoading, productLength: ${productList.length},total:$total page: $page, hasData: $hasData, state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [productList, page, hasData, state, message];
}