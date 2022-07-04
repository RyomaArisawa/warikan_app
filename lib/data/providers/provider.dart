import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:warikan_app/data/db/calc_dao.dart';
import 'package:warikan_app/data/db/memo_dao.dart';
import 'package:warikan_app/data/db/user_dao.dart';
import 'package:warikan_app/data/repositories/auth_repository.dart';
import 'package:warikan_app/data/repositories/calc_repository.dart';
import 'package:warikan_app/data/repositories/memo_repository.dart';
import 'package:warikan_app/ui/viewmodels/calc_detail_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/calc_input_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/calc_overview_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/home_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/memo_detail_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/memo_input_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/memo_overview_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/profile_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/settings_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/sign_in_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/sign_up_viewmodel.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider(
    create: (context) => UserDao(),
  ),
  Provider(
    create: (context) => MemoDao(),
  ),
  Provider(
    create: (context) => CalcDao(),
  ),
];

List<SingleChildWidget> dependentModels = [
  Provider(
    create: (context) => AuthRepository(
      userDao: context.read<UserDao>(),
    ),
  ),
  Provider(
    create: (context) => MemoRepository(
      memoDao: context.read<MemoDao>(),
    ),
  ),
  Provider(
    create: (context) => CalcRepository(
      calcDao: context.read<CalcDao>(),
    ),
  )
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider(
    create: (context) => SignUpViewModel(
      authRepository: context.read<AuthRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => SignInViewModel(
      authRepository: context.read<AuthRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (_) => HomeViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => CalcOverviewViewModel(
      authRepository: context.read<AuthRepository>(),
      calcRepository: context.read<CalcRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => CalcInputViewModel(
      authRepository: context.read<AuthRepository>(),
      calcRepository: context.read<CalcRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (_) => CalcDetailViewModel(),
  ),
  ChangeNotifierProvider(
    create: (_) => SettingsViewModel(),
  ),
  ChangeNotifierProvider(
    create: (_) => ProfileViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => MemoOverviewViewModel(
      authRepository: context.read<AuthRepository>(),
      memoRepository: context.read<MemoRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => MemoInputViewModel(
      authRepository: context.read<AuthRepository>(),
      memoRepository: context.read<MemoRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (_) => MemoDetailViewModel(),
  ),
];
