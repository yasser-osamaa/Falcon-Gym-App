import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class PopularActivitesCard extends StatelessWidget {
  const PopularActivitesCard({
    super.key,
    required this.color,
    required this.title,
    required this.subTitle,
    this.onTap,
    required this.iconData,
  });
  final Color color;
  final String title;
  final String subTitle;
  final void Function()? onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //width: MediaQuery.sizeOf(context).width * .35,
        // height: MediaQuery.sizeOf(context).height * .2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(iconData, size: 25),
              Expanded(child: SizedBox(height: 20)),
              Text(
                title,
                style: Styless.textStyle15,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Text(
                subTitle,
                style: Styless.textStyle12.copyWith(
                  color: Color(0xff707B80),
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
