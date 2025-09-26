import 'package:flutter/material.dart';
import 'package:hygiene_3/task_items/youtube_player.dart';

class Mopping extends StatelessWidget {
  const Mopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FF), // Light blue-tinted background
      appBar: AppBar(
        title: const Text(
          "Mopping",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142), // Dark blue-gray
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Column(
                children: [
                  Text(
                    "Mopping Tutorial",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3142),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomYoutubePlayer(
                        videoUrl: 'https://youtu.be/LOJAFl7esP4'),
                  ),
                ],
              ),
            ),

            // Main content with cards
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Why it's important card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber[600]),
                              const SizedBox(width: 8),
                              const Text(
                                "Why It Matters",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2D3142),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Mopping is important because it gets rid of sticky messes, germs, and dirt that sweeping can't handle. It helps keep your floors looking clean and stops bacteria from building up.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF4F4F4F),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Quick Tips Section
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: const Color(0xFF4C6FFF), // Vibrant blue
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.lightbulb, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Pro Tips",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildTipItem(
                              "🧴 Detergent label: Always follow the instructions on the detergent label"),
                          _buildTipItem(
                              "🧹 Sweep before mopping: Before mopping, sweep or vacuum first"),
                          _buildTipItem(
                              "📅 Mop regularly: It would be best to mop your floors at least once a week, especially in areas used daily"),
                          _buildTipItem(
                              "🎯 Change mop head: Replace your mop (or mop head) every three months"),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Steps Section
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.format_list_numbered,
                                  color: Colors.blue[700]),
                              const SizedBox(width: 8),
                              const Text(
                                "Step by Step Guide",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2D3142),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildStep("1", "Select proper tools",
                              "Choose the proper mop and cleaning detergent for your floor type. Avoid products advertised using phrases such as 'mop and shine', as these can create yellow spots over time"),
                          _buildStep("2", "Use two buckets",
                              "One to wash and another to rinse. Fill each bucket with hot water. Add cleaning detergent to the wash bucket"),
                          _buildStep("3", "Begin mopping in sections",
                              "Dip your mop in the wash bucket , then wring it out. The mop should be damp but not sopping wet since too much water can damage the floor. Mop a section of your floor, such as five or six square feet, moving backward to prevent tracking"),
                          _buildStep("4", "Rinse the floor, then repeat",
                              "After mopping and scrubbing a section of your floor, rinse your mop thoroughly in the rinse bucket.  Repeat each section's mopping and rinsing process until you've completed the floor. As you work, monitor the water in both buckets. When they become visibly gray or dark, empty and refill the buckets"),
                          _buildStep("5", "Do a final rinse",
                              "Mop one final time with fresh, hot rinse water. This will ensure that the floors are rid of dirt and grime and that no detergent residue remains. When done, thoroughly rinse your mop and buckets and allow them to dry completely before storing them"),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Warning Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: const Color(0xFFFFF3E0), // Light orange
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(Icons.warning_amber,
                              color: Colors.orange[700], size: 24),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "Remember: Not mopping regularly can cause stains that are harder to clean and might damage your floor.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF2D3142),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildStep(String number, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3142),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF4F4F4F),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
