import 'package:android_solution/src/auth/presentation/login/events.dart';
import 'package:android_solution/src/auth/presentation/login/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
   LoginBloc(): super(LoginState());

}