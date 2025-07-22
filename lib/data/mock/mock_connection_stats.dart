import '../../core/models/connection_stats.dart';
import 'mock_countries.dart';

final mockConnectionStats = ConnectionStats(
  downloadSpeed: 527,
  uploadSpeed: 49,
  connectedTime: Duration(hours: 2, minutes: 41, seconds: 52),
  connectedCountry: mockCountries[1], // Netherlands
);
