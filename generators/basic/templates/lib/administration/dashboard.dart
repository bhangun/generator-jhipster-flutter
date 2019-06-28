import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:charts_flutter/flutter.dart';
import '../services/common.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Dashboard"),
      ),
      body: FutureBuilder(
          future: health(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? _viewHealth(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            health();
        },
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      )
    );
  }

  _viewHealth(String data) {
    print("+++++++++++>"+data);
    var parsed =json.decode(data).cast<Map<String, dynamic>>();
    Health health= parsed.map<Health>((json) => Health.fromJson(json));//.toList();


    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: new SliverGrid.count(
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: <Widget>[
               Text('He\'d have you all unravel at the'),
               Text(health.gauges.jvmCapacity.value),
               Text('Sound of screams but the'),
               Text('Who scream'),
               Text('Revolution is coming...'),
               Text('Revolution, they...'),
            ],
          ),
        ),
      ],
    );
  }
}


class Data {
  final int min;
  final int max;

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
        gauges: json['gauges'],
        counters: json['counters'],
        histograms: json['histograms'],
        meters: json['meters'],
        timers: json['timers']
    );
  }
}

class Value {

  final String value;

  const Value({
    @required this.value,
  })  : assert(value != null);


  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
        value: json['value']
    );
  }
}


class Gauges {
  final Value activeConn;
  final Value idleConn;
  final Value maxConn;
  final Value minConn;
  final Value pendingConn;
  final Value totalConn;
  final Value jvmName;
  final Value jvmUptime;
  final Value jvmVendor;
  final Value jvmCapacity;
  final Value jvmDirectCount;
  final Value jvmUsed;
  final Value jvmMappedCapacity;
  final Value jvmMappedCount;
  final Value jvmMappedUsed;
  final Value jvmFiles;
  final Value jvmGarbageMarkSweepCount;
  final Value jvmGarbageMarkSweepTime;
  final Value jvmGarbageScavengeCount;
  final Value jvmScavengeTime;
  final Value jvmHeapCommited;
  final Value jvmHeapInit;
  final Value jvmHeapMax;
  final Value jvmHeapUsage;
  final Value jvmHeapUsed;
  final Value jvmNonHeapCommited;
  final Value jvmNonHeapInit;
  final Value jvmNonHeapMax;
  final Value jvmNonHeapUsage;
  final Value jvmNonHeapUsed;
  final Value jvmCodeCacheCommited;
  final Value jvmCodeCacheInit;
  final Value jvmCodeCacheMax;
  final Value jvmCodeCacheUsage;
  final Value jvmCodeCacheUsed;
  final Value jvmCompClassSpaceCommited;
  final Value jvmCompClassSpaceInit;
  final Value jvmCompClassSpaceMax;
  final Value jvmCompClassSpaceUsage;
  final Value jvmCompClassSpaceUsed;
  final Value jvmMetaspaceCommited;
  final Value jvmMetaspaceInit;
  final Value jvmMetaspaceMax;
  final Value jvmMetaspaceUsage;
  final Value jvmMetaspaceUsed;
  final Value jvmEdenSpaceCommited;
  final Value jvmEdenSpaceInit;
  final Value jvmEdenSpaceMax;
  final Value jvmEdenSpaceUsage;
  final Value jvmEdenSpaceUsed;
  final Value jvmEdenSpaceUsedAfterGc;
  final Value jvmOldGenCommited;
  final Value jvmOldGenInit;
  final Value jvmOldGenMax;
  final Value jvmOldGenUsage;
  final Value jvmOldGenUsed;
  final Value jvmOldGenUsedAfterGc;
  final Value jvmSurvivorCommited;
  final Value jvmSurvivorInit;
  final Value jvmSurvivorMax;
  final Value jvmSurvivorUsage;
  final Value jvmSurvivorUsed;
  final Value jvmSurvivorUseAfterGc;
  final Value jvmTotalCommited;
  final Value jvmTotalInit;
  final Value jvmTotalMax;
  final Value jvmTotalUsed;
  final Value jvmBlockedCount;
  final Value jvmThreadsCount;
  final Value jvmDaemonCount;
  final Value jvmDeadlockCount;
  final Value jvmDeadlock;
  final Value jvmNewCount;
  final Value jvmRunnableCount;
  final Value jvmTerminatedCount;
  final Value jvmTimedWaitingCount;
  final Value jvmWaitingCount;

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
      activeConn: json['HikariPool-1.pool.ActiveConnections'],
      idleConn: json['HikariPool-1.pool.IdleConnections'],
        maxConn: json['HikariPool-1.pool.MaxConnections'],
        minConn: json['HikariPool-1.pool.MinConnections'],
       pendingConn: json['HikariPool-1.pool.PendingConnections'],
       totalConn: json['HikariPool-1.pool.TotalConnections'],
       jvmName: json['jvm.attributes.name'],
       jvmUptime: json['jvm.attributes.uptime'],
       jvmVendor: json['jvm.attributes.vendor'],
       jvmCapacity: json['jvm.buffers.direct.capacity'],
       jvmDirectCount: json['jvm.buffers.direct.count'],
       jvmUsed: json['jvm.buffers.direct.used'],
       jvmMappedCapacity: json['jvm.buffers.mapped.capacity'],
       jvmMappedCount: json['jvm.buffers.mapped.count'],
       jvmMappedUsed: json['jvm.buffers.mapped.used'],
       jvmFiles: json['jvm.files'],
       jvmGarbageMarkSweepCount: json['jvm.garbage.PS-MarkSweep.count'],
       jvmGarbageMarkSweepTime: json['jvm.garbage.PS-MarkSweep.time'],
       jvmGarbageScavengeCount: json['jvm.garbage.PS-Scavenge.count'],
       jvmScavengeTime: json['jvm.garbage.PS-Scavenge.time'],
       jvmHeapCommited: json['jvm.memory.heap.committed'],
       jvmHeapInit: json['jvm.memory.heap.init'],
       jvmHeapMax: json['jvm.memory.heap.max'],
       jvmHeapUsage: json['jvm.memory.heap.usage'],
       jvmHeapUsed: json['jvm.memory.heap.used'],
       jvmNonHeapCommited: json['jvm.memory.non-heap.committed'],
      jvmNonHeapInit: json['jvm.memory.non-heap.init'],
       jvmNonHeapMax: json['jvm.memory.non-heap.max'],
       jvmNonHeapUsage: json['jvm.memory.non-heap.usage'],
       jvmNonHeapUsed: json['jvm.memory.non-heap.used'],
       jvmCodeCacheCommited: json['jvm.memory.pools.Code-Cache.committed'],
       jvmCodeCacheInit: json['jvm.memory.pools.Code-Cache.init'],
       jvmCodeCacheMax: json['jvm.memory.pools.Code-Cache.max'],
       jvmCodeCacheUsage: json['jvm.memory.pools.Code-Cache.usage'],
       jvmCodeCacheUsed: json['jvm.memory.pools.Code-Cache.used'],
       jvmCompClassSpaceCommited: json['jvm.memory.pools.Compressed-Class-Space.committed'],
      jvmCompClassSpaceInit: json['jvm.memory.pools.Compressed-Class-Space.init'],
      jvmCompClassSpaceMax: json['jvm.memory.pools.Compressed-Class-Space.max'],
      jvmCompClassSpaceUsage: json['jvm.memory.pools.Compressed-Class-Space.usage'],
      jvmCompClassSpaceUsed: json['jvm.memory.pools.Compressed-Class-Space.used'],
       jvmMetaspaceCommited: json['jvm.memory.pools.Metaspace.committed'],
      jvmMetaspaceInit: json['jvm.memory.pools.Metaspace.init'],
      jvmMetaspaceMax: json['jvm.memory.pools.Metaspace.max'],
      jvmMetaspaceUsage: json['jvm.memory.pools.Metaspace.usage'],
      jvmMetaspaceUsed: json['jvm.memory.pools.Metaspace.used'],
       jvmEdenSpaceCommited: json['jvm.memory.pools.PS-Eden-Space.committed'],
      jvmEdenSpaceInit: json['jvm.memory.pools.PS-Eden-Space.init'],
      jvmEdenSpaceMax: json['jvm.memory.pools.PS-Eden-Space.max'],
      jvmEdenSpaceUsage: json['jvm.memory.pools.PS-Eden-Space.usage'],
      jvmEdenSpaceUsed: json['jvm.memory.pools.PS-Eden-Space.used'],
      jvmEdenSpaceUsedAfterGc: json['jvm.memory.pools.PS-Eden-Space.used-after-gc'],
      jvmOldGenCommited: json['jvm.memory.pools.PS-Old-Gen.committed'],
      jvmOldGenInit: json['jvm.memory.pools.PS-Old-Gen.init'],
      jvmOldGenMax: json['jvm.memory.pools.PS-Old-Gen.max'],
      jvmOldGenUsage: json['jvm.memory.pools.PS-Old-Gen.usage'],
      jvmOldGenUsed: json['jvm.memory.pools.PS-Old-Gen.used'],
      jvmOldGenUsedAfterGc: json['jvm.memory.pools.PS-Old-Gen.used-after-gc'],
      jvmSurvivorCommited: json['jvm.memory.pools.PS-Survivor-Space.committed'],
      jvmSurvivorInit: json['jvm.memory.pools.PS-Survivor-Space.init'],
      jvmSurvivorMax: json['jvm.memory.pools.PS-Survivor-Space.max'],
      jvmSurvivorUsage: json['jvm.memory.pools.PS-Survivor-Space.usage'],
      jvmSurvivorUsed: json['jvm.memory.pools.PS-Survivor-Space.used'],
      jvmSurvivorUseAfterGc: json['jvm.memory.pools.PS-Survivor-Space.used-after-gc'],
       jvmTotalCommited: json['jvm.memory.total.committed'],
      jvmTotalInit: json['jvm.memory.total.init'],
      jvmTotalMax: json['jvm.memory.total.max'],
      jvmTotalUsed: json['jvm.memory.total.used'],
       jvmBlockedCount: json['jvm.threads.blocked.count'],
       jvmThreadsCount: json['jvm.threads.count'],
       jvmDaemonCount: json['jvm.threads.daemon.count'],
       jvmDeadlockCount: json['jvm.threads.deadlock.count'],
       jvmDeadlock: json['jvm.threads.deadlocks'],
       jvmNewCount: json['jvm.threads.new.count'],
       jvmRunnableCount: json['jvm.threads.runnable.count'],
       jvmTerminatedCount: json['jvm.threads.terminated.count'],
      jvmTimedWaitingCount: json['jvm.threads.timed_waiting.count'],
       jvmWaitingCount: json['jvm.threads.waiting.count']
    );
  }
}

class Counters {

  final Count count;

  const Counters({
    @required this.count,
  })  : assert(count != null);


  factory Counters.fromJson(Map<String, dynamic> json) {
    return Counters(
        count: json['com.codahale.metrics.servlet.InstrumentedFilter.activeRequests']
    );
  }
}

class Count {

  final String count;

  const Count({
    @required this.count,
  })  : assert(count != null);


  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(
        count: json['count']
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
        connection: json['HikariPool-1.pool.ConnectionCreation'],
        usage: json['HikariPool-1.pool.Usage']
    );
  }
}

// Histogram
class Histogram {

final String count;
final String max;
final String mean;
final String min;
final String p50;
final String p75;
final String p95;
final String p98;
final String p99;
final String p999;
final String stddev;

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
        stddev: json['stdv']
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
        connTimeoutRate: json['HikariPool-1.pool.ConnectionTimeoutRate'],
        errors: json['com.codahale.metrics.servlet.InstrumentedFilter.errors'],
        badRequest: json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.badRequest'],
        created: json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.created'],
        noContent: json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.noContent'],
        notFound: json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.notFound'],
        ok: json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.ok'],
        other: json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.other'],
        serverError: json['com.codahale.metrics.servlet.InstrumentedFilter.responseCodes.serverError'],
        timeouts: json['com.codahale.metrics.servlet.InstrumentedFilter.timeouts'],
    );
  }
}


class Meter {

  final String count;
final String m15;
final String m1;
final String m5;
final String mean;
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
        wait: json['HikariPool-1.pool.Wait'],
        request: json['com.codahale.metrics.servlet.InstrumentedFilter.requests'],
        activateAccount: json['com.mycompany.myapp.web.rest.AccountResource.activateAccount'],
        changePass: json['com.mycompany.myapp.web.rest.AccountResource.changePassword'],
        finishPass: json['com.mycompany.myapp.web.rest.AccountResource.finishPasswordReset'],
        getAccount: json['com.mycompany.myapp.web.rest.AccountResource.getAccount'],
        isAuth: json['com.mycompany.myapp.web.rest.AccountResource.isAuthenticated'],
        registerAccount: json['com.mycompany.myapp.web.rest.AccountResource.registerAccount'],
        reqPassReset: json['com.mycompany.myapp.web.rest.AccountResource.requestPasswordReset'],
        saveAccount: json['com.mycompany.myapp.web.rest.AccountResource.saveAccount'],
        changeLevel: json['com.mycompany.myapp.web.rest.LogsResource.changeLevel'],
        getList: json['com.mycompany.myapp.web.rest.LogsResource.getList'],
        authorize: json['com.mycompany.myapp.web.rest.UserJWTController.authorize'],
        createUser: json['com.mycompany.myapp.web.rest.UserResource.createUser'],
        deleteUser: json['com.mycompany.myapp.web.rest.UserResource.deleteUser'],
        getAllUser: json['com.mycompany.myapp.web.rest.UserResource.getAllUsers'],
        getAuth: json['com.mycompany.myapp.web.rest.UserResource.getAuthorities'],
        getUser: json['com.mycompany.myapp.web.rest.UserResource.getUser'],
        updateUser: json['com.mycompany.myapp.web.rest.UserResource.updateUser']
    );
  }
}

class Timer{

  final String count;
  final String max;
  final String mean;
  final String min;
  final String p50;
  final String p75;
  final String p95;
  final String p98;
  final String p99;
  final String p999;
  final String stddev;
  final String m15_rate;
  final String m1_rate;
  final String m5_rate;
  final String mean_rate;
  final String duration_units;
  final String rate_units;

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
    @required this.m15_rate,
    @required this.m1_rate,
    @required this.m5_rate,
    @required this.mean_rate,
    @required this.duration_units,
    @required this.rate_units
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
  assert(m15_rate != null),
  assert(m1_rate != null),
  assert(m5_rate != null),
  assert(mean_rate != null),
  assert(duration_units != null),
  assert(rate_units != null);

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
        m15_rate: json['m15_rate'],
        m1_rate: json['m1_rate'],
        m5_rate: json['m5_rate'],
        mean_rate: json['mean_rate'],
        duration_units: json['duration_units'],
        rate_units: json['rate_units']
    );
  }
}
