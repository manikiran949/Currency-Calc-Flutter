import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  TextEditingController amountEntered = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final blackBorder = OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.black,
      width: 2.0,
      style: BorderStyle.solid,
      strokeAlign: BorderSide.strokeAlignInside,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text(
          "Currency Converter",
          style: TextStyle(
            fontSize: 32.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "₹ ${result == 0 ? result.toStringAsFixed(0) : result.toStringAsFixed(3)} ",
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: amountEntered,
                decoration: InputDecoration(
                  hintText: "Enter The Amount in USD :",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.monetization_on_sharp),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: blackBorder,
                  focusedBorder: blackBorder,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(27.0),
              child: ElevatedButton(
                onPressed: () {
                  double amount = double.parse(amountEntered.text);
                  setState(() {
                    result = amount * 86.6;
                  });
                  if (kDebugMode){
                    print("Button is pressed");
                    print(result);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  minimumSize:
                      WidgetStatePropertyAll(Size(double.infinity, 50)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(4.0, 4.0)),
                    ),
                  ),
                ),
                child: Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
