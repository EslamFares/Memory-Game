import 'package:memory_game/model/model.dart';

int point = 0;
bool selected = false;
String selectedImageAssetsPath='';
int selectedTileIndex;
List<TileModel> visiblePairs = new List<TileModel>();
List<TileModel> pairs = new List<TileModel>();
//==================================
List<TileModel> getPairs() {
  List<TileModel> pairs = List<TileModel>();
  TileModel tileModel = TileModel();
  //1
  tileModel.setImageAssetsPath('assets/fox.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //2
  tileModel.setImageAssetsPath('assets/hippo.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //3
  tileModel.setImageAssetsPath('assets/horse.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //4
  tileModel.setImageAssetsPath('assets/monkey.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //5
  tileModel.setImageAssetsPath('assets/panda.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //6
  tileModel.setImageAssetsPath('assets/parrot.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //7
  tileModel.setImageAssetsPath('assets/rabbit.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //8
  tileModel.setImageAssetsPath('assets/zoo.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

return pairs;
}
//=============================
List<TileModel> getQuestions() {
  List<TileModel> pairs = List<TileModel>();
  TileModel tileModel = TileModel();
  //1
  tileModel.setImageAssetsPath('assets/question.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //2
  tileModel.setImageAssetsPath('assets/question.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //3
  tileModel.setImageAssetsPath('assets/question.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //4
  tileModel.setImageAssetsPath('assets/question.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //5
  tileModel.setImageAssetsPath('assets/question.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //6
  tileModel.setImageAssetsPath('assets/question.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //7
  tileModel.setImageAssetsPath('assets/question.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //8
  tileModel.setImageAssetsPath('assets/question.png');
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  return pairs;
}