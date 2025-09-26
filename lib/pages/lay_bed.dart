import 'package:flutter/material.dart';
import 'package:hygiene_3/task_items/youtube_player.dart';

class BedMaking extends StatelessWidget {
  const BedMaking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FF), // Light blue-tinted background
      appBar: AppBar(
        title: const Text(
          "Making Your Bed",
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
                            "Making your bed every morning matters because it helps your room look tidy, makes you feel more organized, and gives you a small win to start your day off right. Plus, it's nice to come back to a neat bed later!",
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
                              "🎐 Keep it simple: Don't overthink it—just straighten the sheets and blankets to make it look neat"),
                          _buildTipItem(
                              "♦ Match your bed: Make sure the fitted sheet and flat sheet are the right size for your mattress"),
                          _buildTipItem(
                              "🔁 Make it a habit: Doing it every morning will make it easier and faster over time"),
                          _buildTipItem(
                              "🛏 Add your style: Use blankets, pillows, or bedding you like to make your bed feel cozy"),
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
                          _buildStep("1", "Put the fitted sheet on",
                              "After you have a bed clear of pillows, stuffed animals, duvets/blankets , etc, Tuck the ends of the sheet around the four corners of the mattress. Tuck the corners of the mattress tightly. You may need to lift the mattress slightly to achieve this"),
                          _buildStep(
                              "2",
                              "Put the top sheet on and smooth it out",
                              "Spread the top sheet evenly over the mattress so that the same length of sheet is hanging over both sides of the bed"),
                          _buildStep("3", "Place the duvet or comforter on top",
                              "Once the top sheets are tucked in place, lay your blankets, duvet, or comforter on top. Smooth it all out by hand"),
                          _buildStep(
                              "4",
                              "Fluff the pillows for a more cozy vibe",
                              "Grab the pillow on either side and squeeze the sides together firmly and repeatedly. Smooth out the pillow cases then lay each pillow flat at the head of the bed"),
                          _buildStep(
                              "5",
                              "Place any decorative pillows or quilts on top",
                              "Take any decorative cushions or pillows you might have and place them in an upright position at the head of the bed, leaning against the sleeping pillows for support. If you have an additional blanket, quilt, or throw blanket that you like to keep on your bed, fold it neatly in half and lay it evenly over the bottom half of the bed"),
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
                              "Remember: Studies show that people sleep better in a tidy bedroom with a made bed.",
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
