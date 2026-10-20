
import 'package:flutter/material.dart';

void main() {
  runApp(const MuslimApp());
}

const Color green = Color(0xFF073B32);
const Color gold = Color(0xFFE3BD69);
const Color background = Color(0xFFF5F2E9);

class MuslimApp extends StatelessWidget {
  const MuslimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'موسوعة المسلم الشاملة',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: green,
          primary: green,
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const sections = [
    ('القرآن الكريم', 'قراءة السور والاستماع للتلاوات', Icons.menu_book),
    ('أذكار الصباح', 'أذكار الصباح مع عداد التكرار', Icons.wb_sunny),
    ('أذكار المساء', 'أذكار المساء والتحصين', Icons.nights_stay),
    ('جميع الأذكار', 'السفر والنوم والاستيقاظ والطعام وغيرها', Icons.auto_awesome),
    ('المسبحة الإلكترونية', 'التسبيح والاستغفار والصلاة على النبي ﷺ', Icons.radio_button_checked),
    ('مواقيت الصلاة', 'الفجر والظهر والعصر والمغرب والعشاء', Icons.access_time),
    ('إعداد الأذان', 'اضبط وقت كل صلاة والتنبيه الخاص بها', Icons.notifications_active),
    ('الجنة والنار', 'تذكير بالآخرة والجنة والنار من القرآن والسنة', Icons.favorite),
    ('الصدقة', 'إضافة رابط التبرع وبيانات الجهة المستفيدة', Icons.volunteer_activism),
    ('القبلة', 'قسم تحديد اتجاه القبلة', Icons.explore),
    ('المفضلة', 'الأذكار والسور المحفوظة', Icons.bookmark),
    ('الإعدادات', 'التنبيهات والأصوات والمظهر', Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          foregroundColor: Colors.white,
          title: const Text(
            'موسوعة المسلم الشاملة',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [green, Color(0xFF126553)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: gold, width: 1.5),
              ),
              child: const Column(
                children: [
                  Icon(Icons.nightlight_round, color: gold, size: 48),
                  SizedBox(height: 12),
                  Text(
                    'وَاذْكُرُوا اللَّهَ كَثِيرًا',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'رفيقك اليومي للقرآن والذكر والعبادة',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'أقسام الموسوعة',
              style: TextStyle(
                color: green,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sections.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.08,
              ),
              itemBuilder: (context, index) {
                final item = sections[index];
                return Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SectionPage(
                            title: item.$1,
                            description: item.$2,
                            icon: item.$3,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE6D9B8),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item.$3, color: green, size: 35),
                          const SizedBox(height: 10),
                          Text(
                            item.$1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.$2,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'اللهم أعنّا على ذكرك وشكرك وحسن عبادتك',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: green,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionPage extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const SectionPage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: green,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 75, color: green),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 20),
                const Text(
                  'هذا القسم جاهز لإضافة محتواه ووظائفه الفعلية.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
