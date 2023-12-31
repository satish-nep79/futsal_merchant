import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futsoul_merchant/models/booking.dart';
import 'package:futsoul_merchant/utils/constants/colors.dart';
import 'package:futsoul_merchant/utils/constants/custom_text_styles.dart';
import 'package:futsoul_merchant/utils/helpers/date_time_helper.dart';
import 'package:futsoul_merchant/utils/constants/image_path.dart';
import 'package:futsoul_merchant/views/booking_details_screen.dart';
import 'package:futsoul_merchant/widget/custom/elevated_button.dart';
import 'package:get/get.dart';

class BookingList extends StatelessWidget {
  final Booking booking;
  const BookingList({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: theme.colorScheme.shadow,
                offset: const Offset(1, 1),
                blurRadius: 8,
                spreadRadius: 1)
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: booking.user?.image ?? "",
              fit: BoxFit.cover,
              height: 130,
              width: 120,
              placeholder: (context, url) =>
                  const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                ImagePath.imagePlaceholder,
                fit: BoxFit.cover,
                height: 130,
                width: 120,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${booking.user?.name??booking.fullName}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.f16W600(),
                ),
                Text(
                  "${booking.user?.email??booking.phone}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.f16W300(),
                ),
                Text(
                  "${booking.status?.toUpperCase()}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      CustomTextStyles.f16W600(color: AppColors.primaryColor),
                ),
                Text(
                  DateTimeHelper.prettyDateTime(DateTime.parse("${booking.day!} ${booking.startTime}")),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.f16W300(),
                ),
                SizedBox(
                  width: Get.width - 195,
                  child: CustomElevatedButton(
                    title: "Show Details",
                    height: 40,
                    onTap: () {
                      Get.toNamed(BookingDetailScreen.routeName, arguments: [booking]);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
