import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageView extends StatelessWidget {
  final List<dynamic> imgList;
  final int currentIndex;
  ImageView(this.imgList, this.currentIndex) : assert(imgList != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
      scrollPhysics: BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(imgList[index]),
          initialScale: PhotoViewComputedScale.contained,
        );
      },
      itemCount: imgList.length,
      pageController: PageController(initialPage: currentIndex),
    ));
  }
}
