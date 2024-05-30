import 'package:flutter/material.dart';

const defualtScrollPhysics = BouncingScrollPhysics();


extension PriceLable on int{
  String get withPriceLable => '$this تومان';
}