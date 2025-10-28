import 'package:appoinment_app/core/networking/api_service.dart';
import 'package:appoinment_app/core/networking/dio_factory.dart';
import 'package:appoinment_app/features/login/data/repos/login_repo.dart';
import 'package:appoinment_app/features/login/logic/login_cubit.dart';
import 'package:appoinment_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:appoinment_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

Future<void> setupGetIt() async{
  //Dio & ApiService
Dio dio= DioFactory.getDio();
getIt.registerLazySingleton<ApiService>(()=>ApiService(dio));

//login
getIt.registerLazySingleton<LoginRepo>(()=>LoginRepo(getIt()));
getIt.registerFactory<LoginCubit>(()=>LoginCubit(getIt()));

//sign up
getIt.registerLazySingleton<SignUpRepo>(()=>SignUpRepo(getIt()));
getIt.registerFactory<SignupCubit>(()=>SignupCubit(getIt()));

}