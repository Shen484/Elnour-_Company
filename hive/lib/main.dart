import 'package:flutter/material.dart';

void main() {
  runApp(const AlNoorApp());
}

const Color gold = Color(0xFFFFB900);
const Color white = Color(0xFFF8F5F3);
const Color green = Color(0xFF19D66B);

class AlNoorApp extends StatelessWidget {
  const AlNoorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'شركة النور للاستيراد',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF1A0C0C),
      ),
      home: const AlNoorHomePage(),
    );
  }
}

class AlNoorHomePage extends StatelessWidget {
  const AlNoorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final desktop = width >= 1100;
    final tablet = width >= 650 && width < 1100;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF49191A),
                      Color(0xFF210E0E),
                      Color(0xFF32160F),
                      Color(0xFF49300D),
                    ],
                  ),
                ),
              ),
            ),
      
            Positioned(
              top: 150,
              left: -180,
              child: _glow(
                430,
                const Color(0xFFB51D21).withOpacity(0.20),
              ),
            ),
      
            Positioned(
              right: -180,
              bottom: -170,
              child: _glow(
                520,
                const Color(0xFFFFA900).withOpacity(0.15),
              ),
            ),
      
            Column(
              children: [
                _topBar(),
                _navigationBar(desktop, tablet),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: desktop ? 45 : 20,
                        vertical: desktop ? 75 : 45,
                      ),
                      child: Column(
                        children: [
                          _locationBadge(),
      
                          const SizedBox(height: 35),
      
                          _heading(desktop),
      
                          const SizedBox(height: 25),
      
                          _description(desktop),
      
                          const SizedBox(height: 40),
      
                          _features(desktop),
      
                          const SizedBox(height: 62),
      
                          _buttons(desktop),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
      
            Positioned(
              left: 22,
              bottom: 20,
              child: _whatsappButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _glow(double size, Color color) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 130,
              spreadRadius: 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: 47,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Color(0xFFD72B2E),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF9E191C),
          ),
        ),
      ),
      child: const Directionality(textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'شحن لجميع محافظات مصر | أسعار الجملة للتجار والورش',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFFFFE0A1),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.local_shipping_outlined,
              color: Color(0xFFFFD17B),
              size: 19,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigationBar(bool desktop, bool tablet) {
    return Container(
      height: desktop ? 105 : 80,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Color(0xFF101010),
        border: Border(
          bottom: BorderSide(color: Color(0xFF33221F)),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Container(
              width: desktop ? 60 : 47,
              height: desktop ? 60 : 47,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFB900),
                    Color(0xFFFF7400),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: const Text(
                'ن',
                style: TextStyle(
                  color: Color(0xFF251306),
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            const SizedBox(width: 12),

            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'شركة النور',
                  style: TextStyle(
                    color: white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'للاستيراد وتجارة قطع الغيار',
                  style: TextStyle(
                    color: Color(0xFFB8ADAA),
                    fontSize: 11,
                  ),
                ),
              ],
            ),

            const Spacer(),

            if (desktop) ...[
              _navItem('الرئيسية'),
              _navItem('الموبيدات'),
              _navItem('التوك توك'),
              _navItem('SAHARA OEM'),
              _navItem('FM'),
              _navItem('منتجاتنا'),
              _navItem('مميزاتنا'),
              _navItem('تواصل معنا'),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat, size: 17),
                label: const Text('اطلب الآن'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: gold,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 19,
                  ),
                ),
              ),
            ] else
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: white,
                  size: 30,
                ),
              ),
          ],
        ),
      ),
    );
  }Widget _navItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {},
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFE6E0DE),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _locationBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF6C4114).withOpacity(0.55),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: const Color(0xFFB78025),
        ),
      ),
      child: const Text(
        '⚡ السنبلاوين - الدقهلية',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFFFC54C),
          fontSize: 19,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _heading(bool desktop) {
    final titleSize = desktop ? 58.0 : 35.0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'شركة ',
                style: TextStyle(
                  color: white,
                  fontSize: titleSize,
                  height: 1.35,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'النور للاستيراد',
                style: TextStyle(
                  color: gold,
                  fontSize: titleSize,
                  height: 1.35,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Text(
            'وجهتك الأولى لقطع الغيار الأصلية',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: white,
              fontSize: desktop ? 57 : 32,
              height: 1.45,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _description(bool desktop) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          'متخصصون في قطع غيار الموتوسيكلات والتروسيكلات والتكاتك — باجاج بوكسر، دايون، هوجان وجميع الموديلات. أسعار جملة للتجار والورش، وتوصيل سريع لجميع محافظات مصر EG',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFD1C1BD),
            fontSize: 24,
            height: 1.9,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _features(bool desktop) {
    const features = [
      'قطع أصلية 100%',
      'أسعار الجملة',
      'شحن لكل المحافظات',
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15,
      runSpacing: 13,
      children: features.map((feature) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.075),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: Colors.white.withOpacity(0.10),
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check,
                  size: 19,color: Color(0xFFFFD38A),
                ),
                const SizedBox(width: 6),
                Text(
                  feature,
                  style: TextStyle(
                    color: const Color(0xFFE9DEDA),
                    fontSize: desktop ? 18 : 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buttons(bool desktop) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 22,
      runSpacing: 18,
      children: [
        _actionButton(
          text: 'اتصل بنا',
          icon: Icons.call,
          background: Colors.transparent,
          foreground: white,
          borderColor: const Color(0xFFD8B9B2),
          width: desktop ? 250 : 220,
        ),
        _actionButton(
          text: 'تصفح المنتجات',
          icon: Icons.shopping_bag_outlined,
          background: gold,
          foreground: const Color(0xFF291600),
          width: desktop ? 290 : 250,
        ),
        _actionButton(
          text: 'اطلب عبر واتساب',
          icon: Icons.chat,
          background: green,
          foreground: white,
          width: desktop ? 350 : 290,
        ),
      ],
    );
  }

  Widget _actionButton({
    required String text,
    required IconData icon,
    required Color background,
    required Color foreground,
    required double width,
    Color? borderColor,
  }) {
    return SizedBox(
      width: width,
      height: 90,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 21),
        label: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          foregroundColor: foreground,
          elevation: background == Colors.transparent ? 0 : 8,
          shadowColor: background.withOpacity(0.4),
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(color: borderColor, width: 2),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }

  Widget _whatsappButton() {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: green,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: green.withOpacity(0.25),
            blurRadius: 25,
            spreadRadius: 2,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.chat,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}