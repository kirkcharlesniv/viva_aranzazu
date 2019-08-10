import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viva_aranzazu/services/auth_service.dart';
import 'package:viva_aranzazu/widgets/authentication/provider.dart';

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(right: 16, bottom: 10, top: 15, left: 16),
        child: GestureDetector(
          onTap: () async {
            try {
              AuthService auth = Provider.of(context).authService;
              await auth.signOut();
            } catch (e) {
              print(e);
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              width: 60,
              fit: BoxFit.cover,
              imageUrl:
                  "https://scontent.fmnl17-1.fna.fbcdn.net/v/t1.0-9/22815282_1179801335486549_5046548424585309223_n.jpg?_nc_cat=104&_nc_oc=AQmA9bPZObxvfY3ITfD8jff5_DzasX2R6yt6p6zXQHtj_VbOqEf5VitwAATE38FPFJw&_nc_ht=scontent.fmnl17-1.fna&oh=b62193919df6fe5b31d59f41872f9101&oe=5DB46EE5",
              placeholder: (context, url) => new CircularProgressIndicator(),
            ),
          ),
        ));
  }
}
