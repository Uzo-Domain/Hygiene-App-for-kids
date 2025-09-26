import 'package:flutter/material.dart';
import 'package:hygiene_3/task_items/youtube_player.dart';

class Sweeping extends StatelessWidget {
  const Sweeping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FF), // Light blue-tinted background
      appBar: AppBar(
        title: const Text(
          "Sweeping",
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
                    "Sweeping Tutorial",
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
                        videoUrl:
                            'https://youtu.be/BmXsby1aGnA?si=JiyHocGFhAAK_a9k'),
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
                            "Sweeping is important because it keeps your space clean by getting rid of dirt, dust, and crumbs. A clean floor makes your home look better and helps prevent bugs, allergies and reduces the risk of asthma. ",
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
                              "🪑 Check under furniture: Don't forget to sweep under tables, chairs, and couches where dust can hide"),
                          _buildTipItem(
                              "🧹 Shake out your broom: If your broom gets dirty, take it outside and shake it out"),
                          _buildTipItem(
                              "📝 Daily Sweeping: In places like the kitchen or living room where people walk a lot and crumbs or dirt build up quickly"),
                          _buildTipItem(
                              "📅 Weekly Sweeping: In spots like your bedroom, where there's less mess and fewer people walking around"),
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
                          _buildStep("1", "Broom control",
                              "Hold the broom with both hands—one near the top and the other in the middle—and sweep from the outside toward yourself. Use the broom by dragging its head along the ground in short, careful strokes"),
                          _buildStep("2", "Start at corners",
                              "Start at the edges of the room and work your way towards the center. Draw the debris away from the baseboards and out into the open, where you can shape it into a small pile that will be easy to collect later on"),
                          _buildStep("3", "Take breaks to clean your broom",
                              "Things like hair, lint, and dust can get stuck in the broom. When that happens, hold the broom over a trash can and pull out the stuff with your hands (Be sure to wash your hands well after sweeping)"),
                          _buildStep("4", "Pack the dirt",
                              "Use your broom to sweep the pile of dirt into the dustpan. After sweeping around the edges of the room, focus on gathering all the dirt into the dustpan to throw away"),
                          _buildStep(
                              "5",
                              "Use 'drawbridge' technique for annoying dustpan lines",
                              "Sometimes after sweeping a pile of dirt into your dustpan, you'll notice a thin line of dust left behind at the front edge. When this happens, raise the handle up at a steep angle while keeping the lip pressed firmly into the floor"),
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
                              "Remember: A clean home can boost your mood, improve focus, and help you feel more in control.",
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
