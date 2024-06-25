import 'package:gluco/features/activities/data/Weightcheck.dart';

abstract class WeightCheckStates {} 
class WeightCheckinitial extends WeightCheckStates{}
class WeightCheckloading extends WeightCheckStates{}
class haveData extends WeightCheckStates{
  List<int> weight;
  List<Weightcheck> weightdata;
  haveData(this.weight,this.weightdata);
}
class nothaveData extends WeightCheckStates{}