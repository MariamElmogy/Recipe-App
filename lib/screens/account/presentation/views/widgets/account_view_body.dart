import 'package:flutter/material.dart';
import 'package:recipe_app/core/custom/image_container.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/custom_title.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: "My Favorites"),
        SizedBox(height: SizeConfig.height * .05),
        SizedBox(
          height: SizeConfig.height,
          child: const FavoriteRecipesGridView(),
        ),
      ],
    );
  }
}

class FavoriteRecipesGridView extends StatelessWidget {
  const FavoriteRecipesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 4 / 4.5,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const FavoriteRecipeItem();
      },
    );
  }
}

class FavoriteRecipeItem extends StatelessWidget {
  const FavoriteRecipeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF063336).withOpacity(.2),
            offset: const Offset(0, 1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const ImageContainer(
                image: "https://cdn.dummyjson.com/recipe-images/1.webp",
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: SizeConfig.width * .07,
                  height: SizeConfig.height * .04,
                  decoration: BoxDecoration(
                    color: const Color(0XFFFFFFFF).withOpacity(.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.height * .01),
          Text(
            "Pizza",
            style: AppFontStyles.styleBold20(context).copyWith(
              color: AppColors.titleColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: SizeConfig.height * .01),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 16,
              ),
              SizedBox(width: SizeConfig.width * .01),
              Text(
                "7/5.0",
                style: AppFontStyles.styleRegular16(context).copyWith(
                  color: const Color(0XFF97A2B0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
