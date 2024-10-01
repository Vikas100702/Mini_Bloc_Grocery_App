import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/cart_item.dart';
import 'package:bloc_state_management/data/groceryData.dart';
import 'package:bloc_state_management/data/wishlist_item.dart';
import 'package:bloc_state_management/features/home/models/home_product_data_model.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistClickedEvent>(homeProductWishlistClickedEvent);
    on<HomeProductCartClickedEvent>(homeProductCartClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((element) => ProductDataModel(
                  id: element['id'],
                  name: element['name'],
                  category: element['category'],
                  description: element['description'],
                  price: element['price'],
                  imageUrl: element['imageUrl'],
                ))
            .toList()));
  }

  FutureOr<void> homeProductWishlistClickedEvent(
      HomeProductWishlistClickedEvent event, Emitter<HomeState> emit) {
    debugPrint("Wishlist clicked.");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistActionState());
  }

  FutureOr<void> homeProductCartClickedEvent(
      HomeProductCartClickedEvent event, Emitter<HomeState> emit) {
    debugPrint("Cart Clicked.");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint("Wishlist page navigate.");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint("Cart page navigate.");
    emit(HomeNavigateToCartPageActionState());
  }
}
