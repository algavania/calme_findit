import 'package:calme/data/models/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CopingModel {
  final String title;
  final String description;
  final String thumbnailUrl;
  final DateTime createdAt;

  CopingModel({
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    @TimestampConverter() required this.createdAt,
  });
}
