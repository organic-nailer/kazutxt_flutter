import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'my_value.freezed.dart';

@freezed
class MyValue with _$MyValue {
  const factory MyValue({@Default(0.0) double value}) = _MyValue;
}

class MyValueStateNotifier extends StateNotifier<MyValue> {
  MyValueStateNotifier() : super(MyValue());

  change(newValue) => state = state.copyWith(value: newValue);
}
