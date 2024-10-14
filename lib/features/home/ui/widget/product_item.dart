import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/theming/colors.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:diva/features/home/data/models/products_reponse_model.dart';
import 'package:diva/features/home/logic/home_cubit.dart';
import 'package:diva/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });
  final ProductsReponseModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                    image: NetworkImage(product.image!),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) => current is FavoritesUpdated,
                  builder: (context, state) {
                    final isFavorite =
                        context.read<HomeCubit>().isFavorite(product);
                    return GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().toggleFavorite(product);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color:
                              isFavorite ? AppColors.mainColor : Colors.black,
                          size: 26,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) => current is CartUpdated,
                  builder: (context, state) {
                    final isCart = context.read<HomeCubit>().isCart(product);
                    return GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().toggleCart(product);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(
                          isCart
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          color: isCart ? AppColors.mainColor : Colors.black,
                          size: 26,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.category!,
                  style: TextStyles.font14GrayRegular,
                ),
              ),
              Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.star, color: Colors.amber)),
                  Text(
                    product.rating!.rate.toString(),
                    style: TextStyles.font14DarkBlueBold,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(3),
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              '${product.price}L.E',
              textAlign: TextAlign.right,
              style: TextStyles.font14DarkBlueBold,
            ),
          ),
        ],
      ),
    );
  }
}
