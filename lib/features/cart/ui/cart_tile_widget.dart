import 'package:bloc_state_management/features/cart/cart_bloc/cart_bloc.dart';
import 'package:bloc_state_management/features/home/home_bloc/home_bloc.dart';
import 'package:bloc_state_management/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productDataModel.price}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // cartBloc.add(HomeProductWishlistClickedEvent(clickedProduct: productDataModel));
                    },
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartRemoveProductEvent(productDataModel: productDataModel));
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
