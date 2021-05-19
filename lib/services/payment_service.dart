import 'package:flutter/foundation.dart';
import 'package:upi_india/upi_india.dart';

class PaymentService extends ChangeNotifier {
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  getupiApps() async {
    try {
      apps = await _upiIndia.getAllUpiApps(mandatoryTransactionId: false);
      return apps;
    } catch (error) {
      print(error);
    }
  }

  Future<UpiResponse> initiateTransaction(
      UpiApp app, String receicerName, double ammount) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "9078600498@ybl",
      receiverName: receicerName,
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: ammount,
    );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }
}
