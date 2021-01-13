import 'package:flutter/material.dart';
import 'package:flutter_nusantech/provider/CalculatorProvider.dart';
import 'package:flutter_nusantech/view/BaseView.dart';
import 'package:toast/toast.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final formKey = GlobalKey<FormState>();

  Widget inputAngkaField({
  CalculatorProvider provider,
}){
    return  Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextFormField(
                validator: (value){
                  if(provider.checkAngka2 && value.isEmpty){
                    return 'Angka 2 tidak boleh kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Masukkan angka 2"
                ),
              ),
            ),
          ),
          Checkbox(value: provider.checkAngka2, onChanged: (value){})
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BaseView<CalculatorProvider>(
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Calculator"),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            child: ListView(
              children: [
                Form(
                  key: formKey,
                    child: Column(
                  children: [
                    InputAngkaField(
                      hintText: "Masukkan angka 1",
                      textEditingController: provider.angka1,
                      validator: (value){
                        if(provider.checkAngka1 && value.isEmpty){
                          return 'Angka 1 tidak boleh kosong';
                        }
                        return null;
                      },
                      valueCheckBox: provider.checkAngka1,
                      onChangeCheckBox: (value){
                       bool res = provider.setCheckBox(
                          indexCheckBox: 0,
                          value: value
                        );
                       if(!res){
                         Toast.show('checklist tidak boleh kurang dari 2', context, gravity: Toast.CENTER);
                       }
                      },
                    ),
                    InputAngkaField(
                      hintText: "Masukkan angka 2",
                      textEditingController: provider.angka2,
                      validator: (value){
                        if(provider.checkAngka2 && value.isEmpty){
                          return 'Angka 2 tidak boleh kosong';
                        }
                        return null;
                      },
                      valueCheckBox: provider.checkAngka2,
                      onChangeCheckBox: (value){
                       bool res =  provider.setCheckBox(
                            indexCheckBox: 1,
                            value: value
                        );
                       if(!res){
                         Toast.show('checklist tidak boleh kurang dari 2', context, gravity: Toast.CENTER);
                       }
                      },
                    ),
                    InputAngkaField(
                      hintText: "Masukkan angka 3",
                      textEditingController: provider.angka3,
                      validator: (value){
                        if(provider.checkAngka3 && value.isEmpty){
                          return 'Angka 3 tidak boleh kosong';
                        }
                        return null;
                      },
                      valueCheckBox: provider.checkAngka3,
                      onChangeCheckBox: (value){
                       bool res = provider.setCheckBox(
                            indexCheckBox: 2,
                            value: value
                        );
                       if(!res){
                         Toast.show('checklist tidak boleh kurang dari 2', context, gravity: Toast.CENTER);
                       }
                      },
                    ),
                  ],
                )),
                // button operasi
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          if(formKey.currentState.validate()){
                            provider.operation(typeOperator: "+");
                          }

                        },
                        child: Text("+", style: TextStyle(fontSize: 20,color: Colors.white),),
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          if(formKey.currentState.validate()){
                            provider.operation(typeOperator: "-");
                          }
                        },
                        child: Text("-", style: TextStyle(fontSize: 20,color: Colors.white)),),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          if(formKey.currentState.validate()){
                            provider.operation(typeOperator: "x");
                          }
                        }, child: Text("x", style: TextStyle(fontSize: 20,color: Colors.white)),),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          if(formKey.currentState.validate()){
                            provider.operation(typeOperator: "/");
                          }
                        }, child: Text("/", style: TextStyle(fontSize: 20,color: Colors.white)),)
                    ],
                  ),
                ),

                // Hasil
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      Divider(color: Colors.black,),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hasil:", style: Theme.of(context).textTheme.headline4,),
                          Text(provider.hasil == null ? '' :provider.hasil.toString(), style: Theme.of(context).textTheme.headline4,),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class InputAngkaField extends StatelessWidget {
  final Function validator;
  final bool valueCheckBox;
  final Function onChangeCheckBox;
  final String hintText;
  final TextEditingController textEditingController;
  InputAngkaField({
    this.onChangeCheckBox,
    this.valueCheckBox,
    this.validator,
    this.hintText,
    this.textEditingController
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: textEditingController,
                validator: validator,
                decoration: InputDecoration(
                    hintText: hintText
                ),
              ),
            ),
          ),
          Checkbox(value: valueCheckBox, onChanged: onChangeCheckBox)
        ],
      ),
    );
  }
}

