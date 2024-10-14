import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/features/home/logic/home_cubit.dart';
import 'package:diva/features/home/logic/home_state.dart';
import 'package:diva/features/home/ui/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is ProductsSuccess ||
          current is ProductsFailure ||
          current is ProductsLoading,
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsFailure) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is ProductsSuccess) {
          final products = state.products;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return InkWell(
                onTap: () => context.pushNamed(Routes.productDetails),
                child: ProductItem(
                  product: product,
                ),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
