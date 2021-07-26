
class Timers {
  final Timer wait;
  final Timer request;
  final Timer activateAccount;
  final Timer changePass;
  final Timer finishPass;
  final Timer getAccount;
  final Timer isAuth;
  final Timer registerAccount;
  final Timer reqPassReset;
  final Timer saveAccount;
  final Timer changeLevel;
  final Timer getList;
  final Timer authorize;
  final Timer createUser;
  final Timer deleteUser;
  final Timer getAllUser;
  final Timer getAuth;
  final Timer getUser;
  final Timer updateUser;

  const Timers(
      {required this.wait,
      required this.request,
      required this.activateAccount,
      required this.changePass,
      required this.finishPass,
      required this.getAccount,
      required this.isAuth,
      required this.registerAccount,
      required this.reqPassReset,
      required this.saveAccount,
      required this.changeLevel,
      required this.getList,
      required this.authorize,
      required this.createUser,
      required this.deleteUser,
      required this.getAllUser,
      required this.getAuth,
      required this.getUser,
      required this.updateUser})
     ;

  factory Timers.fromJson(Map<String, dynamic> json) {
    return Timers(
        wait: Timer.fromJson(json['HikariPool-2.pool.Wait']),
        request: Timer.fromJson(
            json['com.codahale.metrics.servlet.InstrumentedFilter.requests']),
        activateAccount: Timer.fromJson(json[
            'com.mycompany.myapp.web.rest.AccountResource.activateAccount']),
        changePass: Timer.fromJson(json[
            'com.mycompany.myapp.web.rest.AccountResource.changePassword']),
        finishPass: Timer.fromJson(json[
            'com.mycompany.myapp.web.rest.AccountResource.finishPasswordReset']),
        getAccount: Timer.fromJson(
            json['com.mycompany.myapp.web.rest.AccountResource.getAccount']),
        isAuth: Timer.fromJson(json[
            'com.mycompany.myapp.web.rest.AccountResource.isAuthenticated']),
        registerAccount: Timer.fromJson(json[
            'com.mycompany.myapp.web.rest.AccountResource.registerAccount']),
        reqPassReset: Timer.fromJson(json[
            'com.mycompany.myapp.web.rest.AccountResource.requestPasswordReset']),
        saveAccount:
            Timer.fromJson(json['com.mycompany.myapp.web.rest.AccountResource.saveAccount']),
        changeLevel: Timer.fromJson(json['com.mycompany.myapp.web.rest.LogsResource.changeLevel']),
        getList: Timer.fromJson(json['com.mycompany.myapp.web.rest.LogsResource.getList']),
        authorize: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserJWTController.authorize']),
        createUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.createUser']),
        deleteUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.deleteUser']),
        getAllUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.getAllUsers']),
        getAuth: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.getAuthorities']),
        getUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.getUser']),
        updateUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.updateUser']));
  }
}

class Timer {
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
  final dynamic m15Rate;
  final dynamic m1Rate;
  final dynamic m5Rate;
  final dynamic meanRate;
  final String durationUnits;
  final String rateUnits;

  const Timer(
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
      required this.stddev,
      required this.m15Rate,
      required this.m1Rate,
      required this.m5Rate,
      required this.meanRate,
      required this.durationUnits,
      required this.rateUnits})
      ;

  factory Timer.fromJson(Map<String, dynamic> json) {
    return Timer(
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
        stddev: json['stddev'],
        m15Rate: json['m15_rate'],
        m1Rate: json['m1_rate'],
        m5Rate: json['m5_rate'],
        meanRate: json['mean_rate'],
        durationUnits: json['duration_units'],
        rateUnits: json['rate_units']);
  }
}