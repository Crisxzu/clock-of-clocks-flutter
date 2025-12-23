import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Credits extends StatelessWidget {
  const Credits({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final url = Uri.parse('https://dazu.fr');
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        height: 56,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Made by ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
              ),
            ),
            Text(
              'Dazu',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[300],
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue[300],
                decorationThickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
