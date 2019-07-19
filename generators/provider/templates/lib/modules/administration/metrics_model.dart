import 'package:flutter/foundation.dart';


class Data {
  final dynamic min;
  final dynamic max;

  Data(this.min, this.max);
}


class Health {

  final String version;
  final Gauges gauges;
  final Counters counters;
  final Histograms histograms;
  final Meters meters;
  final Timers timers;

  const Health({
    @required this.version,
    @required this.gauges,
    @required this.counters,
    @required this.histograms,
    @required this.meters,
    @required this.timers
  })
      : assert(version != null),
        assert(gauges != null),
        assert(counters != null),
        assert(histograms != null),
        assert(meters != null),
        assert(timers != null);

  factory Health.fromJson(Map<String, dynamic> json) {
    return Health(
        version: json['version'],
        gauges: Gauges.fromJson(json['gauges']),
        counters: Counters.fromJson(json['counters']),
        histograms: Histograms.fromJson(json['histograms']),
        meters: Meters.fromJson(json['meters']),
        timers: Timers.fromJson(json['timers'])
    );
  }
}


class Gauges {
  final dynamic activeConn;
  final dynamic idleConn;
  final dynamic maxConn;
  final dynamic minConn;
  final dynamic pendingConn;
  final dynamic totalConn;
  final String jvmName;
  final dynamic jvmUptime;
  final String jvmVendor;
  final dynamic jvmCapacity;
  final dynamic jvmDirectCount;
  final dynamic jvmUsed;
  final dynamic jvmMappedCapacity;
  final dynamic jvmMappedCount;
  final dynamic jvmMappedUsed;
  final dynamic jvmFiles;
  final dynamic jvmGarbageMarkSweepCount;
  final dynamic jvmGarbageMarkSweepTime;
  final dynamic jvmGarbageScavengeCount;
  final dynamic jvmScavengeTime;
  final dynamic jvmHeapCommited;
  final dynamic jvmHeapInit;
  final dynamic jvmHeapMax;
  final dynamic jvmHeapUsage;
  final dynamic jvmHeapUsed;
  final dynamic jvmNonHeapCommited;
  final dynamic jvmNonHeapInit;
  final dynamic jvmNonHeapMax;
  final dynamic jvmNonHeapUsage;
  final dynamic jvmNonHeapUsed;
  final dynamic jvmCodeCacheCommited;
  final dynamic jvmCodeCacheInit;
  final dynamic jvmCodeCacheMax;
  final dynamic jvmCodeCacheUsage;
  final dynamic jvmCodeCacheUsed;
  final dynamic jvmCompClassSpaceCommited;
  final dynamic jvmCompClassSpaceInit;
  final dynamic jvmCompClassSpaceMax;
  final dynamic jvmCompClassSpaceUsage;
  final dynamic jvmCompClassSpaceUsed;
  final dynamic jvmMetaspaceCommited;
  final dynamic jvmMetaspaceInit;
  final dynamic jvmMetaspaceMax;
  final dynamic jvmMetaspaceUsage;
  final dynamic jvmMetaspaceUsed;
  final dynamic jvmEdenSpaceCommited;
  final dynamic jvmEdenSpaceInit;
  final dynamic jvmEdenSpaceMax;
  final dynamic jvmEdenSpaceUsage;
  final dynamic jvmEdenSpaceUsed;
  final dynamic jvmEdenSpaceUsedAfterGc;
  final dynamic jvmOldGenCommited;
  final dynamic jvmOldGenInit;
  final dynamic jvmOldGenMax;
  final dynamic jvmOldGenUsage;
  final dynamic jvmOldGenUsed;
  final dynamic jvmOldGenUsedAfterGc;
  final dynamic jvmSurvivorCommited;
  final dynamic jvmSurvivorInit;
  final dynamic jvmSurvivorMax;
  final dynamic jvmSurvivorUsage;
  final dynamic jvmSurvivorUsed;
  final dynamic jvmSurvivorUseAfterGc;
  final dynamic jvmTotalCommited;
  final dynamic jvmTotalInit;
  final dynamic jvmTotalMax;
  final dynamic jvmTotalUsed;
  final dynamic jvmBlockedCount;
  final dynamic jvmThreadsCount;
  final dynamic jvmDaemonCount;
  final dynamic jvmDeadlockCount;
  final List jvmDeadlock;
  final dynamic jvmNewCount;
  final dynamic jvmRunnableCount;
  final dynamic jvmTerminatedCount;
  final dynamic jvmTimedWaitingCount;
  final dynamic jvmWaitingCount;

  const Gauges({
    this.activeConn,
    this.idleConn,
    this.maxConn,
    this.minConn,
    this.pendingConn,
    this.totalConn,
    this.jvmName,
    this.jvmUptime,
    this.jvmVendor,
    this.jvmCapacity,
    this.jvmDirectCount,
    this.jvmUsed,
    this.jvmMappedCapacity,
    this.jvmMappedCount,
    this.jvmMappedUsed,
    this.jvmFiles,
    this.jvmGarbageMarkSweepCount,
    this.jvmGarbageMarkSweepTime,
    this.jvmGarbageScavengeCount,
    this.jvmScavengeTime,
    this.jvmHeapCommited,
    this.jvmHeapInit,
    this.jvmHeapMax,
    this.jvmHeapUsage,
    this.jvmHeapUsed,
    this.jvmNonHeapCommited,
    this.jvmNonHeapInit,
    this.jvmNonHeapMax,
    this.jvmNonHeapUsage,
    this.jvmNonHeapUsed,
    this.jvmCodeCacheCommited,
    this.jvmCodeCacheInit,
    this.jvmCodeCacheMax,
    this.jvmCodeCacheUsage,
    this.jvmCodeCacheUsed,
    this.jvmCompClassSpaceCommited,
    this.jvmCompClassSpaceInit,
    this.jvmCompClassSpaceMax,
    this.jvmCompClassSpaceUsage,
    this.jvmCompClassSpaceUsed,
    this.jvmMetaspaceCommited,
    this.jvmMetaspaceInit,
    this.jvmMetaspaceMax,
    this.jvmMetaspaceUsage,
    this.jvmMetaspaceUsed,
    this.jvmEdenSpaceCommited,
    this.jvmEdenSpaceInit,
    this.jvmEdenSpaceMax,
    this.jvmEdenSpaceUsage,
    this.jvmEdenSpaceUsed,
    this.jvmEdenSpaceUsedAfterGc,
    this.jvmOldGenCommited,
    this.jvmOldGenInit,
    this.jvmOldGenMax,
    this.jvmOldGenUsage,
    this.jvmOldGenUsed,
    this.jvmOldGenUsedAfterGc,
    this.jvmSurvivorCommited,
    this.jvmSurvivorInit,
    this.jvmSurvivorMax,
    this.jvmSurvivorUsage,
    this.jvmSurvivorUsed,
    this.jvmSurvivorUseAfterGc,
    this.jvmTotalCommited,
    this.jvmTotalInit,
    this.jvmTotalMax,
    this.jvmTotalUsed,
    this.jvmBlockedCount,
    this.jvmThreadsCount,
    this.jvmDaemonCount,
    this.jvmDeadlockCount,
    this.jvmDeadlock,
    this.jvmNewCount,
    this.jvmRunnableCount,
    this.jvmTerminatedCount,
    this.jvmTimedWaitingCount,
    this.jvmWaitingCount
  }) : assert(activeConn != null),
  assert(idleConn != null),
  assert(maxConn != null),
  assert(minConn != null),
  assert(pendingConn != null),
  assert(totalConn != null),
  assert(jvmName != null),
  assert(jvmUptime != null),
  assert(jvmVendor  != null),
  assert(jvmCapacity != null),
  assert(jvmDirectCount != null),
  assert(jvmUsed != null),
  assert(jvmMappedCapacity != null),
  assert(jvmMappedCount != null),
  assert(jvmMappedUsed != null),
  assert(jvmFiles != null),
  assert(jvmGarbageMarkSweepCount != null),
  assert(jvmGarbageMarkSweepTime != null),
  assert(jvmGarbageScavengeCount != null),
  assert(jvmScavengeTime != null),
  assert(jvmHeapCommited != null),
  assert(jvmHeapInit != null),
  assert(jvmHeapMax != null),
  assert(jvmHeapUsage != null),
  assert(jvmHeapUsed != null),
  assert(jvmNonHeapCommited != null),
  assert(jvmNonHeapInit != null),
  assert(jvmNonHeapMax != null),
  assert(jvmNonHeapUsage != null),
  assert(jvmNonHeapUsed != null),
  assert(jvmCodeCacheCommited != null),
  assert(jvmCodeCacheInit != null),
  assert(jvmCodeCacheMax != null),
  assert(jvmCodeCacheUsage != null),
  assert(jvmCodeCacheUsed != null),
  assert(jvmCompClassSpaceCommited != null),
  assert(jvmCompClassSpaceInit != null),
  assert(jvmCompClassSpaceMax != null),
  assert(jvmCompClassSpaceUsage != null),
  assert(jvmCompClassSpaceUsed != null),
  assert(jvmMetaspaceCommited != null),
  assert(jvmMetaspaceInit != null),
  assert(jvmMetaspaceMax != null),
  assert(jvmMetaspaceUsage != null),
  assert(jvmMetaspaceUsed != null),
  assert(jvmEdenSpaceCommited != null),
  assert(jvmEdenSpaceInit != null),
  assert(jvmEdenSpaceMax != null),
  assert(jvmEdenSpaceUsage != null),
  assert(jvmEdenSpaceUsed != null),
  assert(jvmEdenSpaceUsedAfterGc != null),
  assert(jvmOldGenCommited != null),
  assert(jvmOldGenInit != null),
  assert(jvmOldGenMax != null),
  assert(jvmOldGenUsage != null),
  assert(jvmOldGenUsed != null),
  assert(jvmOldGenUsedAfterGc != null),
  assert(jvmSurvivorCommited != null),
  assert(jvmSurvivorInit != null),
  assert(jvmSurvivorMax != null),
  assert(jvmSurvivorUsage != null),
  assert(jvmSurvivorUsed != null),
  assert(jvmSurvivorUseAfterGc != null),
  assert(jvmTotalCommited != null),
  assert(jvmTotalInit != null),
  assert(jvmTotalMax != null),
  assert(jvmTotalUsed != null),
  assert(jvmBlockedCount != null),
  assert(jvmThreadsCount != null),
  assert(jvmDaemonCount != null),
  assert(jvmDeadlockCount != null),
  assert(jvmDeadlock != null),
  assert(jvmNewCount != null),
  assert(jvmRunnableCount != null),
  assert(jvmTerminatedCount != null),
  assert(jvmTimedWaitingCount != null),
  assert(jvmWaitingCount != null);

  factory Gauges.fromJson(Map<String, dynamic> json) {
    return Gauges(
      activeConn: json['HikariPool-2.pool.ActiveConnections']['value'],
      idleConn: json['HikariPool-2.pool.IdleConnections']['value'],
        maxConn: json['HikariPool-2.pool.MaxConnections']['value'],
        minConn: json['HikariPool-2.pool.MinConnections']['value'],
       pendingConn: json['HikariPool-2.pool.PendingConnections']['value'],
       totalConn: json['HikariPool-2.pool.TotalConnections']['value'],
       jvmName: json['jvm.attributes.name']['value'],
       jvmUptime: json['jvm.attributes.uptime']['value'],
       jvmVendor: json['jvm.attributes.vendor']['value'],
       jvmCapacity: json['jvm.buffers.direct.capacity']['value'],
       jvmDirectCount: json['jvm.buffers.direct.count']['value'],
       jvmUsed: json['jvm.buffers.direct.used']['value'],
       jvmMappedCapacity: json['jvm.buffers.mapped.capacity']['value'],
       jvmMappedCount: json['jvm.buffers.mapped.count']['value'],
       jvmMappedUsed: json['jvm.buffers.mapped.used']['value'],
       jvmFiles: json['jvm.files']['value'],
       jvmGarbageMarkSweepCount: json['jvm.garbage.PS-MarkSweep.count']['value'],
       jvmGarbageMarkSweepTime: json['jvm.garbage.PS-MarkSweep.time']['value'],
       jvmGarbageScavengeCount: json['jvm.garbage.PS-Scavenge.count']['value'],
       jvmScavengeTime: json['jvm.garbage.PS-Scavenge.time']['value'],
       jvmHeapCommited: json['jvm.memory.heap.committed']['value'],
       jvmHeapInit: json['jvm.memory.heap.init']['value'],
       jvmHeapMax: json['jvm.memory.heap.max']['value'],
       jvmHeapUsage: json['jvm.memory.heap.usage']['value'],
       jvmHeapUsed: json['jvm.memory.heap.used']['value'],
       jvmNonHeapCommited: json['jvm.memory.non-heap.committed']['value'],
      jvmNonHeapInit: json['jvm.memory.non-heap.init']['value'],
       jvmNonHeapMax: json['jvm.memory.non-heap.max']['value'],
       jvmNonHeapUsage: json['jvm.memory.non-heap.usage']['value'],
       jvmNonHeapUsed: json['jvm.memory.non-heap.used']['value'],
       jvmCodeCacheCommited: json['jvm.memory.pools.Code-Cache.committed']['value'],
       jvmCodeCacheInit: json['jvm.memory.pools.Code-Cache.init']['value'],
       jvmCodeCacheMax: json['jvm.memory.pools.Code-Cache.max']['value'],
       jvmCodeCacheUsage: json['jvm.memory.pools.Code-Cache.usage']['value'],
       jvmCodeCacheUsed: json['jvm.memory.pools.Code-Cache.used']['value'],
       jvmCompClassSpaceCommited: json['jvm.memory.pools.Compressed-Class-Space.committed']['value'],
      jvmCompClassSpaceInit: json['jvm.memory.pools.Compressed-Class-Space.init']['value'],
      jvmCompClassSpaceMax: json['jvm.memory.pools.Compressed-Class-Space.max']['value'],
      jvmCompClassSpaceUsage: json['jvm.memory.pools.Compressed-Class-Space.usage']['value'],
      jvmCompClassSpaceUsed: json['jvm.memory.pools.Compressed-Class-Space.used']['value'],
       jvmMetaspaceCommited: json['jvm.memory.pools.Metaspace.committed']['value'],
      jvmMetaspaceInit: json['jvm.memory.pools.Metaspace.init']['value'],
      jvmMetaspaceMax: json['jvm.memory.pools.Metaspace.max']['value'],
      jvmMetaspaceUsage: json['jvm.memory.pools.Metaspace.usage']['value'],
      jvmMetaspaceUsed: json['jvm.memory.pools.Metaspace.used']['value'],
       jvmEdenSpaceCommited: json['jvm.memory.pools.PS-Eden-Space.committed']['value'],
      jvmEdenSpaceInit: json['jvm.memory.pools.PS-Eden-Space.init']['value'],
      jvmEdenSpaceMax: json['jvm.memory.pools.PS-Eden-Space.max']['value'],
      jvmEdenSpaceUsage: json['jvm.memory.pools.PS-Eden-Space.usage']['value'],
      jvmEdenSpaceUsed: json['jvm.memory.pools.PS-Eden-Space.used']['value'],
      jvmEdenSpaceUsedAfterGc: json['jvm.memory.pools.PS-Eden-Space.used-after-gc']['value'],
      jvmOldGenCommited: json['jvm.memory.pools.PS-Old-Gen.committed']['value'],
      jvmOldGenInit: json['jvm.memory.pools.PS-Old-Gen.init']['value'],
      jvmOldGenMax: json['jvm.memory.pools.PS-Old-Gen.max']['value'],
      jvmOldGenUsage: json['jvm.memory.pools.PS-Old-Gen.usage']['value'],
      jvmOldGenUsed: json['jvm.memory.pools.PS-Old-Gen.used']['value'],
      jvmOldGenUsedAfterGc: json['jvm.memory.pools.PS-Old-Gen.used-after-gc']['value'],
      jvmSurvivorCommited: json['jvm.memory.pools.PS-Survivor-Space.committed']['value'],
      jvmSurvivorInit: json['jvm.memory.pools.PS-Survivor-Space.init']['value'],
      jvmSurvivorMax: json['jvm.memory.pools.PS-Survivor-Space.max']['value'],
      jvmSurvivorUsage: json['jvm.memory.pools.PS-Survivor-Space.usage']['value'],
      jvmSurvivorUsed: json['jvm.memory.pools.PS-Survivor-Space.used']['value'],
      jvmSurvivorUseAfterGc: json['jvm.memory.pools.PS-Survivor-Space.used-after-gc']['value'],
       jvmTotalCommited: json['jvm.memory.total.committed']['value'],
      jvmTotalInit: json['jvm.memory.total.init']['value'],
      jvmTotalMax: json['jvm.memory.total.max']['value'],
      jvmTotalUsed: json['jvm.memory.total.used']['value'],
       jvmBlockedCount: json['jvm.threads.blocked.count']['value'],
       jvmThreadsCount: json['jvm.threads.count']['value'],
       jvmDaemonCount: json['jvm.threads.daemon.count']['value'],
       jvmDeadlockCount: json['jvm.threads.deadlock.count']['value'],
       jvmDeadlock: json['jvm.threads.deadlocks']['value'],
       jvmNewCount: json['jvm.threads.new.count']['value'],
       jvmRunnableCount: json['jvm.threads.runnable.count']['value'],
       jvmTerminatedCount: json['jvm.threads.terminated.count']['value'],
      jvmTimedWaitingCount: json['jvm.threads.timed_waiting.count']['value'],
       jvmWaitingCount: json['jvm.threads.waiting.count']['value']
    );
  }
}

class Counters {

  final dynamic count;

  const Counters({
    @required this.count,
  })  : assert(count != null);


  factory Counters.fromJson(Map<String, dynamic> json) {
    return Counters(
        count: json['com.codahale.metrics.servlet.InstrumentedFilter.activeRequests']['count']
    );
  }
}


class Histograms {

  final Histogram connection;
  final Histogram usage;

  const Histograms({
    @required this.connection,
    @required this.usage,
  })  : assert(connection != null),
        assert(usage != null);


  factory Histograms.fromJson(Map<String, dynamic> json) {
    return Histograms(
        connection: Histogram.fromJson(json['HikariPool-2.pool.ConnectionCreation']),
        usage: Histogram.fromJson(json['HikariPool-2.pool.Usage'])
    );
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

  const Histogram({
    @required this.count,
    @required this.max,
    @required this.mean,
    @required this.min,
    @required this.p50,
    @required this.p75,
    @required this.p95,
    @required this.p98,
    @required this.p99,
    @required this.p999,
    @required this.stddev
  })  : assert(count != null),
assert(count!= null),
assert(max!= null),
assert(mean!= null),
assert(min!= null),
assert(p50!= null),
assert(p75!= null),
assert(p95!= null),
assert(p98!= null),
assert(p99!= null),
assert(p999!= null),
assert(stddev!= null);

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
        stddev: json['stddev']
    );
  }
}



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
    @required this.connTimeoutRate,
    @required this.errors,
    @required this.badRequest,
    @required this.created,
    @required this.noContent,
    @required this.notFound,
    @required this.ok,
    @required this.other,
    @required this.serverError,
    @required this.timeouts,
  })  : assert(connTimeoutRate != null),
 assert(errors!= null),
 assert(badRequest!= null),
 assert(created!= null),
 assert(noContent!= null),
 assert(notFound!= null),
 assert(ok!= null),
 assert(other!= null),
 assert(serverError!= null),
 assert(timeouts!= null);

  factory Meters.fromJson(Map<String, dynamic> json) {
    return Meters(
        connTimeoutRate: Meter.fromJson(json['HikariPool-2.pool.ConnectionTimeoutRate']),
        errors: Meter.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.errors']),
        badRequest: Meter.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.badRequest']),
        created: Meter.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.created']),
        noContent: Meter.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.noContent']),
        notFound: Meter.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.notFound']),
        ok: Meter.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.ok']),
        other: Meter.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.other']),
        serverError: Meter.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.serverError']),
        timeouts: Meter.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.timeouts']),
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

  const Meter({
    @required this.count,
    @required this.m15,
    @required this.m1,
    @required this.m5,
    @required this.mean,
    @required this.units
  })  : assert(count != null),
  assert(m15!= null),
  assert(m1!= null),
  assert(m5!= null),
  assert(mean!= null),
  assert(units != null);

  factory Meter.fromJson(Map<String, dynamic> json) {
    return Meter(
        count: json['count'],
        m15: json['m15_rate'],
        m1: json['m1_rate'],
        m5: json['m5_rate'],
        mean: json['mean_rate'],
        units: json['units']
    );
  }
}


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

  const Timers({
    @required this.wait,
    @required this.request,
    @required this.activateAccount,
    @required this.changePass,
    @required this.finishPass,
    @required this.getAccount,
    @required this.isAuth,
    @required this.registerAccount,
    @required this.reqPassReset,
    @required this.saveAccount,
    @required this.changeLevel,
    @required this.getList,
    @required this.authorize,
    @required this.createUser,
    @required this.deleteUser,
    @required this.getAllUser,
    @required this.getAuth,
    @required this.getUser,
    @required this.updateUser
  })  : assert(wait != null),
  assert(request != null),
  assert(activateAccount != null),
  assert(changePass != null),
  assert(finishPass != null),
  assert(getAccount != null),
  assert(isAuth != null),
  assert(registerAccount != null),
  assert(reqPassReset != null),
  assert(saveAccount != null),
  assert(changeLevel != null),
  assert(getList != null),
  assert(authorize != null),
  assert(createUser != null),
  assert(deleteUser != null),
  assert(getAllUser != null),
  assert(getAuth != null),
  assert(getUser != null),
  assert(updateUser != null);

  factory Timers.fromJson(Map<String, dynamic> json) {
    return Timers(
        wait: Timer.fromJson(json['HikariPool-2.pool.Wait']),
        request: Timer.fromJson(json['com.codahale.metrics.servlet.InstrumentedFilter.requests']),
        activateAccount: Timer.fromJson(json['com.mycompany.myapp.web.rest.AccountResource.activateAccount']),
        changePass: Timer.fromJson(json['com.mycompany.myapp.web.rest.AccountResource.changePassword']),
        finishPass: Timer.fromJson(json['com.mycompany.myapp.web.rest.AccountResource.finishPasswordReset']),
        getAccount: Timer.fromJson(json['com.mycompany.myapp.web.rest.AccountResource.getAccount']),
        isAuth: Timer.fromJson(json['com.mycompany.myapp.web.rest.AccountResource.isAuthenticated']),
        registerAccount: Timer.fromJson(json['com.mycompany.myapp.web.rest.AccountResource.registerAccount']),
        reqPassReset: Timer.fromJson(json['com.mycompany.myapp.web.rest.AccountResource.requestPasswordReset']),
        saveAccount: Timer.fromJson(json['com.mycompany.myapp.web.rest.AccountResource.saveAccount']),
        changeLevel: Timer.fromJson(json['com.mycompany.myapp.web.rest.LogsResource.changeLevel']),
        getList: Timer.fromJson(json['com.mycompany.myapp.web.rest.LogsResource.getList']),
        authorize: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserJWTController.authorize']),
        createUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.createUser']),
        deleteUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.deleteUser']),
        getAllUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.getAllUsers']),
        getAuth: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.getAuthorities']),
        getUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.getUser']),
        updateUser: Timer.fromJson(json['com.mycompany.myapp.web.rest.UserResource.updateUser'])
    );
  }
}

class Timer{

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

  const Timer({
    @required this.count,
    @required this.max,
    @required this.mean,
    @required this.min,
    @required this.p50,
    @required this.p75,
    @required this.p95,
    @required this.p98,
    @required this.p99,
    @required this.p999,
    @required this.stddev,
    @required this.m15Rate,
    @required this.m1Rate,
    @required this.m5Rate,
    @required this.meanRate,
    @required this.durationUnits,
    @required this.rateUnits
  })  : assert(count != null),
  assert(max != null),
  assert(mean != null),
  assert(min != null),
  assert(p50 != null),
  assert(p75 != null),
  assert(p95 != null),
  assert(p98 != null),
  assert(p99 != null),
  assert(p999 != null),
  assert(stddev != null),
  assert(m15Rate != null),
  assert(m1Rate != null),
  assert(m5Rate != null),
  assert(meanRate != null),
  assert(durationUnits != null),
  assert(rateUnits != null);

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
        rateUnits: json['rate_units']
    );
  }
}