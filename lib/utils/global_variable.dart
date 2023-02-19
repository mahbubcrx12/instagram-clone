import 'package:flutter/cupertino.dart';

import '../view/add_post_screen.dart';
import '../view/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  const FeedScreen(),
  const Text('search'),
  const AddPostScreen(),
  const Text('fav'),
  const Text('profile'),

];