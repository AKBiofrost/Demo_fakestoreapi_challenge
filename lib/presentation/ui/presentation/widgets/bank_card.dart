import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final String cardBgAsset;
  final String balance;
  final String cardNumber;
  const BankCard({
    super.key,
    required this.cardBgAsset,
    required this.balance,
    required this.cardNumber,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
       /*
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(cardBgAsset),
            fit: BoxFit.cover,
          ),
        ),
        */
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: Image.network('https://firebasestorage.googleapis.com/v0/b/asconcursoculinario.appspot.com/o/restaurantes_foto%2FScreenshot_20240627-181604_WhatsAppBusiness.png?alt=media&token=2044c463-ed48-4510-ad8e-10da13d2533d', fit: BoxFit.cover, width: 1000).image,
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            Image.asset(
              'assets/visa.png',
              height: 22,
            ),
            */
          const SizedBox(height: 60),
            const Text(
              'Nombre xxxxxxxxxxx',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\ $balance',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  '$cardNumber',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
