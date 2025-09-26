import 'package:flutter/material.dart';
import 'package:hygiene_3/task_items/youtube_player.dart';

class BrushingPage extends StatelessWidget {
  const BrushingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FF), // Light blue-tinted background
      appBar: AppBar(
        title: const Text(
          "Oral Hygiene",
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
            // Video section with colored background
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Column(
                children: [
                  Text(
                    "Brushing Tutorial",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3142),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomYoutubePlayer(videoUrl: '1q10LWifXkw'),
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
                            "Brushing your teeth is super important because it keeps your smile looking great, prevents bad breath, and protects your teeth from cavities. It also keeps your gums healthy and helps your whole body stay strong since oral health is connected to overall health.",
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
                              "⏰ Brush for 2 minutes: Morning and night — pick a fun song to time it"),
                          _buildTipItem(
                              "💧 Use a small dot of toothpaste: Just a pea-sized amount"),
                          _buildTipItem(
                              "🦷 Brush everywhere: Front, back, top, bottom, and your tongue"),
                          _buildTipItem(
                              "🎯 Floss daily: It's the secret weapon to clean between your teeth"),
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
                          _buildStep("1", "Polish the outside",
                              "Start with the front of your teeth—top and bottom. Go tooth by tooth like an artist painting a masterpiece"),
                          _buildStep("2", "Hug your gums",
                              "Tilt your brush a little (like 45°) and gently scrub along the edge where your teeth meet your gums"),
                          _buildStep("3", "Inside sparkle",
                              "Don't forget the insides of your teeth! They need love too — brush back and forth like a tiny toothbrush train"),
                          _buildStep("4", "Crunchy zones",
                              "Clean the tops of your chewing teeth—where all the yummy crumbs like to hide"),
                          _buildStep("5", "Fresh tongue",
                              "Give your tongue a tickle with your brush to keep your breath smelling great"),
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
                              "Remember: Be gentle! Brushing too hard can hurt your gums and make teeth sensitive.",
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
