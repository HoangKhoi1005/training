library my_data;

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import 'package:training/domain/domain.dart';

part 'data.g.dart';

part 'repository/mission_repository.dart';
part 'repository/store_repository.dart';
part 'repository/tool_repository.dart';
part 'repository/user_repository.dart';

part 'service/user/dto/account_info.dart';
part 'service/user/dto/login.dart';
part 'service/user/config.dart';
part 'service/user/service.dart';
