import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/funcs.dart';
import 'package:flutter_base_pkg/widgets/my_scaffold.dart';
import 'package:flutter_base_pkg/widgets/unfocus_widget.dart';
import 'package:provider/provider.dart';
import 'package:twitter/home/release/release_post_viewmodel.dart';

// import '../widgets/mult_imagepicker_widget.dart';
import '../widgets/my_clip_circle_weight.dart';
import '../widgets/post_dialog.dart';

///发布动态
class ReleasePostPage extends StatelessWidget {
  const ReleasePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReleasePostViewModel(),
      builder: (context, _) {
        final vm = context.watch<ReleasePostViewModel>();
        return UnFocusWidget(
          child: MyScaffold(
            title: '发帖',
            actions: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Text(
                  '发布',
                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                ),
                onPressed: () async {
                  if (debounce()) return;
                  vm.releasePost();
                },
              ),
              const SizedBox(width: 6),
            ],
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const MyClipCircleWeight(
                          headImg: "",
                          size: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return PostDialog(
                                    callBack: (value) {
                                      vm.type = value;
                                    },
                                  );
                                });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 20,
                            width: 52,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: const Color(0xff2DC3B5)),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(
                              vm.type,
                              style:
                                  const TextStyle(fontSize: 14, color: Color(0xff393734), fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        maxLines: 6,
                        maxLength: 300,
                        focusNode: vm.focusNode,
                        decoration: const InputDecoration(
                            hintText: '请填写您的帖子内容',
                            contentPadding: EdgeInsets.zero,
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xffBEBEBE),
                            ),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.5)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.5))),
                        onChanged: (value) {
                          vm.content = value;
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(15),
                    //   child: MultImagePickerWidget(
                    //     maxImages: 9,
                    //     valueChanged: (value) {
                    //       vm.images = value;
                    //       vm.focusNode.unfocus();
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
