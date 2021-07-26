
class Histograms {
  final Histogram connection;
  final Histogram usage;

  const Histograms({
    required this.connection,
    required this.usage,
  }) ;

  factory Histograms.fromJson(Map<String, dynamic> json) {
    return Histograms(
        connection:
            Histogram.fromJson(json['HikariPool-2.pool.ConnectionCreation']),
        usage: Histogram.fromJson(json['HikariPool-2.pool.Usage']));
  }
}

// Histogram
class Histogram {
  final dynamic count;
  final dynamic max;
  final dynamic mean;
  final dynamic min;
  final dynamic p50;
  final dynamic p75;
  final dynamic p95;
  final dynamic p98;
  final dynamic p99;
  final dynamic p999;
  final dynamic stddev;

  const Histogram(
      {required this.count,
      required this.max,
      required this.mean,
      required this.min,
      required this.p50,
      required this.p75,
      required this.p95,
      required this.p98,
      required this.p99,
      required this.p999,
      required this.stddev})
      : assert(count != null),
        assert(count != null),
        assert(max != null),
        assert(mean != null),
        assert(min != null),
        assert(p50 != null),
        assert(p75 != null),
        assert(p95 != null),
        assert(p98 != null),
        assert(p99 != null),
        assert(p999 != null),
        assert(stddev != null);

  factory Histogram.fromJson(Map<String, dynamic> json) {
    return Histogram(
        count: json['count'],
        max: json['max'],
        mean: json['mean'],
        min: json['min'],
        p50: json['p50'],
        p75: json['p75'],
        p95: json['p95'],
        p98: json['p98'],
        p99: json['p99'],
        p999: json['p999'],
        stddev: json['stddev']);
  }
}