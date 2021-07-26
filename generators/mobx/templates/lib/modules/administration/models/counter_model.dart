
class Counters {
  final dynamic count;

  const Counters({
    required this.count,
  }) : assert(count != null);

  factory Counters.fromJson(Map<String, dynamic> json) {
    return Counters(
        count: json[
                'com.codahale.metrics.servlet.InstrumentedFilter.activeRequests']
            ['count']);
  }
}