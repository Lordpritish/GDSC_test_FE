import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EventTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.3,
          isFirst: true,
          indicatorStyle: IndicatorStyle(
            width: 70,
            height: 70,
            indicator: _Sun(),
          ),
          beforeLineStyle: LineStyle(color: Colors.white.withOpacity(0.7)),
          endChild: const _ContainerHeader(name: 'SomeBody', dayCount: 156),
        ),
        _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Icons.medical_services,
              size: 20,
            ),
            date: 'March 3',
            time: '5:00 - 6:00 pm',
            doctorPatientName: 'Amy',
            eventTitle: 'Prenatal Checkup'),
        _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Icons.medical_services,
              size: 20,
            ),
            date: 'March 5',
            time: '10: 30 - 11: 00 am',
            doctorPatientName: 'Bob',
            eventTitle: 'Online Meeting'),
      ],
    );
  }
}

TimelineTile _buildTimelineTile({
  _IconIndicator indicator,
  String date,
  String time,
  String eventTitle,
  String doctorPatientName,
  bool isLast = false,
}) {
  return TimelineTile(
    alignment: TimelineAlign.manual,
    lineXY: 0.3,
    beforeLineStyle: LineStyle(color: Colors.white.withOpacity(0.7)),
    indicatorStyle: IndicatorStyle(
      indicatorXY: 0.3,
      drawGap: true,
      width: 30,
      height: 30,
      indicator: indicator,
    ),
    isLast: isLast,
    startChild: Center(
      child: Container(
        alignment: const Alignment(0.0, -0.50),
        child: Text(
          date,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    ),
    endChild: Padding(
      padding: const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            eventTitle,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'with $doctorPatientName',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    ),
  );
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    this.iconData,
    this.size,
  });

  final IconData iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                iconData,
                size: size,
                color: const Color(0xFF9E3773).withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContainerHeader extends StatelessWidget {
  const _ContainerHeader({
    this.name,
    this.dayCount,
  });

  final String name;
  final int dayCount;

  @override
  Widget build(BuildContext context) {
    int week = dayCount ~/ 7;
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Text(
              'Good day',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFF4A5CD),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text(
                    '$dayCount days',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF4A448F).withOpacity(0.8),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  '$week weeks',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF4A448F).withOpacity(0.8),
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Sun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 25,
            spreadRadius: 20,
          ),
        ],
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
