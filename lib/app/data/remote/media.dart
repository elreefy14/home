import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  launchEmail({String? email}) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters(<String, String>{
        'subject': 'Support',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  launchLink({String? link}) async {
    if (!await launchUrl(Uri.parse('https://$link'))) {
      throw 'Could not launch $link';
    }
  }

  launchExperienceLink({String? link}) async {
    if (!await launchUrl(Uri.parse(link!))) {
      throw 'Could not launch https://www.example.com/';
    }
  }

  launchPhoneCall({String? phoneNumber}) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

 
}