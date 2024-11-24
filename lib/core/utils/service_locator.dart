import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/utils/api_service.dart';
import 'package:recipe_app/screens/account/data/repo/account_repo_implement.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo_implement.dart';
import 'package:recipe_app/screens/search/data/repo/search_repo_implement.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<RecipeRepoImplement>(
      RecipeRepoImplement(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImplement>(
      SearchRepoImplement(getIt.get<ApiService>()));
  getIt.registerSingleton<AccountRepoImplement>(
      AccountRepoImplement());
}
