import 'package:chat_demo/feature/data/data_source/chat_storage.dart';
import 'package:chat_demo/feature/data/repository/chat_repository_impl.dart';
import 'package:chat_demo/feature/domain/repositories/chat_repository.dart';
import 'package:chat_demo/feature/domain/use_case/chat_use_case.dart';
import 'package:chat_demo/feature/presentation/cubit/chat_cubit.dart';
import 'package:get_it/get_it.dart';

class Injection {
  final GetIt sl=GetIt.instance;

  void configDependencies(){
    sl.registerLazySingleton(()=>ChatLocalDataSource());
    sl.registerLazySingleton<ChatRepository>(()=>ChatRepositoryImpl(sl()));
    sl.registerLazySingleton(()=>ChatUseCase(chatRepository: sl()));
    sl.registerFactory(()=>ChatCubit(chatUseCase: sl()));
  }
}