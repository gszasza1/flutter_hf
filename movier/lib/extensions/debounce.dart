import 'dart:async';

class Debounce {
  final Duration delay;
  Timer? _timer;

  Debounce(this.delay);

  Function call(Function callback) {
    return (args) {
      _timer?.cancel();
      _timer = Timer(delay, () => callback(args));
    };
  }

  dispose() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }
}
