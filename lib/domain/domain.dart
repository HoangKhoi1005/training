library my_domain;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'action/validate_email.dart';
part 'action/validate_password.dart';
part 'action/validate_user_name.dart';

part 'exception/email_exception.dart';
part 'exception/exception.dart';
part 'exception/password_exception.dart';
part 'exception/username_exception.dart';
part 'exception/validation_exception.dart';

part 'model/mission.dart';
part 'model/mission_status.dart';
part 'model/store.dart';
part 'model/store_category.dart';
part 'model/tool.dart';
part 'model/user.dart';

part 'repository/mission_repository.dart';
part 'repository/store_repository.dart';
part 'repository/tool_repository.dart';
part 'repository/user_repository.dart';

part 'use_case/get_missions.dart';
part 'use_case/get_stores.dart';
part 'use_case/get_tool.dart';
part 'use_case/login.dart';
part 'use_case/sign_up.dart';

part 'application.dart';

part 'domain.freezed.dart';
part 'domain.g.dart';
