import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({Key? key , this.hintText ,this.inputType, this.onChange , this.obSecure = false , this.prefIcon , this.suffIcon}) : super(key: key);
  String ? hintText;
  Function(String)? onChange;
  bool ? obSecure ;
  TextInputType ? inputType;
   IconData?  prefIcon ;
   IconData ? suffIcon ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType:inputType,

      obscureText:obSecure !,
      // validator: (data){
      //   if(data!.isEmpty){
      //     return 'Field is required';
      //   }
      //
      // },
      style: TextStyle(
        color: Colors.black
      ),
      onChanged:onChange ,
      decoration: InputDecoration(
        suffixIcon:(
           Icon(suffIcon)),
        hintText:hintText ,
          hintStyle: TextStyle(
            // color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.teal
            ),
            borderRadius: BorderRadius.circular(16.0)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
            ),
              borderRadius: BorderRadius.circular(16.0)

          )
      ),
    );
  }
}
