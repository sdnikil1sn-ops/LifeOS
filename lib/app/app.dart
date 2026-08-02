import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

import '../features/tasks/data/task_repository.dart';
import '../features/tasks/data/occurrence_repository.dart';
import '../features/tasks/services/occurrence_generator.dart';

import '../features/calendar/application/calendar_provider.dart';
import '../features/calendar/application/calendar_service.dart';
import '../features/calendar/data/calendar_repository_impl.dart';

import 'router.dart';
import 'theme/app_theme.dart';

class LifeOSApp extends StatelessWidget {
  const LifeOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase();

    return MultiProvider(
      providers: [
        Provider<AppDatabase>.value(
          value: database,
        ),

        Provider<TaskRepository>(
          create: (_) => TaskRepository(database),
        ),

        Provider<OccurrenceRepository>(
          create: (_) => OccurrenceRepository(database),
        ),

        Provider<OccurrenceGenerator>(
          create: (context) => OccurrenceGenerator(
            taskRepository: context.read<TaskRepository>(),
            occurrenceRepository: context.read<OccurrenceRepository>(),
          ),
        ),

        Provider<CalendarRepositoryImpl>(
          create: (context) => CalendarRepositoryImpl(
            taskRepository: context.read<TaskRepository>(),
            occurrenceRepository: context.read<OccurrenceRepository>(),
          ),
        ),

        Provider<CalendarService>(
          create: (context) => CalendarService(
            context.read<CalendarRepositoryImpl>(),
          ),
        ),

        ChangeNotifierProvider(
          create: (context) => CalendarProvider(
            context.read<CalendarService>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'LifeOS',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
      ),
    );
  }
}