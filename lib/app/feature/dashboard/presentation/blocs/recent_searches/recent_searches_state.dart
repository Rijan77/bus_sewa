import 'package:bus_sewa/app/feature/dashboard/data/models/recent_searches/recent_search_model.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/utils/api_status.dart';

class RecentSearchesState extends Equatable { // Equatable helps to knwo when the state has changed
  final ApiStatus searchStatus; //Hold Current Status (e.g., Loading, success, failed etc)
  final List<RecentSearchModel> searchesModel; // Stores the list of recent search data
  final String? error; // Stores an error message

  RecentSearchesState( //This is constructor. if notings is passed, default values are used
      {this.searchStatus = ApiStatus.initial, // starts with initial
      this.searchesModel = const [], //empty list
      this.error //null
      });

  RecentSearchesState copyWith ({ //Thids copyWith function helps to create a new update state, you only change the part you want, and keep others the same
    ApiStatus? searchStatus, List<RecentSearchModel>? searchesModel, String? error
  }){
    return RecentSearchesState(
      searchStatus: searchStatus?? this.searchStatus, //if new value is passed, use it. , if not, use the existing value
      searchesModel: searchesModel?? this.searchesModel,
      error: error ?? this.error
    );
  }

  @override
  List<Object?> get props => [  //This allows Equatable to compare state objects. if any of these values change, it tells flutter to rebuild the UI.
    searchStatus,
    searchesModel,
    error,
  ];
}
