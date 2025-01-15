import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for the UI
  String? time; // Time in location
  String flag; // URL to asset flag icon
  String url; // Location URL for API endpoint
  bool isDaytime; // true or false: daytime or not

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  }) : isDaytime = false;

  Future<void> getTime() async {
    try {
      // Build the API endpoint URL
      final response = await http.get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));

      if (response.statusCode == 200) {
        // Parse the response body
        Map<String, dynamic> data = jsonDecode(response.body);

        // Log the data to see the exact API response structure
        print('API Response: $data');

        // Check for the presence of 'dateTime' key and its value
        if (data.containsKey('dateTime') && data['dateTime'] != null) {
          String datetime = data['dateTime'];
          DateTime now = DateTime.parse(datetime);

          // Set the time property
          isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
          time = DateFormat.jm().format(now);
        } else {
          throw 'API response missing required "dateTime" field or it is null.';
        }
      } else {
        throw 'Failed to fetch time data. Status code: ${response.statusCode}';
      }
    } catch (e) {
      print('Caught error: $e');
      // Provide a fallback value for the time property
      time = 'Could not get time data';
    }
  }
}

// Example: Initialize WorldTime with a valid URL for Nigeria
WorldTime world = WorldTime(
  location: 'Nigeria',
  flag: 'flag.jpg',
  url: 'Africa/Lagos', // Correct URL for Nigeria in the time API
);
