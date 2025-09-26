import 'package:flutter/material.dart';
import 'package:hygiene_3/task_items/youtube_player.dart';

class SheetsLaundry extends StatelessWidget {
  const SheetsLaundry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FF), // Light blue-tinted background
      appBar: AppBar(
        title: const Text(
          "Switch Beddings and Towels",
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
                    "Bed-Laying Tutorial",
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
                            'https://youtu.be/AYNdVlFTbBw?si=cds_2-Ny-_Wne_ZF'),
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
                            "Changing your bed sheets and pillowcases are important because they collect sweat, dirt, and dead skin over time. Towels soak up water, sweat, and dirt, and if you keep using the same one, it can start to smell or grow bacteria. Keeping these items clean helps prevent smells, breakouts, and allergies.",
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
                              "🌡 Wash with warm water: Use warm or hot water when washing sheets and towels to kill germs and remove odors"),
                          _buildTipItem(
                              "➕ Keep extras handy: Always have clean sheets and towels ready so you're not stuck without one"),
                          _buildTipItem(
                              "🔰 Separate colors: Wash white and colored items separately to keep them looking fresh"),
                          _buildTipItem(
                              "🧺 Fold neatly after washing: Folding your sheets and pillowcases right away keeps them from getting wrinkled"),
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
                                "How Often to Wash?",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2D3142),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildStep("1", "Sheets and pillow cases",
                              "Bed sheets and pillowcases should be washed every week"),
                          _buildStep("2", "Duvet/blankets",
                              "Duvets and blankets should be washed after 2-3 months of use or sooner if they start to stink"),
                          _buildStep("3", "Bath towels",
                              "Should be washed every week or more frequently if they remain damp or smell musty. Hang towels in a well-ventilated area to dry before reusing"),
                          _buildStep("4", "Hand towels",
                              "Should be washed every 1-2 days, as they are used frequently and by multiple people"),
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
                              "Remember: Dead cells make up the top 20 layers of your skin. Some of these cells scrub off in the shower, but many of them will end up on your bath towel and bed sheets every day. Never forget to wash these items!",
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
