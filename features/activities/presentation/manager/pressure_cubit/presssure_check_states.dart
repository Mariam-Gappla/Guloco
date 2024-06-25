import 'package:gluco/features/activities/data/pressurecheck.dart';

abstract class PresssureCheckStates {} 
class PresssureCheckinitial extends PresssureCheckStates{}
class PresssureCheckloading extends PresssureCheckStates{}
class haveData extends PresssureCheckStates{
  List<int> diastolicpressure;
  List<int> systolicpressure;
  List<int>  heart;
  List<Pressurecheck> pressurdata=[];
  haveData(this.diastolicpressure,this.systolicpressure,this.heart,this.pressurdata);
}
class nothaveData extends PresssureCheckStates{}
