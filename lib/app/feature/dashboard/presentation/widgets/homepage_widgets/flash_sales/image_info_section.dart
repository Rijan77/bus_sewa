import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/flash_sales_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../blocs/flash_sales_data_state.dart';

class ImageInfoSection extends StatefulWidget {
  const ImageInfoSection({super.key});

  @override
  State<ImageInfoSection> createState() => _ImageInfoSectionState();
}

class _ImageInfoSectionState extends State<ImageInfoSection> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FlashSalesDataCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<FlashSalesDataCubit, FlashSaleDataState>(builder: (context, state){
       if(state.status == ApiStatus.initial || state.status == ApiStatus.loading){
         return const Center(
           child: CircularProgressIndicator(color: Colors.blueGrey,),
         );
       } else if (state.status == ApiStatus.failure){
         return Center(child: Text(state.error?? "Something went wrong"));
       } else if(state.status == ApiStatus.success){
         return Padding(padding: const EdgeInsets.all(10.0),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(10.0),
             child: SingleChildScrollView(
               scrollDirection: Axis.horizontal,

               child: Row(
                 children: state.flashSales.map((sale){
                   return Padding(
                     padding: const EdgeInsets.only(right: 10),
                     child: Row(
                       children: [
                         _buildRoundedBox(imagePath: sale.imageUrl, timeText: sale.time, title: sale.discount, subTitle: sale.hotelName)
                       ],
                     ),
                   );
                 }).toList(),
               ),
             ),
           ),
         );
       } else{
         return const SizedBox.shrink();
       }

    });






    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           _buildRoundedBox(
    //             imagePath: "assets/images/Frame 1171275916 (1).png",
    //             timeText: "1H 40M left",
    //             title: "Get 20% OFF",
    //             subTitle: "Meghauli Hotel",
    //           ),
    //           const SizedBox(width: 10),
    //           _buildRoundedBox(
    //             imagePath: "assets/images/Frame 1171275917.png",
    //             timeText: "1H 40M left",
    //             title: "Get 20% OFF",
    //             subTitle: "Meghauli Hotel",
    //           ),
    //           const SizedBox(width: 10),
    //           _buildRoundedBox(
    //             imagePath: "assets/images/Frame 1171275918.png",
    //             timeText: "1H 40M left",
    //             title: "Get 20% OFF",
    //             subTitle: "Meghauli Hotel",
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _buildRoundedBox({
    required String imagePath,
    required String timeText,
    required String title,
    required String subTitle,
  }) {
    return Container(
      height: 0.2.sh,
      width: 0.45.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Center(
                  child: Text(
                    timeText,
                    style: TextStyleWidget.flashSlaesTime(),
                  ),
                ),
                SizedBox(height: 0.094.sh),
                Center(
                  child: Text(title, style: TextStyleWidget.flashSalesOffer()),
                ),
                const SizedBox(height: 0.003),
                Center(
                  child: Text(
                    subTitle,
                    style: TextStyleWidget.flashSlaesHotelName(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
