import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Why extends StatelessWidget {
  const Why({super.key});

  @override
  Widget build(BuildContext context) {

    var size = Get.size;
    RxBool menuclicked =false.obs;
    
    return  Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      menuclicked.value = !menuclicked.value ;
                    },
                    child: const Icon(Icons.menu),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Obx(() => 
                     Stack(
                        children: [
                          AnimatedContainer(
                            duration:const Duration(milliseconds: 600),
                            curve: Curves.easeOut,
                            width: menuclicked.value ? size.width : size.width * .4,
                            height: size.width* 1.4,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular( menuclicked.value? 20 : 90),
                            ),
                          ),
                          AnimatedPositioned(
                            duration:const Duration(milliseconds: 600),
                            curve: Curves.easeOut,
                            right: 0,
                            top: menuclicked.value? 150 : 0,
                            child: Padding(
                              padding: EdgeInsets.all(menuclicked.value? 15: 0),
                              child: AnimatedContainer(
                                duration:const Duration(milliseconds: 600),
                                curve: Curves.easeOut,
                                width: menuclicked.value? size.width - 50 -30: size.width * .4,
                                height: menuclicked.value? size.width / 2.50 + 50: size.width * .3,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(170, 111, 111, 111),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration:const Duration(milliseconds: 600),
                            curve: Curves.easeOut,
                            right: menuclicked.value? 18 : 0,
                            bottom: menuclicked.value? size.width / 2.2 - 100: 0,
                            child: AnimatedContainer(
                              duration:const Duration(milliseconds: 600),
                              curve: Curves.easeOut,
                              width: menuclicked.value? size.width * .09 : size.width * .4,
                              height: menuclicked.value? size.width * .09 : size.width * .17,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(146, 241, 0, 249),
                                borderRadius: BorderRadius.circular(90),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}