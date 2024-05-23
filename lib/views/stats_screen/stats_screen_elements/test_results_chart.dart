import 'package:cognitive_assesment_test_app/models/dtos/game_score.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class TestResultsChart extends StatelessWidget {
  const TestResultsChart(this.seriesList, {super.key});

  final List<LineSeries<GameScore, DateTime>> seriesList;

  double getMinValue() {
    double minValue = double.infinity;
    for (var series in seriesList) {
      for (var data in series.dataSource!) {
        if (data.score < minValue) {
          minValue = data.score.toDouble();
        }
      }
    }

    minValue = minValue - 10;
    if (minValue < 0) {
      minValue = 0;
    }
    return minValue;
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        dateFormat: DateFormat('dd/MM/yyyy'),
        title: const AxisTitle(
          text: 'Date',
        ),
      ),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat.compact(), // Add this line
        minimum: getMinValue(),
        title: const AxisTitle(
          text: 'Score',
        ),
      ),
      legend: const Legend(isVisible: false),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        format: 'point.x \n point.y',
        header: '',
      ),
      series: seriesList,
    );
  }
}
