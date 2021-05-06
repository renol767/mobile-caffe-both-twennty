import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rate;

  RatingStars(this.rate);
  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();
    return Row(
      children: List<Widget>.generate(
              5,
              (index) => Icon(
                    (index < numberOfStars) ? Icons.star : Icons.star_outline,
                    size: 16,
                    color: Color(0xfffd6f19),
                  )) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
    );
  }
}
