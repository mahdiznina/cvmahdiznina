import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MyApp(),
    ),
  );
}

class MyAppState with ChangeNotifier {
  List<String> favorites = [];

  void addFavorite(String favorite) {
    favorites.add(favorite);
    notifyListeners();
  }

  void removeFavorite(String favorite) {
    favorites.remove(favorite);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var selectedIndex = 0;

  late AnimationController _controller;
  late Animation<Alignment> _animation1;
  late Animation<Alignment> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);

    _animation1 = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_controller);

    _animation2 = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: MediaQuery.of(context).size.width >= 600,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('CV'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.code),
                  label: Text('Compétences'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.app_registration),
                  label: Text('Projets'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.school),
                  label: Text('Université'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.document_scanner),
                  label: Text('Certificats'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.green,
                      ],
                      begin: _animation1.value,
                      end: _animation2.value,
                    ),
                  ),
                  child: selectedIndex == 0
                      ? CVContent()
                      : selectedIndex == 1
                          ? CompetencesPage()
                          : selectedIndex == 2
                              ? ProjetsPage()
                              : selectedIndex == 3
                                  ? UniversitesPage()
                                  : CertificatsPage(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CVContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Utilisation de l'image à la place de l'icône
              Image.asset(
                'assets/mahdi22.png', // Chemin de votre image
                width: 100, // Largeur de l'image
                height: 100, // Hauteur de l'image
                fit: BoxFit.cover, // Ajustement de l'image
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
              ),
            ],
          ),
          SizedBox(height: 20),
         
                  Text(
                    'Mahdi Znina',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text('Étudiant | Développeur Flutter'),
                  Text('Email :  Mahdiznina3@gmil.com'),
                  Text('Numéro :  +216 53151654'),
                  Text('https://www.linkedin.com/in/mahdi-znina-0b8402258/'),
                  SizedBox(height: 20),
                
          Text(
            'À propos de moi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Je suis un étudiant passionné avec des compétences en développement mobile avec Flutter, '
            'ainsi qu\'une solide expérience dans la conception et la mise en œuvre de systèmes d\'information. '
            'Mon parcours universitaire et mes projets personnels m\'ont permis de maîtriser divers langages de programmation tels que Java, Kotlin, Dart, PHP, et JavaScript. '
            'J\'ai également travaillé avec des frameworks modernes comme Angular et Symfony pour la création d\'applications web robustes. '
            'Mon expérience couvre l\'ensemble du cycle de développement, depuis la conception de l\'architecture des systèmes jusqu\'à la mise en production, en passant par le développement, les tests et le déploiement. '
            'J\'ai utilisé plusieurs environnements de travail, notamment Android Studio, Visual Studio Code, et des outils de gestion de version comme Git. '
            'Grâce à mon intérêt pour la cybersécurité, j\'ai également acquis des compétences en réseaux et en sécurité informatique. '
            'Mon objectif est de continuer à développer des solutions innovantes qui répondent aux besoins des utilisateurs tout en optimisant l\'efficacité et la sécurité des systèmes.',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CompetencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Compétences',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Flutter, Dart'),
          ),
          ListTile(
            leading: Icon(Icons.android),
            title: Text('Développement Android, Jetpack Compose'),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Java, Kotlin, Python, PHP, JavaScript, Angular, Node.js, Symfony'),
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Bases de données : MySQL, PostgreSQL, Firebase, MongoDB'),
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Sécurité informatique et réseaux'),
          ),
          ListTile(
            leading: Icon(Icons.design_services),
            title: Text('UI/UX Design : Figma, Adobe XD'),
          ),
        ],
      ),
    );
  }
}

class ProjetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projets',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text('Application de gestion des tâches (Horizonlux)'),
            subtitle: Text('Développement d\'une application pour gérer les tâches des ouvriers et des administrateurs. Cette application permettra une gestion efficace des tâches assignées, suivra l\'avancement de chaque tâche, et offrira une interface conviviale pour les utilisateurs.'),
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Site e-commerce (CNA Bardeau)'),
            subtitle: Text('Développement d\'un site e-commerce. Ce site permettra aux utilisateurs d\'acheter des produits en ligne, avec des fonctionnalités de panier, de paiement sécurisé, et de gestion des stocks. Une attention particulière sera portée à l\'expérience utilisateur et à la sécurité des transactions.'),
          ),
          ListTile(
            leading: Icon(Icons.task), // Vous pouvez choisir une icône appropriée
            title: Text('Application de gestion des tâches (Codex IT)'),
            subtitle: Text('Développement d\'une application pour la gestion des tâches. Cette application sera conçue pour optimiser la productivité des équipes, permettant la création, l\'assignation et le suivi des tâches en temps réel. Les utilisateurs pourront également générer des rapports sur l\'avancement des projets.'),
          ),
        ],
      ),
    );
  }
}


// Universités Section
class UniversitesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Universités',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          
         
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Institut Supérieur de Technologie de Kelibia'),
            subtitle: Text('Licence en Informatique DSI, 2020 - 2023'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Lycée Abdelaziz Khouja'),
            subtitle: Text('Baccalauréat en Économie, 2022'),
          ),
        ],
      ),
    );
  }
}


// Certificats Section
class CertificatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Certificats',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.code), // Icône pour développement Flutter
            title: Text('Certificat en développement Flutter'),
            subtitle: Text('Formation complète sur Flutter, 2023'),
          ),
          ListTile(
            leading: Icon(Icons.security), // Icône pour cybersécurité
            title: Text('Certificat en cybersécurité'),
            subtitle: Text('Formation en cybersécurité, 2023'),
          ),
          ListTile(
            leading: Icon(Icons.web), // Icône pour développement web
            title: Text('Certificat en développement web'),
            subtitle: Text('Formation en développement web, 2022'),
          ),
          ListTile(
            leading: Icon(Icons.javascript), // Icône pour JavaScript
            title: Text('Certificat en JavaScript'),
            subtitle: Text('Formation complète sur JavaScript, 2024'),
          ),
          ListTile(
            leading: Icon(Icons.business_center), // Icône pour marketing digital
            title: Text('Certificat en Marketing Digital'),
            subtitle: Text('Formation en marketing digital, 2024'),
          ),
        ],
      ),
    );
  }
}
