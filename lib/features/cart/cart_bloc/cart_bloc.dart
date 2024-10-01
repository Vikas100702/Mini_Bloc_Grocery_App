import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/cart_item.dart';
import 'package:bloc_state_management/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveProductEvent>(cartRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }
  FutureOr<void> cartRemoveEvent(CartRemoveProductEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartInitial());
    //run a function to remove that product model from that cartItems.
    //emit a cartItemRemoved state.
  }
}
