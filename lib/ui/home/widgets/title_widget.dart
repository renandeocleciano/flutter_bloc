import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              'Exemplo BLoC',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Renan Deocleciano ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const SizedBox(width: 18.0),
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(
            'https://media.licdn.com/dms/image/D4D03AQGzfyFXfRYuTw/profile-displayphoto-shrink_200_200/0/1696343173954?e=1704326400&v=beta&t=ZrBnLivU2BBEf-zvjpiEdrcuwsQ05iTMjwl1_wRfXwc',
          ),
        )
      ],
    );
  }
}
