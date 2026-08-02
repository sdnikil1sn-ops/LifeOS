import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../application/calendar_provider.dart';
import '../domain/calendar_event.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<CalendarProvider>().loadMonth(_focusedDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarProvider>(
      builder: (context, provider, child) {
        return RefreshIndicator(
          onRefresh: provider.refresh,
          child: ListView(
            children: [
              TableCalendar(
                firstDay: DateTime(2020),
                lastDay: DateTime(2100),
                focusedDay: _focusedDay,

                selectedDayPredicate: (day) {
                  return isSameDay(
                    provider.selectedDay,
                    day,
                  );
                },

                onDaySelected: (selected, focused) async {
                  _focusedDay = focused;

                  await provider.loadDay(selected);

                  if (!mounted) return;

                  setState(() {});
                },

                eventLoader: (day) {
                  return provider.eventsForDate(day);
                },

                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              if (provider.loading)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (provider.events.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Text(
                      "No tasks for this day",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              else
                ...provider.events.map(
                  (event) => _EventTile(event),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _EventTile extends StatelessWidget {
  final CalendarEvent event;

  const _EventTile(this.event);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: ListTile(
        leading: Icon(
          event.completed
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: event.completed ? Colors.green : Colors.grey,
        ),
        title: Text(
          event.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "${event.start.hour.toString().padLeft(2, '0')}:${event.start.minute.toString().padLeft(2, '0')} - "
          "${event.end.hour.toString().padLeft(2, '0')}:${event.end.minute.toString().padLeft(2, '0')}",
        ),
        trailing: Icon(
          Icons.flag,
          color: switch (event.priority) {
            0 => Colors.red,
            1 => Colors.orange,
            2 => Colors.amber,
            3 => Colors.green,
            _ => Colors.blueGrey,
          },
        ),
      ),
    );
  }
}