
class Meters {
  final Meter connTimeoutRate;
  final Meter errors;
  final Meter badRequest;
  final Meter created;
  final Meter noContent;
  final Meter notFound;
  final Meter ok;
  final Meter other;
  final Meter serverError;
  final Meter timeouts;

  const Meters({
    required this.connTimeoutRate,
    required this.errors,
    required this.badRequest,
    required this.created,
    required this.noContent,
    required this.notFound,
    required this.ok,
    required this.other,
    required this.serverError,
    required this.timeouts,
  }) ;

  factory Meters.fromJson(Map<String, dynamic> json) {
    return Meters(
      connTimeoutRate:
          Meter.fromJson(json['HikariPool-2.pool.ConnectionTimeoutRate']),
      errors: Meter.fromJson(
          json['com.codahale.metrics.servlet.InstrumentedFilter.errors']),
      badRequest: Meter.fromJson(json[
          'com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.badRequest']),
      created: Meter.fromJson(json[
          'com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.created']),
      noContent: Meter.fromJson(json[
          'com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.noContent']),
      notFound: Meter.fromJson(json[
          'com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.notFound']),
      ok: Meter.fromJson(json[
          'com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.ok']),
      other: Meter.fromJson(json[
          'com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.other']),
      serverError: Meter.fromJson(json[
          'com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.serverError']),
      timeouts: Meter.fromJson(
          json['com.codahale.metrics.servlet.InstrumentedFilter.timeouts']),
    );
  }
}

class Meter {
  final dynamic count;
  final dynamic m15;
  final dynamic m1;
  final dynamic m5;
  final dynamic mean;
  final String units;

  const Meter(
      {required this.count,
      required this.m15,
      required this.m1,
      required this.m5,
      required this.mean,
      required this.units})
      ;

  factory Meter.fromJson(Map<String, dynamic> json) {
    return Meter(
        count: json['count'],
        m15: json['m15_rate'],
        m1: json['m1_rate'],
        m5: json['m5_rate'],
        mean: json['mean_rate'],
        units: json['units']);
  }
}