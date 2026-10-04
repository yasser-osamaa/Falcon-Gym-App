import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/core/utils/service_locator.dart';
import 'package:falcon_gym/features/auth/domain/repos/auth_repo.dart';
import 'package:falcon_gym/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final supabaseUrl = dotenv.env['SUPABASE_URL']!;
  final supabaseKey = dotenv.env['SUPABASE_ANON_KEY']!;
  await Supabase.initialize(url: supabaseUrl, publishableKey: supabaseKey);
  setupLocator();

  runApp(const FalconGym());
}

class FalconGym extends StatelessWidget {
  const FalconGym({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: getIt.get<AuthRepo>()),
      child: MaterialApp.router(
        title: 'Falcon Gym',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
