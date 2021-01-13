import 'package:flutter/cupertino.dart';
import 'package:flutter_nusantech/provider/BaseProvider.dart';

class CalculatorProvider extends BaseProvider {
  bool checkAngka1 = true;
  bool checkAngka2 = true;
  bool checkAngka3 = true;

  List lisCheckBoxAktif = [0,1,2];

  TextEditingController angka1 = TextEditingController();
  TextEditingController angka2 = TextEditingController();
  TextEditingController angka3 = TextEditingController();

  int hasil;


  void operation({String typeOperator}){
    lisCheckBoxAktif.asMap().forEach((key, value) {

        if(key == 0){
            hasil = getValueInputFormindexCheckBox(value);
        }else{
          // mulai operation
          if(typeOperator == '+'){
            hasil += getValueInputFormindexCheckBox(value);
          }else if(typeOperator == '-'){
            hasil -= getValueInputFormindexCheckBox(value);
          }else if(typeOperator == 'x'){
            hasil *= getValueInputFormindexCheckBox(value);
          }else if(typeOperator == '/'){
            hasil = (hasil/getValueInputFormindexCheckBox(value)).round();
          }
          //end operation
        }
    });
      notifyListeners();
  }

  int getValueInputFormindexCheckBox(int index){
    if(index == 0){
      return int.parse(angka1.text);
    }else if(index == 1){
      return int.parse(angka2.text);
    }else{
      return int.parse(angka3.text);
    }
  }

  bool setCheckBox({int indexCheckBox, bool value}) {
    //check jumlah list aktif
    //jika jumlahnya kecil dari dua tidak bisa dihapus lagi
    if(value == false){
      if(lisCheckBoxAktif.length > 2){
        setCheckBoxDetail(value, indexCheckBox);
        return true;
      }else{
        return false;
      }
    }else{
      setCheckBoxDetail(value, indexCheckBox);
      return true;
    }

  }

  void setCheckBoxDetail(value, indexCheckBox){
    if(value == false){
      if(lisCheckBoxAktif.contains(indexCheckBox)){
        lisCheckBoxAktif.remove(indexCheckBox);
      }
    }else{
      if(!lisCheckBoxAktif.contains(indexCheckBox)){
        lisCheckBoxAktif.add(indexCheckBox);
      }
    }

    if (indexCheckBox == 0) {
      checkAngka1 = value;
    } else if (indexCheckBox == 1) {
      checkAngka2 = value;
    } else {
      checkAngka3 = value;
    }

    notifyListeners();
  }
}
