
abstract class PressureState {}
final class Pressuresuccess extends PressureState {}
final class Pressureloading extends PressureState {}
final class Pressureserror extends PressureState {
 String errormessage;
  Pressureserror(this.errormessage);
}

