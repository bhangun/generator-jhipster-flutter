import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:jh_flutter_sample/models/metrics.dart';
import 'package:jh_flutter_sample/pages/administration/gauges.dart';
import 'package:jh_flutter_sample/services/common.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
//print(">>>>>>>>"+snapshot.hasData.toString());
       
            return snapshot.hasData ? _viewHealth(snapshot.data)
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

  _viewHealth(Health health) {
    //if (data is Health)
 List<charts.Series> seriesList = <charts.Series>[
   Series(data: [10], domainFn: (datum, int index) {}, id: null, measureFn: (datum, int index) {})
 ]; 
 var data = [
  new ClicksPerYear('2016', 12,Color.black),
  new ClicksPerYear('2017', 42, Color.black),
  new ClicksPerYear('2018', 23, Color.black),
];
 var series = [
  new charts.Series(
    id: 'Clicks',
    domainFn: (ClicksPerYear clickData, _) => clickData.year,
    measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
    colorFn: (ClicksPerYear clickData, _) => clickData.color,
    data: data,
  ),
]; 

    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: new SliverGrid.count(
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: <Widget>[
               Text(health.histograms.connection.max.toString()),
              // Text(health.gauges.jvmCapacity.value),
               Text(health.counters.count.toString()),
               Text(health.gauges.jvmTotalMax.toString()),
               Text(health.timers.getAuth.max.toString()),
               Text(health.meters.connTimeoutRate.m1.toString()),
              // GaugeChart(seriesList),
            ],
          ),
        ),
      ],
    );
  }
}

totalJvm(){

}


class ClicksPerYear {
  final String year;
  final int clicks;
  final Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new Color(
            r: color.r, g: color.g, b: color.b, a: color.a);
}





