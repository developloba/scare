import 'package:equatable/equatable.dart';

class AppUsageEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class OnOpenEvent extends AppUsageEvent {}

class OnClosedEvent extends AppUsageEvent {}
