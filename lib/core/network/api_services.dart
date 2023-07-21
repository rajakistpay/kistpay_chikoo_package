import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kistpay_chikoo/presentation/term_and_condition_screen/SubmitApplicationModel.dart';

class ApiService {
  // static const String baseUrl = 'https://retailer.kistpay.com';
  static const String baseUrl =
      'http://kistpay-backend-dev-alb-910629115.me-south-1.elb.amazonaws.com';
  Future<ApiResponse> generateOTP(String phoneNumber) async {
    return _generateOTP(phoneNumber);
  }

  Future<ApiResponse> _generateOTP(String phoneNumber) async {
    try {
      const url = '$baseUrl/OTP/geterate';
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'mobileNumber': phoneNumber,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final parsedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  Future<ApiResponse> verifyOTP(String phoneNumber, int otp) async {
    try {
      const url = '$baseUrl/OTP/verifyOtp';
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'mobileNumber': phoneNumber,
          'otp': otp,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final parsedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  Future<ApiResponse> getDevices() async {
    try {
      const url = '$baseUrl/financing-device-controller/all';
      final response = await http.get(Uri.parse(url));

      final parsedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  Future<ApiResponse> getDevicesPlans(String price) async {
    try {
      var url =
          '$baseUrl/financing-application-controller/get-all-financing-plans/?phonePrice=$price';
      final response = await http.post(
        Uri.parse(url),
      );

      final parsedResponse = json.decode(response.body);
      print(parsedResponse);
      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  Future<ApiResponse> ocrPart1(String imagePath) async {
    try {
      const url =
          'https://h2uq9goh2b.execute-api.ap-southeast-1.amazonaws.com/ImageOcr';
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'img': imagePath,
          'fileExt': 'jpeg',
          'imageID': 123456.toString(),
        }),
      );

      final parsedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  Future<ApiResponse> ocrPart2() async {
    try {
      const url =
          'https://1rafzhnka5.execute-api.ap-southeast-1.amazonaws.com/getOCR';
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'fileName': '123456.jpeg',
        }),
      );

      final parsedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  ApiResponse handleApiException(dynamic e) {
    String errorMessage;

    if (e is SocketException) {
      errorMessage =
          'Network error. Please check your internet connection and try again.';
    } else if (e is TimeoutException) {
      errorMessage = 'Request timeout. Please try again later.';
    } else if (e is FormatException) {
      errorMessage =
          'Invalid response from the server. Please try again later.';
    } else {
      errorMessage = 'An unexpected error occurred. Please try again later.';
    }

    return ApiResponse(success: false, error: errorMessage);
  }

  Future<ApiResponse> uploadFile(String phoneNumber, File file) async {
    try {
      const url = '$baseUrl/storage/uploadFile';

      // Create a multipart request
      final request = http.MultipartRequest('POST', Uri.parse(url));

      // Add phone number as a field
      request.fields['applicantPhoneNumber'] = phoneNumber;

      // Add the file to be uploaded
      final fileStream = http.ByteStream(file.openRead());
      final fileLength = await file.length();
      final multipartFile = http.MultipartFile('file', fileStream, fileLength,
          filename: file.path.split('/').last);
      request.files.add(multipartFile);

      // Send the request
      final response = await request.send();

      // Get the response as a string
      final responseString = await response.stream.bytesToString();
      final parsedResponse = json.decode(responseString);

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  // Future<ApiResponse> getAllFinancingPlans() async {
  //   try {
  //     const url =
  //         '$baseUrl/financing-application-controller/get-all-financing-plans';
  //
  //     // Send the GET request
  //     final response = await http.get(Uri.parse(url));
  //
  //     // Parse the response
  //     final parsedResponse = json.decode(response.body);
  //
  //     if (response.statusCode == 200) {
  //       print('asfsfsdsdfds ${response.body}');
  //       return ApiResponse(success: true, data: parsedResponse);
  //     } else {
  //       final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
  //       return ApiResponse(success: false, error: errorMessage);
  //     }
  //   } catch (e) {
  //     print('asfsfsdsdfds $e');
  //     return handleApiException(e);
  //   }
  // }

  Future<ApiResponse> previewInstallmentFormula(
      {int? downPayment,
      int? insurancePlan,
      int? numberOfInstallments,
      int? totalAmount}) async {
    try {
      const url =
          '$baseUrl/financing-application-controller/preview-installment-formula';
      print(' downPayment$totalAmount');
      final body = {
        'downPayment': downPayment,
        'insurancePlan': insurancePlan,
        'numberOfInstallments': numberOfInstallments,
        'totalAmount': totalAmount
      };

      final response = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );
      print('this is qwerqwerwe  ${response.body}');
      final parsedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        print('this is is is is  ${parsedResponse}');
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  Future<ApiResponse> submitApplication(
      {SubmitApplicationModel? submitApplicationModelt}) async {
    try {
      const url =
          '$baseUrl/financing-application-controller/submit-application';

      print('request ${submitApplicationModelt!.toJson()}');
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(submitApplicationModelt.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      final parsedResponse = json.decode(response.body);
      print('request ${response.body} ${response.statusCode}');
      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage =
            parsedResponse['message'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      print('this is error $e');
      print(e);
      return handleApiException(e);
    }
  }

  Future<ApiResponse> generateVoucher(
      {String? applicationId, String? channelType, String? voucherType}) async {
    try {
      const url =
          '$baseUrl/financing-application-controller/generate-channel-wise-bill';

      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "applicationId": applicationId,
          "channelType": channelType,
          "voucherType": voucherType
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final parsedResponse = json.decode(response.body);
      print('request ${parsedResponse}');
      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage =
            parsedResponse['message'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      print('this is error ');
      print(e);
      return handleApiException(e);
    }
  }

  Future<ApiResponse> easyPaisaPayment(
      {String? amount, String? instalmentID, String? phoneNumber}) async {
    try {
      const url =
          '$baseUrl/financing-application-controller/easy-paisa/send-prompt';

      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "amount": amount,
          "instalmentID": instalmentID,
          "phoneNumber": phoneNumber
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final parsedResponse = json.decode(response.body);
      print('request ${parsedResponse}');
      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage =
            parsedResponse['message'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      print('this is error ');
      print(e);
      return handleApiException(e);
    }
  }

  Future<ApiResponse> getStatus(String phoneNumber) async {
    try {
      const url = '$baseUrl/financing-application-controller/phone';
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'phoneNumber': phoneNumber,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final parsedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        // final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: 'No Application Found');
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  Future<ApiResponse> markPayment({
    String? applicationId,
    String? chikooResponse,
    int? installmentNumber,
  }) async {
    try {
      const url = '$baseUrl/chikoo-transaction/add';
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'applicationId': applicationId,
          'chikooResponse':chikooResponse,
          'installmentNumber':installmentNumber
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final parsedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage = parsedResponse['error'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      return handleApiException(e);
    }
  }

  Future<ApiResponse> customerInstallmentPlan({
    String? phonePrice,
    String? downpayment,
    String? installmentPeriod,
    String? insuranceCharges,
    String? totalUpfront,
    String? financingAmount,
    String? financingFee,
    String? monthlyInstallment,
    String? totalCostOfPhone,
    String? processingFee,
  }) async {
    try {
      const url =
          '$baseUrl/financing-application-controller/submit-customer_installment-plan';

      print('request data ${json.encode({
        "customerPlainId": 1,
        "phonePrice": phonePrice,
        "downpayment": downpayment,
        "installmentPeriod": installmentPeriod,
        "insuranceCharges": insuranceCharges,
        "totalUpfront": totalUpfront,
        "financingAmount": financingAmount,
        "financingFee": financingFee,
        "monthlyInstallment": monthlyInstallment,
        "totalCostOfPhone": totalCostOfPhone,
        "processingFee": processingFee
      })}');
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "customerPlainId": 1,
          "phonePrice": phonePrice,
          "downpayment": downpayment,
          "installmentPeriod": installmentPeriod,
          "insuranceCharges": insuranceCharges,
          "totalUpfront": totalUpfront,
          "financingAmount": financingAmount,
          "financingFee": financingFee,
          "monthlyInstallment": monthlyInstallment,
          "totalCostOfPhone": totalCostOfPhone,
          "processingFee": processingFee
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final parsedResponse = json.decode(response.body);
      print('request ${response.body} ${response.statusCode}');
      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: parsedResponse);
      } else {
        final errorMessage =
            parsedResponse['message'] as String? ?? 'API Error';
        return ApiResponse(success: false, error: errorMessage);
      }
    } catch (e) {
      print('this is error ');
      print(e);
      return handleApiException(e);
    }
  }
}

class ApiResponse {
  final bool success;
  final dynamic data;
  final String? error;

  ApiResponse({required this.success, this.data, this.error});
}
