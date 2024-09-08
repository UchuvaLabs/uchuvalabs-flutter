import 'package:flutter/material.dart';
import 'package:uchuvalabs/configs.dart' as cg;


class CustomButtonGeneral extends StatelessWidget {
  const CustomButtonGeneral({super.key,
    required this.mediaWidth,
    required this.txtBtn,
    required this.clickBtn,
    required this.buttonColor,
    this.textStyle,
  });

  final double mediaWidth;
  final String txtBtn;
  final Function? clickBtn;
  final Color buttonColor;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(clickBtn!=null){
          clickBtn!();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        height: 40,
        width: mediaWidth*0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: buttonColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4.0,
                spreadRadius: 1.0,
              )
            ]
        ),
        child: Center(child: Text(
          txtBtn,
          style: const TextStyle(fontSize: 12, color: Colors.white),
          textAlign: TextAlign.center,
        )
        ),
      ),
    );
  }
}

class CustomButtonIconGeneral extends StatelessWidget {
  const CustomButtonIconGeneral({super.key,
    required this.mediaWidth,
    this.mediaHeight,
    required this.txtBtn,
    required this.clickBtn,
    required this.buttonColor,
    this.textStyle,
    this.suffixWidget,
  });

  final double mediaWidth;
  final double? mediaHeight;
  final String txtBtn;
  final Function clickBtn;
  final Color buttonColor;
  final TextStyle? textStyle;
  final Widget? suffixWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickBtn();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        height: mediaHeight==null? 45 : mediaHeight!*0.08,
        width: mediaWidth*0.4,
        decoration: BoxDecoration(
            color: buttonColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4.0,
                spreadRadius: 1.0,
              )
            ]
        ),
        child: Center(
            child: Row(
              children: [
                const Expanded(
                    child: SizedBox()
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    txtBtn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: cg.mainTextColorButton
                    ),
                  ),
                ),
                Expanded(
                    child: suffixWidget ?? const SizedBox()
                ),
              ],
            )
        ),
      ),
    );
  }
}


class CustomButtonOutlinedGeneral extends StatelessWidget {
  const CustomButtonOutlinedGeneral({super.key,
    required this.mediaWidth,
    this.mediaHeight,
    required this.txtBtn,
    required this.clickBtn,
    required this.buttonColor,
    this.textStyle,
    required this.iconPath
  });

  final double mediaWidth;
  final double? mediaHeight;
  final String txtBtn;
  final Function clickBtn;
  final String iconPath;
  final Color buttonColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        clickBtn();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        height: mediaHeight == null ? 45 : mediaHeight! * 0.08,
        width: mediaWidth * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: buttonColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4.0,
                spreadRadius: 1.0,
              )
            ]
        ),
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconPath,
                  width: 20,
                  height: 20,
                ),
                if(size.width>800)const SizedBox(
                  width: 5,
                ),
                if(size.width>800)Text(
                  txtBtn,
                  style: TextStyle(
                      color: cg.mainTextColorButton
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
        ),
      ),
    );
  }
}

class CustomButtonDialog extends StatelessWidget {
  const CustomButtonDialog({super.key,
    required this.mediaWidth,
    required this.txtBtn,
    required this.clickBtn,
    required this.currentContext,
    required this.buttonColor,
    this.textStyle
  });

  final double mediaWidth;
  final String txtBtn;
  final BuildContext currentContext;
  final Function clickBtn;
  final Color buttonColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickBtn(currentContext);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17.5),
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        width: mediaWidth*0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: buttonColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4.0,
                spreadRadius: 1.0,
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(
            txtBtn,
            style: textStyle ??
                const TextStyle(
                    fontSize: 12,
                    color: Colors.white
                ),
            maxLines: 3,
            textAlign: TextAlign.center,)
          ),
        ),
      ),
    );
  }
}