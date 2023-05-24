import 'package:flutter/material.dart';

class QuestionItemWidget extends StatelessWidget {
  const QuestionItemWidget(
      {required this.title, required this.subTitle, this.onItemClick, Key? key})
      : super(key: key);

  final VoidCallback? onItemClick;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemClick != null
          ? () {
              onItemClick!();
            }
          : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Stack(
                children: const [
                  Visibility(
                    visible: false,
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        color: Color(0xffD9DBE9),
                        valueColor: AlwaysStoppedAnimation(
                          Color(0xff7C3AED),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Icon(
                      Icons.lock,
                      size: 20,
                      color: Color(0xffD9DBE9),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4E4B66),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6E7191),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
