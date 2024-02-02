import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuoteGenie extends StatefulWidget {
  const QuoteGenie({super.key});

  @override
  State<QuoteGenie> createState() => _QuoteGenieState();
}

class _QuoteGenieState extends State<QuoteGenie> {
  String quote = "";
  bool isLoading = false;

  Future<void> fetchQuote() async {
    setState(() {
      isLoading = true;
    });

    final response =
        await http.get(Uri.parse('https://api.quotable.io/quotes/random'));

    if (response.statusCode == 200) {
      final quoteData = json.decode(response.body)[0];
      setState(() {
        quote = quoteData['content'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load quote');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QuoteGenie',
          style: TextStyle(
            color: Color.fromARGB(255, 196, 228, 255),
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      quote,
                      style: const TextStyle(
                        fontSize: 22,
                        letterSpacing: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9.9)),
                  ),
                ),
                onPressed: fetchQuote,
                child: const Text('Get Quote'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
