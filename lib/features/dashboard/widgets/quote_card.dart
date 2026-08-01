import 'package:flutter/material.dart';
import '../../../shared/utils/quote_service.dart';

class QuoteCard extends StatelessWidget {

  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Text(

          QuoteService.todayQuote(),

          style: Theme.of(context).textTheme.bodyLarge,

        ),

      ),

    );

  }

}