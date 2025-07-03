
import 'package:bus_sewa/app/feature/dashboard/data/models/recent_searches/recent_search_model.dart';

abstract class RecentSearchesRepoAbstract {

Future<List<RecentSearchModel>> getRecentSearch();

}