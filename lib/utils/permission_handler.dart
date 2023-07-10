import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_skeleton/components/widget_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../components/custom_button.dart';

class MyPermissionHandler {
  static Future<PermissionStatus> askPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isDenied) {
      var newStatus = await permission.request();

      return newStatus;
    } else {
      return status;
    }
  }

  static Future<bool> askPermissions(List<Permission> permissions) async {
    var statuses = await permissions.request();
    var statusList =
        statuses.values.where((element) => element.isGranted).toList();

    if (statusList.length < permissions.length) {
      return false;
    } else {
      return true;
    }
  }

  static showPermissionDialog(
      BuildContext context,
      bool? isPermissionPermanentlyDenied,
      Permission permission,
      String permissionName) {
    showPermissionDialogMobile(context, isPermissionPermanentlyDenied ?? false,
        permission, permissionName);
  }

  static showPermissionDialogMobile(
      BuildContext context,
      bool isPermissionPermanentlyDenied,
      Permission permission,
      String permissionName) {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.5.w),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Permission required",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(dialogContext);
                    },
                    child: Icon(
                      Icons.close,
                      size: 6.w,
                    )),
              ],
            ),
            content: isPermissionPermanentlyDenied
                ? Text(
                    "Permission required for $permissionName, Please grant it.",
                    style: Theme.of(context).textTheme.bodyMedium)
                : Text(
                    "Permission required for $permissionName, Click on Yes to grant it from settings",
                    style: Theme.of(context).textTheme.bodyMedium),
            actionsPadding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.w),
            actions: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ).expand,
                  CustomButton(
                    onClick: () async {
                      Navigator.of(context).pop();
                      if (isPermissionPermanentlyDenied) {
                        await openAppSettings();
                      } else {
                        askPermission(permission);
                      }
                    },
                    buttonText: "Yes",
                    showMargin: false,
                    height: 5.h,
                  ).expand,
                ],
              )
            ],
            actionsAlignment: MainAxisAlignment.spaceAround,
          );
        });
  }
}
