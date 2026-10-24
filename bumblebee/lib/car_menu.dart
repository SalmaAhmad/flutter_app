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
        'https://raw.githubusercontent.com/freetestapi/freetestapi/main/data/cars.json',
      );
      final List dataList = response.data as List;
      final loaded = dataList.map((e) {
        final item = e as Map<String, dynamic>;
        return Destination(
          name: '${item['make']} ${item['model']}',
          capital: '${item['make']}',
          region: '${item['year']} • ${item['color'] ?? 'Sport'}',
          population: ((item['price'] as num? ?? 12000) / 100).round(),
          flagUrl: item['image'] as String? ?? 'https://flagcdn.com/w80/de.png',
        );
      }).toList();

      if (loaded.isNotEmpty) {
        setState(() {
          destinations = loaded;
        });
        return;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    // Fallback list of cars ensuring smooth scrollable car list
    final mockCars = [
      const Destination(
        name: 'BMW M4 Competition',
        capital: 'BMW',
        region: 'Sports Coupe',
        population: 150,
        flagUrl: 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=200',
      ),
      const Destination(
        name: 'Audi RS6 Avant',
        capital: 'Audi',
        region: 'Luxury Wagon',
        population: 140,
        flagUrl: 'https://images.unsplash.com/photo-1603584173870-7f23fdae1b7a?w=200',
      ),
      const Destination(
        name: 'Mercedes-AMG GT',
        capital: 'Mercedes-Benz',
        region: 'Supercar',
        population: 200,
        flagUrl: 'https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=200',
      ),
      const Destination(
        name: 'Tesla Model S Plaid',
        capital: 'Tesla',
        region: 'Electric Performance',
        population: 130,
        flagUrl: 'https://images.unsplash.com/photo-1536700503339-1e4b06520771?w=200',
      ),
      const Destination(
        name: 'Porsche 911 GT3',
        capital: 'Porsche',
        region: 'Track Performance',
        population: 220,
        flagUrl: 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=200',
      ),
      const Destination(
        name: 'Lamborghini Huracán',
        capital: 'Lamborghini',
        region: 'Exotic V10',
        population: 300,
        flagUrl: 'https://images.unsplash.com/photo-1544829099-b9a0c07fad1a?w=200',
      ),
      const Destination(
        name: 'Ferrari F8 Tributo',
        capital: 'Ferrari',
        region: 'Supercar V8',
        population: 350,
        flagUrl: 'https://images.unsplash.com/photo-1583121274602-3e2820c69888?w=200',
      ),
      const Destination(
        name: 'Range Rover Sport SVR',
        capital: 'Land Rover',
        region: 'Luxury SUV',
        population: 160,
        flagUrl: 'https://images.unsplash.com/photo-1563720223185-11003d516935?w=200',
      ),
      const Destination(
        name: 'Ford Mustang Shelby GT500',
        capital: 'Ford',
        region: 'American Muscle',
        population: 125,
        flagUrl: 'https://images.unsplash.com/photo-1584345604476-8ec5e12e42dd?w=200',
      ),
      const Destination(
        name: 'Chevrolet Corvette Z06',
        capital: 'Chevrolet',
        region: 'Sports Supercar',
        population: 145,
        flagUrl: 'https://images.unsplash.com/photo-1617814076367-b759c7d7e738?w=200',
      ),
      const Destination(
        name: 'Aston Martin DB11',
        capital: 'Aston Martin',
        region: 'Grand Tourer',
        population: 250,
        flagUrl: 'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?w=200',
      ),
    ];

    setState(() {
      destinations = mockCars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bumblee: Available Cars"),
      ),
      body: destinations.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final d = destinations[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 6.0,
                  ),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12.0),
                    leading: FlagImage(url: d.flagUrl, width: 50),
                    title: Text(
                      d.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Brand: ${d.capital} • Category: ${d.region}\nRate: \$${d.population}/day',
                      style: const TextStyle(height: 1.3),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Booked ${d.name} for \$${d.population}/day!'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Text('Rent'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

typedef CarMenu = DestinationsScreen;
