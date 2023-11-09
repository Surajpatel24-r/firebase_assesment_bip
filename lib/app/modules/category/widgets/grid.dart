import 'package:firebase_assesment_bip/app/modules/category/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/gridClass.dart';

class GridItemWidget extends StatelessWidget {
  final GridItem item;

  GridItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 60.h,
              width: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Image.network(
                item.imagePath,
                fit: BoxFit
                    .cover, // This should be adjusted based on how you want to handle the image layout.
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              item.title,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
