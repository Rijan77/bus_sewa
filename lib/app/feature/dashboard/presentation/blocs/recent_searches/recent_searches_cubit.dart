import 'package:bloc/bloc.dart';
import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/data/models/recent_searches/recent_search_model.dart';
import 'package:bus_sewa/app/feature/dashboard/data/repositories/recent_searches_repo_implementation.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/recent_searches/recent_searches_state.dart';


class RecentSearchesCubit extends Cubit<RecentSearchesState> {
  RecentSearchesCubit() : super(const RecentSearchesState());

  RecentSearchesRepoImplementation recentSearchesRepoImplementation =  RecentSearchesRepoImplementation();


  Future<void> fetchSearchData() async{
    
    emit(state.copyWith(searchStatus: ApiStatus.loading));

    try{
      final List<RecentSearchModel> recentSearch = await recentSearchesRepoImplementation.getRecentSearch();
      emit(state.copyWith(searchStatus: ApiStatus.success,  searchesModel:recentSearch));
    }catch (e){
      emit(state. copyWith(searchStatus: ApiStatus.failure, error: "Failed to Load Data"));
    }

  }

  
}
