import 'package:cloud_firestore/cloud_firestore.dart';

class TrainingPoints {
  final int? activate1;
  final int? activate2;
  final int? activate3;
  final int? activate4;
  final int? monitor1;
  final int? monitor2;
  final int? monitor3;
  final int? monitor4;
  final DocumentReference? msv;
  final int? relation1;
  final int? relation2;
  final int? relation3;
  final int? relation4;
  final int? relation5;
  final int? rules1;
  final int? rules2;
  final int? rules3;
  final int? rules4;
  final int? study1;
  final int? study2;
  final int? study3;
  final int? study4;
  final int? study5;
  final int? study6;
  final int? trainingPoint;
  final int? trainingPoint1;
  final int? trainingPoint2;
  final int? trainingPoint3;
  final int? trainingPoint4;
  final int? trainingPoint5;

  TrainingPoints({
    this.activate1,
    this.activate2,
    this.activate3,
    this.activate4,
    this.monitor1,
    this.monitor2,
    this.monitor3,
    this.monitor4,
    this.msv,
    this.relation1,
    this.relation2,
    this.relation3,
    this.relation4,
    this.relation5,
    this.rules1,
    this.rules2,
    this.rules3,
    this.rules4,
    this.study1,
    this.study2,
    this.study3,
    this.study4,
    this.study5,
    this.study6,
    this.trainingPoint,
    this.trainingPoint1,
    this.trainingPoint2,
    this.trainingPoint3,
    this.trainingPoint4,
    this.trainingPoint5,
  });

  factory TrainingPoints.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TrainingPoints(
      activate1: data?["activate1"],
      activate2: data?["activate2"],
      activate3: data?["activate3"],
      activate4: data?["activate4"],
      monitor1: data?["monitor1"],
      monitor2: data?["monitor2"],
      monitor3: data?["monitor3"],
      monitor4: data?["monitor4"],
      msv: data?["msv"],
      relation1: data?["relation1"],
      relation2: data?["relation2"],
      relation3: data?["relation3"],
      relation4: data?["relation4"],
      relation5: data?["relation5"],
      rules1: data?["rules1"],
      rules2: data?["rules2"],
      rules3: data?["rules3"],
      rules4: data?["rules4"],
      study1: data?["study1"],
      study2: data?["study2"],
      study3: data?["study3"],
      study4: data?["study4"],
      study5: data?["study5"],
      study6: data?["study6"],
      trainingPoint: data?["trainingPoint"],
      trainingPoint1: data?["trainingPoint1"],
      trainingPoint2: data?["trainingPoint2"],
      trainingPoint3: data?["trainingPoint3"],
      trainingPoint4: data?["trainingPoint4"],
      trainingPoint5: data?["trainingPoint5"],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (activate1 != null) 'activate1': activate1,
      if (activate2 != null) 'activate2': activate2,
      if (activate3 != null) 'activate3': activate3,
      if (activate4 != null) 'activate4': activate4,
      if (monitor1 != null) 'monitor1': monitor1,
      if (monitor2 != null) 'monitor2': monitor2,
      if (monitor3 != null) 'monitor3': monitor3,
      if (monitor4 != null) 'monitor4': monitor4,
      if (msv != null) 'msv': msv,
      if (relation1 != null) 'relation1': relation1,
      if (relation2 != null) 'relation2': relation2,
      if (relation3 != null) 'relation3': relation3,
      if (relation4 != null) 'relation4': relation4,
      if (relation5 != null) 'relation5': relation5,
      if (rules1 != null) 'rules1': rules1,
      if (rules2 != null) 'rules2': rules2,
      if (rules3 != null) 'rules3': rules3,
      if (rules4 != null) 'rules4': rules4,
      if (study1 != null) 'study1': study1,
      if (study2 != null) 'study2': study2,
      if (study3 != null) 'study3': study3,
      if (study4 != null) 'study4': study4,
      if (study5 != null) 'study5': study5,
      if (study6 != null) 'study6': study6,
      if (trainingPoint != null) 'trainingPoint': trainingPoint,
      if (trainingPoint1 != null) 'trainingPoint1': trainingPoint1,
      if (trainingPoint2 != null) 'trainingPoint2': trainingPoint2,
      if (trainingPoint3 != null) 'trainingPoint3': trainingPoint3,
      if (trainingPoint4 != null) 'trainingPoint4': trainingPoint4,
      if (trainingPoint5 != null) 'trainingPoint5': trainingPoint5,
    };
  }
}
