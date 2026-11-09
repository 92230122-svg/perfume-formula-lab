import 'package:flutter/material.dart';

void main() {
  runApp(const PerfumeCalculatorApp());
}

class PerfumeCalculatorApp extends StatelessWidget {
  const PerfumeCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfume Formula Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101114),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF65),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const PerfumeCalculatorPage(),
    );
  }
}

class PerfumeCalculatorPage extends StatefulWidget {
  const PerfumeCalculatorPage({super.key});

  @override
  State<PerfumeCalculatorPage> createState() => _PerfumeCalculatorPageState();
}

class _PerfumeCalculatorPageState extends State<PerfumeCalculatorPage> {
  final Color gold = const Color(0xFFD4AF65);
  final Color cardColor = const Color(0xFF1D1F23);

  final TextEditingController oilController = TextEditingController(text: '30');

  final TextEditingController fixativeController = TextEditingController(
    text: '5',
  );

  final List<int> bottleSizes = [15, 30, 50, 100];

  int selectedSize = 50;

  double oilAmount = 0;
  double alcoholAmount = 0;
  double fixativeAmount = 0;

  bool hasCalculated = false;
  String? errorMessage;

  // Calculate perfume formula
  void calculateFormula() {
    final double? oilPercentage = double.tryParse(oilController.text);

    final double? fixativePercentage = double.tryParse(fixativeController.text);

    if (oilPercentage == null || fixativePercentage == null) {
      setState(() {
        errorMessage = 'Please enter valid numbers.';
        hasCalculated = false;
      });
      return;
    }

    if (!oilPercentage.isFinite || !fixativePercentage.isFinite) {
      setState(() {
        errorMessage = 'Please enter valid numbers.';
        hasCalculated = false;
      });
      return;
    }

    if (oilPercentage < 0 ||
        fixativePercentage < 0 ||
        oilPercentage > 100 ||
        fixativePercentage > 100) {
      setState(() {
        errorMessage = 'Percentages must be between 0 and 100.';
        hasCalculated = false;
      });
      return;
    }

    if (oilPercentage + fixativePercentage > 100) {
      setState(() {
        errorMessage = 'Combined percentages cannot exceed 100%.';
        hasCalculated = false;
      });
      return;
    }

    setState(() {
      oilAmount = selectedSize * oilPercentage / 100;

      fixativeAmount = selectedSize * fixativePercentage / 100;

      alcoholAmount = selectedSize - oilAmount - fixativeAmount;

      hasCalculated = true;
      errorMessage = null;
    });
  }

  // Reset formula
  void resetFormula() {
    setState(() {
      selectedSize = 50;

      oilController.text = '30';
      fixativeController.text = '5';

      oilAmount = 0;
      alcoholAmount = 0;
      fixativeAmount = 0;

      hasCalculated = false;
      errorMessage = null;
    });
  }

  // Section heading
  Widget sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: gold, size: 21),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Percentage input
  Widget percentageInput({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: 'Enter percentage',
            suffixText: '%',
            suffixStyle: TextStyle(color: gold),
            filled: true,
            fillColor: const Color(0xFF292B30),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: gold),
            ),
          ),
        ),
      ],
    );
  }

  // Result card
  Widget resultCard(String title, double amount, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Icon(icon, color: gold, size: 24),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          Text(
            '${amount.toStringAsFixed(2)} ml',
            style: TextStyle(
              color: gold,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    oilController.dispose();
    fixativeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Application Header
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.science_outlined, color: gold, size: 48),

                        const SizedBox(height: 12),

                        const Text(
                          'PERFUME FORMULA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'CALCULATOR',
                          style: TextStyle(
                            color: gold,
                            fontSize: 13,
                            letterSpacing: 5,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Container(width: 65, height: 2, color: gold),

                        const SizedBox(height: 10),

                        const Text(
                          'Calculate your perfect fragrance formula',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Bottle Size
                  sectionTitle('Bottle Size', Icons.local_drink_outlined),

                  const SizedBox(height: 16),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: bottleSizes.map((size) {
                      final bool selected = selectedSize == size;

                      return ChoiceChip(
                        label: Text('$size ml'),
                        selected: selected,
                        selectedColor: gold,
                        backgroundColor: cardColor,
                        labelStyle: TextStyle(
                          color: selected ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        side: BorderSide(
                          color: selected ? gold : Colors.white24,
                        ),
                        onSelected: (_) {
                          setState(() {
                            selectedSize = size;
                            hasCalculated = false;
                            errorMessage = null;
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // Formula Settings
                  sectionTitle('Formula Settings', Icons.tune),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      children: [
                        percentageInput(
                          label: 'Fragrance Oil Concentration',
                          controller: oilController,
                        ),

                        const SizedBox(height: 22),

                        percentageInput(
                          label: 'Fixative Percentage',
                          controller: fixativeController,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Calculate Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: calculateFormula,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gold,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: const Text(
                        'CALCULATE FORMULA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),

                  // Error Message
                  if (errorMessage != null) ...[
                    const SizedBox(height: 15),
                    Text(
                      errorMessage!,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 13,
                      ),
                    ),
                  ],

                  // Calculation Results
                  if (hasCalculated) ...[
                    const SizedBox(height: 30),

                    sectionTitle('Calculation Results', Icons.auto_awesome),

                    const SizedBox(height: 16),

                    resultCard(
                      'Fragrance Oil',
                      oilAmount,
                      Icons.water_drop_outlined,
                    ),

                    const SizedBox(height: 10),

                    resultCard(
                      'Alcohol',
                      alcoholAmount,
                      Icons.science_outlined,
                    ),

                    const SizedBox(height: 10),

                    resultCard('Fixative', fixativeAmount, Icons.opacity),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292319),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: gold.withValues(alpha: 0.4)),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'TOTAL VOLUME',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              letterSpacing: 2,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '$selectedSize ml',
                            style: TextStyle(
                              color: gold,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 22),

                  // Reset Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: resetFormula,
                      icon: const Icon(Icons.refresh),
                      label: const Text('RESET FORMULA'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: gold,
                        side: BorderSide(color: gold),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: Text(
                      'PERFUME FORMULA CALCULATOR',
                      style: TextStyle(
                        color: Colors.white30,
                        fontSize: 10,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
