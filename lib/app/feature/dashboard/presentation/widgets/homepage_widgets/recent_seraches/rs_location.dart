import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/recent_searches/recent_searches_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/recent_searches/recent_searches_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RsLocation extends StatefulWidget {
  const RsLocation({super.key});

  @override
  State<RsLocation> createState() => _RsLocationState();
}

class _RsLocationState extends State<RsLocation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RecentSearchesCubit>().fetchSearchData();
  }

  //
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentSearchesCubit, RecentSearchesState>(
      builder: (context, state) {
        if (state.searchStatus == ApiStatus.initial ||
            state.searchStatus == ApiStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        } else if (state.searchStatus == ApiStatus.failure) {
          return Center(
            child: Text(state.error ?? "Something went wrong!"),
          );
        } else if (state.searchStatus == ApiStatus.success) {
          final items = state.searchesModel;

          if (items.isEmpty) {
            return const Center(child: Text("No recent searches."));
          }

          return Padding(
            padding: const EdgeInsets.only(left: 5, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 55.h,
                      width: 270.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.6, color: Colors.black26),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  " ${item.transportType}: ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xff001A42),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${item.departurePlace} - ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xff001A42),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item.arrivalPlace,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xff001A42),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "${item.date} | ",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xff8087B0),
                                    ),
                                  ),
                                  Text(
                                    "${item.passangerNumber.toString()} Passengers",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xff8087B0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ✅ Fixed type
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        }

        return const SizedBox.shrink(); // Fallback
      },
    );
  }
}
