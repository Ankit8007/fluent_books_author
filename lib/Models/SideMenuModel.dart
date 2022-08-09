class SideMenuModel{
  String title;
  String image;
  String postImage;
  bool status;

  SideMenuModel({
    required this.title,
    required this.image,
    this.postImage = '',
    this.status = false,
  });
}