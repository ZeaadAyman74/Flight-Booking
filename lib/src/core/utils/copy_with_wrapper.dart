import 'package:equatable/equatable.dart';

class CopyWithWrapper<T>extends Equatable {
  final T value;
  const CopyWithWrapper.of(this.value);

  @override
  List<Object?> get props => [value];

}

extension Wrapped<T> on T {
  CopyWithWrapper<T> get copyWithWrapper => CopyWithWrapper.of(this);
}