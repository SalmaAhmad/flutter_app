class Destination {
  final String name;
  final String capital;
  final String region;
  final int population;
  final String flagUrl;

  const Destination({
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.flagUrl,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    final rawCapital = json['capital'] as String?;
    final capitalVal = (rawCapital != null && rawCapital.isNotEmpty) ? rawCapital : 'N/A';
    final code = (json['alpha2Code'] as String? ?? '').toLowerCase();

    return Destination(
      name: json['name'] as String? ?? '',
      capital: capitalVal,
      region: json['region'] as String? ?? '',
      population: (json['population'] as num?)?.toInt() ?? 0,
      flagUrl: 'https://flagcdn.com/w80/$code.png',
    );
  }
}
