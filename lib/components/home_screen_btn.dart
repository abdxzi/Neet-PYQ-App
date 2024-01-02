import 'package:flutter/material.dart';

class HomeSceenBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final String imagePath;

  const HomeSceenBtn({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Material(
        color: const Color.fromARGB(255, 51, 51, 51),
        child: InkWell(
          // splashColor: Colors.blue,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      imagePath,
                      width: 40.0,
                      height: 40.0,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight:FontWeight.bold ,
                        ),
                    )
                  ],
                ),
                const Icon(Icons.arrow_forward,
                  color: Color.fromARGB(255, 203, 203, 203),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
