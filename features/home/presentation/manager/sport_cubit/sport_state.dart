import 'package:gluco/core/helper/serverfailure.dart';

abstract class SportState {} 
class Sportsuccess extends SportState{}
class Sportloading extends SportState{}
class Sporterror extends SportState{
  String errormessage;
  Sporterror(this.errormessage);
}