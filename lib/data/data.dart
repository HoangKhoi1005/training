library my_data;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import 'package:training/domain/domain.dart';

part 'data.g.dart';

part 'repository/user_repository.dart';

part 'service/user/dto/login.dart';
part 'service/user/config.dart';
part 'service/user/service.dart';