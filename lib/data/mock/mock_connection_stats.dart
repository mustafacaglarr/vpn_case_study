import '../../core/models/connection_stats.dart';
import 'mock_countries.dart';


/// Ülkeye göre farklı hız ve başlangıç zamanı tutan liste
final mockConnectionStatsList = [
  ConnectionStats(
    downloadSpeed: 220,
    uploadSpeed: 30,
    connectedTime: Duration.zero,
    connectedCountry: mockCountries[0], // Italy
  ),
  ConnectionStats(
    downloadSpeed: 527,
    uploadSpeed: 49,
    connectedTime: Duration.zero,
    connectedCountry: mockCountries[1], // Netherlands
  ),
  ConnectionStats(
    downloadSpeed: 430,
    uploadSpeed: 60,
    connectedTime: Duration.zero,
    connectedCountry: mockCountries[2], // Germany
  ),
];
