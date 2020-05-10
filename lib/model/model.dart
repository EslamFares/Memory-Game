class TileModel {
  String imageAssetsPath;
  bool isSeleted;

  TileModel({this.imageAssetsPath, this.isSeleted});

  void setImageAssetsPath(String getImageAssetsPath) {
    imageAssetsPath = getImageAssetsPath;
  }

  void setIsSelected(bool getIsSelected) {
    isSeleted = getIsSelected;
  }

  String getImageAssetsPath() {
    return imageAssetsPath;
  }

  bool getIsSelected() {
    return isSeleted;
  }
}
