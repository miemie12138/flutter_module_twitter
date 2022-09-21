import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/my_navigator.dart';

///新版弹窗样式
class DialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final String cancleText;
  final String comfrimText;

  const DialogWidget({Key? key, this.title='', this.content='', this.cancleText = '取消', this.comfrimText = '确定'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 60),
      child: Material(
          type: MaterialType.transparency,
          child: Container(
            alignment: Alignment.center,
            child: Container(
              margin:const EdgeInsets.only(top: 60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.white,
                  width: 315,
                  height: 225,
                  constraints:const BoxConstraints(minHeight: 140),
                  child: Column(
                    children: [
                      Container(
                        margin:const EdgeInsets.only(top: 30),
                        child: Text(
                          title,
                          style:const TextStyle(fontSize: 18, color: Color(0xff393734), fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin:const EdgeInsets.only(top: 30, left: 22.5, right: 22.5),
                          child: Text(
                            content,
                            style:const TextStyle(fontSize: 14, color: Color(0xff393734)),
                          ),
                        ),
                      ),
                      Container(
                        padding:const EdgeInsets.only(bottom: 30, left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  alignment: Alignment.center,

                                  decoration: BoxDecoration(
                                      borderRadius:const BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(color:const Color(0xff979797), width: 0.5)),

                                  padding:const EdgeInsets.symmetric(vertical: 9, horizontal: 28),
                                  child: Text(
                                    cancleText,
                                    style:const TextStyle(fontSize: 16, color: Color(0xff505257)),
                                  ),
                                ),
                                onTap: () {
                                  MyNavigator.pop();
                                },
                              ),
                            ),
                           const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  NavigatorManager.pop(data: true);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: Color(0xfff85457),
                                  ),
                                  padding:const EdgeInsets.symmetric(vertical: 9, horizontal: 28),

                                  child: Text(
                                    comfrimText,
                                    style:const TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ),

                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
