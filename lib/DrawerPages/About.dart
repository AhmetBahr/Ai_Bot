import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hakkında',
            style: TextStyle(
              fontSize: 20, // Yazı boyutu
              fontWeight: FontWeight.bold, // Yazı kalınlığı
              color: Colors.black, // Yazı rengi
              fontFamily: 'Kanit', // Yazı stilini italik yapar
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Projenin Amacı',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Projemizin amacı çiftçilerin tarım ve hayvancılık ile ilgili sorularını yanıtlamak, bitki hastalıklarını ve'
                  'zararlılarını teşhis etmek için fotoğraf yükleme özellikleri sunmak amacıyla tasarlanmıştır '
                  'Proje, düşük teknoloji bilgisine sahip çiftçiler için bile kullanımı kolay ve erişilebilir bir çözüm sunmayı hedeflemektedir. '
                  'Fotoğraf analizi ve soru-cevap süreçlerinin hızlı sonuçlar vermesi sağlanarak, '
                  'çiftçilerin zaman kaybı yaşamadan sorunlarını çözmelerine yardımcı olunacaktır.'
                  'Ayrıca, Tarım ve Orman Bakanlığı verileri kullanılarak chatbot un doğruluğu güvence altına alınacak,'
                  'böylece sunulan bilgiler uzman desteğiyle pekiştirilecektir..',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Kanit',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Projede Çalışanlar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '- Ahmet Bahar\n'
                  '- Ahmet Yaşçın\n'
                  '- Batuhan Yıldız\n'
                  '- Şeyma Nur Şahin',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Kanit',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
