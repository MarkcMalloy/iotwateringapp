import 'package:http/http.dart' as http;
import 'package:iotwateringapp/Constructors/plant.dart';
class ApiService {
  //String ip = "192.168.68.165:23";

  //Plant object contains pump ID for POST url
  Future<void> startWaterPump(String ip, Plant plant) async {
    var url = Uri.http(ip,'/pump${plant.plantPumpId}');
    var response = await http.post(url, body: {'pumpId': '1'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  //Gets air temp from the MKR carrier
  Future<double> getAirTemperature(String ip) async {
    var url = Uri.http(ip, '/getTemperature');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var temp = response.body as double;
    return temp;
  }

  Future<double> getHumidity(String ip) async {
    var url = Uri.http(ip, '/getHumidity');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var humidity = response.body as double;
    return humidity;
  }
}