import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';

import 'package:image_picker/image_picker.dart';

import 'package:flutterdemo/component/popup/bottom-sheet.dart';

// 选择相册多张图片
Future<List<File>> Function(BuildContext, int) pickImageFromAlbum =
    (BuildContext context, int rest) async {
  List<AssetEntity> imgList = await PhotoPicker.pickAsset(
    context: context,
    themeColor: Color(0xff00c295),
    textColor: Colors.white,
    padding: 1.0,
    dividerColor: Colors.grey,
    disableColor: Colors.grey.shade300,
    itemRadio: 0.88,
    maxSelected: rest,
    provider: I18nProvider.chinese,
    rowCount: 3,
    thumbSize: 150,
    sortDelegate: SortDelegate.common,
    checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
      activeColor: Colors.white,
      unselectedColor: Colors.white,
      checkColor: Color(0xff00c295),
    ),
    badgeDelegate: const DurationBadgeDelegate(),
    pickType: PickType.onlyImage,
  );
  if (imgList == null || imgList.isEmpty) return [];

  List<String> r = [];
  List<File> f = [];
  for (var e in imgList) {
    var file = await e.file;
    f.add(file);
    r.add(file.absolute.path);
  }
  return f;
};

final ImagePicker picker = ImagePicker();

// 打开相机
Future<List<File>> Function() openCamera = () async {
  final PickedFile img = await picker.getImage(source: ImageSource.camera);
  if (img.path == null) return [];
  return [File(img.path)];
};

// class PickImageResponse {
//   final paths
// }

// 打开选择框
void Function(BuildContext, int, Function(List<File>))
    pickImageFromCameraOrAlbum =
    (BuildContext context, int rest, Function(List<File>) callback) {
  bottomSheet(
      context,
      CupertinoActionSheetOptions(
          items: ['拍照', '相册'],
          callback: (int idx) async {
            if (idx == 0) return callback(await openCamera());
            return callback(await pickImageFromAlbum(context, rest));
          }));
  return;
};
