import 'package:flutter/material.dart';
import 'package:sergio_web/common/footer/ui/footer.dart';
import 'package:sergio_web/experience/ui/experience_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color startColor = Color(0xFF42A5F5); // Un azul medio (Blue 400)
    const Color endColor = Color(0xFFE3F2FD);   // U
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                startColor,
                endColor,
              ],
              // stops: [0.0, 1.0],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Header',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      'Este es el Contenido principal.',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    for (int i = 0; i < 50; i++)
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Text('Elemento de Contenido ${i + 1}'),
                      ),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: ExperienceWidget(),
              ),

              const SliverToBoxAdapter(
                child: Footer(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}