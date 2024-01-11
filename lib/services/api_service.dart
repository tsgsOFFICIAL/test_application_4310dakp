import 'package:test_application_4310dakp/imports.dart';
import 'package:http/http.dart' as http;

// Define the base URL for the API
const String baseApiUrl = 'http://10.108.137.171:5028/api';

// Function to make API call to get data
Future<String?> getFutureStringAsync() async {
  try {
    final response = await http.get(Uri.parse('$baseApiUrl/Future/Get'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}

// Function to make API call to get current value
Future<CounterModel?> getCurrentValueAsync() async {
  try {
    final response = await http.get(Uri.parse('$baseApiUrl/Number/Get'));

    if (response.statusCode == 200) {
      return CounterModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}

// Function to make API call to increment the value
Future<CounterModel?> incrementApiAsync() async {
  try {
    final response = await http.put(Uri.parse('$baseApiUrl/Number/Increment'));

    if (response.statusCode != 200) {
      // Handle error
      debugPrint('Failed to increment value');
    } else {
      return CounterModel.fromJson(jsonDecode(response.body));
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }

  return null;
}

// Function to make API call to decrement the value
Future<CounterModel?> decrementApiAsync() async {
  try {
    final response = await http.put(Uri.parse('$baseApiUrl/Number/Decrement'));

    if (response.statusCode != 200) {
      // Handle error
      debugPrint('Failed to decrement value');
    } else {
      return CounterModel.fromJson(jsonDecode(response.body));
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }

  return null;
}

// Function to make API call for authentication
Future<TokenModel?> getUserAccessTokenAsync(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseApiUrl/Jwt/accesstoken'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Authentication successful
      return TokenModel.fromJson(jsonDecode(response.body));
    } else {
      // Authentication failed
      debugPrint('Authentication failed');
      return null;
    }
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}
