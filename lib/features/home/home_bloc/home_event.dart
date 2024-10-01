part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {

}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;

  HomeProductWishlistClickedEvent({required this.clickedProduct});
}
class HomeProductCartClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;

  HomeProductCartClickedEvent({required this.clickedProduct});

}
class HomeWishlistButtonNavigateEvent extends HomeEvent{

}
class HomeCartButtonNavigateEvent extends HomeEvent{

}
