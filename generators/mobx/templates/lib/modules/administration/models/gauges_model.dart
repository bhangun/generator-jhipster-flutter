
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

  const Gauges(
      {this.activeConn,
      this.idleConn,
      this.maxConn,
      this.minConn,
      this.pendingConn,
      this.totalConn,
      required this.jvmName,
      this.jvmUptime,
      required this.jvmVendor,
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
      required this.jvmDeadlock,
      this.jvmNewCount,
      this.jvmRunnableCount,
      this.jvmTerminatedCount,
      this.jvmTimedWaitingCount,
      this.jvmWaitingCount})
     ;

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
        jvmGarbageMarkSweepCount: json['jvm.garbage.PS-MarkSweep.count']
            ['value'],
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
        jvmCodeCacheCommited: json['jvm.memory.pools.Code-Cache.committed']
            ['value'],
        jvmCodeCacheInit: json['jvm.memory.pools.Code-Cache.init']['value'],
        jvmCodeCacheMax: json['jvm.memory.pools.Code-Cache.max']['value'],
        jvmCodeCacheUsage: json['jvm.memory.pools.Code-Cache.usage']['value'],
        jvmCodeCacheUsed: json['jvm.memory.pools.Code-Cache.used']['value'],
        jvmCompClassSpaceCommited:
            json['jvm.memory.pools.Compressed-Class-Space.committed']['value'],
        jvmCompClassSpaceInit:
            json['jvm.memory.pools.Compressed-Class-Space.init']['value'],
        jvmCompClassSpaceMax:
            json['jvm.memory.pools.Compressed-Class-Space.max']['value'],
        jvmCompClassSpaceUsage:
            json['jvm.memory.pools.Compressed-Class-Space.usage']['value'],
        jvmCompClassSpaceUsed:
            json['jvm.memory.pools.Compressed-Class-Space.used']['value'],
        jvmMetaspaceCommited: json['jvm.memory.pools.Metaspace.committed']
            ['value'],
        jvmMetaspaceInit: json['jvm.memory.pools.Metaspace.init']['value'],
        jvmMetaspaceMax: json['jvm.memory.pools.Metaspace.max']['value'],
        jvmMetaspaceUsage: json['jvm.memory.pools.Metaspace.usage']['value'],
        jvmMetaspaceUsed: json['jvm.memory.pools.Metaspace.used']['value'],
        jvmEdenSpaceCommited: json['jvm.memory.pools.PS-Eden-Space.committed']
            ['value'],
        jvmEdenSpaceInit: json['jvm.memory.pools.PS-Eden-Space.init']['value'],
        jvmEdenSpaceMax: json['jvm.memory.pools.PS-Eden-Space.max']['value'],
        jvmEdenSpaceUsage: json['jvm.memory.pools.PS-Eden-Space.usage']
            ['value'],
        jvmEdenSpaceUsed: json['jvm.memory.pools.PS-Eden-Space.used']['value'],
        jvmEdenSpaceUsedAfterGc:
            json['jvm.memory.pools.PS-Eden-Space.used-after-gc']['value'],
        jvmOldGenCommited: json['jvm.memory.pools.PS-Old-Gen.committed']
            ['value'],
        jvmOldGenInit: json['jvm.memory.pools.PS-Old-Gen.init']['value'],
        jvmOldGenMax: json['jvm.memory.pools.PS-Old-Gen.max']['value'],
        jvmOldGenUsage: json['jvm.memory.pools.PS-Old-Gen.usage']['value'],
        jvmOldGenUsed: json['jvm.memory.pools.PS-Old-Gen.used']['value'],
        jvmOldGenUsedAfterGc: json['jvm.memory.pools.PS-Old-Gen.used-after-gc']
            ['value'],
        jvmSurvivorCommited:
            json['jvm.memory.pools.PS-Survivor-Space.committed']['value'],
        jvmSurvivorInit: json['jvm.memory.pools.PS-Survivor-Space.init']
            ['value'],
        jvmSurvivorMax: json['jvm.memory.pools.PS-Survivor-Space.max']['value'],
        jvmSurvivorUsage: json['jvm.memory.pools.PS-Survivor-Space.usage']
            ['value'],
        jvmSurvivorUsed: json['jvm.memory.pools.PS-Survivor-Space.used']
            ['value'],
        jvmSurvivorUseAfterGc:
            json['jvm.memory.pools.PS-Survivor-Space.used-after-gc']['value'],
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
        jvmWaitingCount: json['jvm.threads.waiting.count']['value']);
  }
}