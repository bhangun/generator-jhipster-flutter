
import 'counter_model.dart';
import 'gauges_model.dart';
import 'histogram_model.dart';
import 'meter_model.dart';
import 'timer_model.dart';

class Health {
  final String version;
  final Gauges gauges;
  final Counters counters;
  final Histograms histograms;
  final Meters meters;
  final Timers timers;

  const Health(
      {required this.version,
      required this.gauges,
      required this.counters,
      required this.histograms,
      required this.meters,
      required this.timers})
     ;

  factory Health.fromJson(Map<String, dynamic> json) {
    return Health(
        version: json['version'],
        gauges: Gauges.fromJson(json['gauges']),
        counters: Counters.fromJson(json['counters']),
        histograms: Histograms.fromJson(json['histograms']),
        meters: Meters.fromJson(json['meters']),
        timers: Timers.fromJson(json['timers']));
  }
}