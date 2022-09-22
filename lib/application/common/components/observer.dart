/// 观察者
class Observer<T> {
  T name;
  Function(T) onCallback;
  Observer(this.name, this.onCallback);

  void notify() {
    onCallback(name);
  }
}
