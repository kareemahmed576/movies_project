import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart'; // الملف ده هيتكريه لوحده لما تعمل build runner

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();