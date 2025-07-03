import 'package:bus_sewa/app/feature/dashboard/data/models/recent_searches/recent_search_model.dart';
import 'package:bus_sewa/app/feature/dashboard/domain/repositories/recent_searches_repo_abstract.dart';

class RecentSearchesRepoImplementation implements RecentSearchesRepoAbstract {
  @override
  Future<List<RecentSearchModel>> getRecentSearch() async {
    await Future.delayed(const Duration(seconds: 2));

    final recentSearchData = [
      {
        "transportType": "Bus",
        "departurePlace": "Chitwan",
        "arrivalPlace": "Pokhara",
        "date": "4th Dec",
        "passangerNumber": 4
      },
      {
        "transportType": "Flight",
        "departurePlace": "Kathmandu",
        "arrivalPlace": "Biratnagar",
        "date": "5th Dec",
        "passangerNumber": 2
      },
       {
        "transportType": "Bus",
        "departurePlace": "Bardiya",
        "arrivalPlace": "Janakpur",
        "date": "5th Dec",
        "passangerNumber": 1
      },
      {
        "transportType": "Flight",
        "departurePlace": "Kathmandu",
        "arrivalPlace": "Biratnagar",
        "date": "5th Dec",
        "passangerNumber": 2
      },
    ];

    return recentSearchData
        .map((json) => RecentSearchModel.fromJson(json))
        .toList();
  }
}
