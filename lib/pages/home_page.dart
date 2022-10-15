import 'package:abctechapp/controller/assist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/assist.dart';

class HomePage extends GetView<AssistController> {
  const HomePage({super.key});

  Widget renderAssists(List<Assist> assists) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: assists.length,
        itemBuilder: ((context, index) => ListTile(
              title: Text(
                assists[index].name,
              ),
              selectedColor: Colors.red,
              selected: controller.isSelected(index),
              onTap: (() => controller.selectAssist(index)),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de serviços'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Os serviços disponíveis são:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
              controller.obx(
                (state) => renderAssists(state ?? []),
                onEmpty: const Text('Nenhuma assistência disponível'),
                onError: (error) => Text(error.toString()),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() => controller.finshSelectAssists()),
          child: const Icon(Icons.done)),
    );
  }
}
