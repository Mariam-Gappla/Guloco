import 'package:gluco/features/activities/data/Sugarcheck.dart';

abstract class SugarCheckStates {} 
class SugarCheckinitial extends SugarCheckStates{}
class SugarCheckloading extends SugarCheckStates{}
class haveData extends SugarCheckStates{
  List<double> sugar;
  List<Sugarcheck> sugardata;
  haveData(this.sugar,this.sugardata);
}
class nothaveData extends SugarCheckStates{}