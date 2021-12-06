import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPage extends StatefulWidget {
  const RazorPayPage({Key? key}) : super(key: key);

  @override
  _RazorPayPageState createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'name': 'Geeks for Geeks.',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.network(
             // "assets/gfg.png",
              "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200817185016/gfg_complete_logo_2x-min.png",
              height: 100,
              width: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Welcome to Razorpay Payment Gateway Integration",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0)),
                  labelText: 'Enter Amount to be paid',
                  labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  )),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
                controller: amtController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Amount to be paid..';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (amtController.text.toString().isNotEmpty) {
                    setState(() {
                      int amount = int.parse(amtController.text.toString());
                      openCheckout(amount);
                    });
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Make Payment"),
                ),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
