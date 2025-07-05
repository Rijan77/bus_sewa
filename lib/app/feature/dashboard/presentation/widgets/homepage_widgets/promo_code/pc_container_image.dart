import 'dart:ffi';

import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/data/repositories/promocodes_implementation.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/promo_codes/promo_codes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PcContainerImage extends StatefulWidget {
  const PcContainerImage({super.key});

  @override
  State<PcContainerImage> createState() => _PcContainerImageState();
}

class _PcContainerImageState extends State<PcContainerImage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PromoCodesCubit>().fetchPromoCode();
  }

  final Map<int, ValueNotifier<bool>> isClickedMap = {};

  // bool _isClicked  = false;
  //
  // void _handleTap(){
  //   setState(() {
  //     _isClicked = !_isClicked;
  //   });
  //
  // }



  PromocodesImplementation promocodesImplementation =
      PromocodesImplementation();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoCodesCubit, PromoCodesState>(
        builder: (context, state) {
      if (state.promoCodeStatus == ApiStatus.initial ||
          state.promoCodeStatus == ApiStatus.loading) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 170, vertical: 40),
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        );
      } else if (state.promoCodeStatus == ApiStatus.failure) {
        return const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 170,
            vertical: 40,
          ),
          child: Column(
            children: [
              Icon(Icons.error_rounded),
              Text("Failed to Fetch Promo Codes")
            ],
          ),
        );
      } else if (state.promoCodeStatus == ApiStatus.success) {
        final promoCodeItems = state.promoModel;

        if (promoCodeItems.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 170,
              vertical: 40,
            ),
            child: Column(
              children: [
                Icon(Icons.error_rounded),
                Text("No Recent PromoCodes")
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: promoCodeItems.asMap().entries.map((entry) {
                  final index = entry.key;
                  final promoItem = entry.value;

                  isClickedMap.putIfAbsent(index, ()=> ValueNotifier(false));

              return Padding(
                padding: const EdgeInsets.all(10),
                child: _buildPromoItem(
                    imageUrl: promoItem.imageUrl,
                    title: promoItem.title,
                    validDate: promoItem.validDate,
                    promoType: promoItem.promoType,
                    isClicked: isClickedMap[index]!,
                ),
              );
            }).toList()),
          ),
        );
      }

      return const SizedBox.shrink();
    });

    // return FutureBuilder(
    //     future: promocodesImplementation.getPromoCodes(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const SizedBox(
    //           height: 180,
    //           child: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 120),
    //           child: Column(
    //             children: [
    //               Icon(Icons.error, size: 50,),
    //               Text("Error to fetch data")
    //             ],
    //           ),
    //         );
    //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    //         return const Text("No PromoCodes Avilable");
    //       }
    //
    //       final promoCode = snapshot.data!;
    //
    //       return Padding(
    //         padding: const EdgeInsets.all(10),
    //         child: SingleChildScrollView(
    //           scrollDirection: Axis.horizontal,
    //           child: Row(
    //             children: promoCode.map((promoCode) {
    //               return Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: _buildItem(
    //                     imageUrl: promoCode.imageUrl,
    //                     title: promoCode.title,
    //                     subTitle: promoCode.validDate,
    //                     promoType: promoCode.promoType,
    //                     buttonText: "Collect"),
    //               );
    //             }).toList(),
    //           ),
    //         ),
    //       );
    //     });
  }

  Widget _buildPromoItem(
      {required String imageUrl,
      required String title,
      required String validDate,
      required String promoType,
      required ValueNotifier<bool> isClicked}) {
    return Container(
      height: 165.sp,
      width: 168.sp,
      decoration: BoxDecoration(
          color: const Color(0xffF9F9FF),
          // color: Colors.green,
          borderRadius: BorderRadius.circular(9)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 87.sp,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace){
                    return Container(
                      color: Colors.grey.shade200, // Optional background color
                      height: 87.sp,
                      width: double.infinity,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                        size: 40,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    height: 20.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
                    ),
                    child: Center(
                      child: Text(promoType, style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12
                      ),),
                    ),

                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff333333),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 2),
                child: Text(validDate, style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xff7D7E83),
                    fontWeight: FontWeight.w400),
                ),
              ),

              ValueListenableBuilder(
                valueListenable: isClicked,
                builder: (context, value, child){
                  return Padding(
                    padding: const EdgeInsets.only(left: 7.88, right: 7.88, bottom: 4, top: 4),
                    child: InkWell(
                      onTap: (){
                        isClicked.value = !isClicked.value;
                      },
                      child: Container(
                        height: 28.sp,
                        width: 142.sp,
                        decoration: BoxDecoration(
                          color: value?Colors.transparent:Color(0xff198B85),
                          border: Border.all(width: 1, color: Color(0xff198B85)),
                          borderRadius: BorderRadius.circular(4),

                        ),
                        child: Center(
                          child: Text(value? "Collected": "Collect", style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: value? Color(0xff198B85) :Colors.white
                          ),),
                        ),
                      ),
                    ),
                  );

    }

              )
            ],
          )
        ],
      ),
    );
  }

//
// Widget _buildItem(
//     {required String imageUrl,
//     required String title,
//     required String validDate,
//     required String promoType,
//     required String buttonText}) {
//   return Container(
//     height: 200.w,
//     width: 200.w,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: const [
//         BoxShadow(
//           color: Colors.black12,
//           blurRadius: 6,
//           offset: Offset(0, 3),
//         ),
//       ],
//     ),
//     child: Column(
//       children: [
//         ClipRRect(
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//           child: Container(
//             height: 100,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Stack(
//               children: [
//                 Image.network(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                 ),
//                 Text(
//                   promoType,
//                   style: TextStyle(color: Colors.white),
//                 )
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: Align(
//             alignment: Alignment.bottomLeft,
//             child: Text(
//               title,
//               style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xff333333)),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: Align(
//             alignment: Alignment.bottomLeft,
//             child: Text(
//               validDate,
//               style: const TextStyle(fontSize: 9, color: Colors.grey),
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         Container(
//           height: 35,
//           width: 170,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: const Color(0xff198B85),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Text(
//             buttonText,
//             style: const TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ],
//     ),
//   );
}
