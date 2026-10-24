import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'destination.dart';
import 'flag_image.dart';

class DestinationsScreen extends StatefulWidget {
  const DestinationsScreen({super.key});

  @override
  State<DestinationsScreen> createState() => _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  List<Destination> destinations = [];

  @override
  void initState() {
    super.initState();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    try {
      final response = await Dio().get(
        'https://countries.dev/countries?fields=name,capital,region,population,alpha2Code',
      );
      final List dataList = response.data as List;
      final loaded = dataList
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList();

      setState(() {
        destinations = loaded;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destinations"),
      ),
      body: destinations.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final d = destinations[index];
                return ListTile(
                  leading: FlagImage(url: d.flagUrl),
                  title: Text(d.name),
                  subtitle: Text(
                    'Capital: ${d.capital} • Region: ${d.region} • Pop: ${d.population}',
                  ),
                );
              },
            ),
    );
  }
}

typedef CarMenu = DestinationsScreen;
