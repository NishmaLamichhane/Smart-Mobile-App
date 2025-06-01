import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_folder_mobile_app/features/auth/data/repositories/auth_repositories.dart';
import 'package:smart_folder_mobile_app/features/auth/presentation/blocs/auth_event.dart';
import 'package:smart_folder_mobile_app/features/auth/presentation/blocs/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositories authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<RegisterEvent>((RegisterEvent event, emit) async {
      emit(RegisterLoadingState());
      final result = await authRepository.registerUser(userData: event.userData);
      result.fold(
        (error) => emit(RegisterErrorState(errorMessage: error.errorMessage)),
        (success) => emit(RegisterLoadedState(successMessage: success)),
      );
    });
  
  }

  

}