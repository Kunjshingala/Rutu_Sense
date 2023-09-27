import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
