import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recent_searches_state.dart';

class RecentSearchesCubit extends Cubit<RecentSearchesState> {
  RecentSearchesCubit() : super(RecentSearchesInitial());

  
}
