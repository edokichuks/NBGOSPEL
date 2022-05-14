import 'package:flutter/material.dart';
import 'package:nbgospel/model/drawer_model.dart';

List<DrawerModel> drawerData = [
  DrawerModel(
    text: 'Christain Articles',
    icon: Icons.article,
    url: 'https://nbgospel.com/category/articles/christian-articles/',
  ),
  DrawerModel(
    text: 'Christain News',
    icon: Icons.new_releases_sharp,
    url: 'https://nbgospel.com/category/articles/christian-news/',
  ),
  DrawerModel(
    text: 'Biography',
    icon: Icons.account_box_outlined,
    url: 'https://nbgospel.com/category/articles/biographies/',
  ),
  DrawerModel(
    text: 'Online Live Sermon',
    icon: Icons.live_tv_sharp,
    url: 'https://nbgospel.com/free-online-sermons/',
  ),
  DrawerModel(
    text: 'LATEST SERMONS',
    icon: Icons.new_releases,
    url: 'https://nbgospel.com/',
  ),
  DrawerModel(
    text: 'About Us',
    icon: Icons.info_outline,
    url: 'https://nbgospel.com/privacy-policy/',
  ),
];
