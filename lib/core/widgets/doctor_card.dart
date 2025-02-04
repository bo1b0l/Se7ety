import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/auth/data/model/doctor_model.dart';
import 'package:se7ety/feature/patient/search/page/doctor_profile_view.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final bool isClickable;

  const DoctorCard({
    super.key,
    required this.doctor,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(-3, 0),
              blurRadius: 15,
              color: AppColors.greyColor.withValues(alpha: 0.1))
        ],
      ),
      child: InkWell(
        onTap: () {
          if (isClickable) {
            push(context, DoctorProfile(doctorModel: doctor));
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.whiteColor),
                child: Image.network(
                  doctor.image ?? '',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    doctor.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getbodyTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    doctor.specialization ?? '',
                    style: getbodyTextStyle(color: AppColors.textColor),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  (doctor.rating?.toString() ?? "5"),
                  style: getbodyTextStyle(),
                ),
                const Gap(3),
                const Icon(
                  Icons.star_rate_rounded,
                  size: 20,
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
