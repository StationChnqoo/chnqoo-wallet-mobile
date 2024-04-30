import 'package:chnqoo_wallet/constants/bond_forward.dart';

class BondForwardPanel {
  int code;
  String title;
  List<BondForward> datas = [];
  BondForwardPanel(
      {required this.code, required this.title, required this.datas});
}
