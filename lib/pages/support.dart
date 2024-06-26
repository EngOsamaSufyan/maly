import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'If you have any questions or need assistance, please feel free to contact our support team.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.mail, color: Colors.blue),
              title: Text(
                'Email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              subtitle: Text(
                'maly.wallet@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () async {

                final Uri url=Uri(
                    scheme: 'mailto',
                    path: 'maly.wallet@gmail.com'

                );
                if(await canLaunchUrl(url)){
                await launchUrl(url);
                }
                else
                print('no Call');

              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text(
                'Free Call',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              subtitle: Text(
                '8888400',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () async {
                final Uri url=Uri(
                  scheme: 'tel',
                  path: '8888400'

                );
                if(await canLaunchUrl(url)){
                  await launchUrl(url);
                }
                else
                  print('no Call');

              },
            ),
            Divider(),

            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Follow us',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: ()async {

                    final Uri url=Uri(
                        scheme: 'https',
                        path: 'www.facebook.com'

                    );
                    if(await canLaunchUrl(url)){
                      await launchUrl(url);
                    }
                    else
                      print('no Call');

                  },
                ),
                IconButton(
                  icon: Icon(Icons.where_to_vote),
                  onPressed: ()async {

                    final Uri url=Uri(
                        scheme: 'https',
                        path: 'www.twitter.com'

                    );
                    if(await canLaunchUrl(url)){
                      await launchUrl(url);
                    }
                    else
                      print('no Call');

                  },
                ),
                IconButton(
                  icon: Icon(Icons.telegram),
                  onPressed: () async {

                    final Uri url=Uri(
                        scheme: 'https',
                        path: 'www.instagram.com'

                    );
                    if(await canLaunchUrl(url)){
                    await launchUrl(url);
                    }
                    else
                    print('no Call');


                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}