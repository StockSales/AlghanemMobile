import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trackingorder_event.dart';
part 'trackingorder_state.dart';

class TrackingorderBloc extends Bloc<TrackingorderEvent, TrackingorderState> {
  TrackingorderBloc() : super(TrackingorderInitial()) {
    on<TrackingorderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
