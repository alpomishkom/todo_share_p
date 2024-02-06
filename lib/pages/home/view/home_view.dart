import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todu_stateles_managment/pages/home/controller/todu_conttroller.dart';
import '../controller/then_conttroller.dart';
import '../model/model.dart';
import '../service/service.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tudoService = Provider.of<DBService>(context);
    var themController = Provider.of<ThemeController>(context);

    final TextEditingController title = TextEditingController();
    final TextEditingController decription = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              themController.changeTheme();
            },
            icon: Icon(
              themController.currentTheme == ThemeMode.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: Consumer<DBService>(builder: (context, con, child) {
        return ListView.builder(
          itemCount: con.todoList.length,
          itemBuilder: (_, index) {
            var slashindex = tudoService.todoList[index].indexOf('/');
            var barobarIndex = tudoService.todoList[index].indexOf('=');
            var titleText =
                tudoService.todoList[index].substring(0, slashindex);
            var sutatleText = tudoService.todoList[index].substring(
              slashindex+1,barobarIndex
            );
            var isCkekt = tudoService.todoList[index].substring(
              barobarIndex + 1,
            );
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Colors.white,
                child: ListTile(
                  leading: Checkbox(
                    value: isCkekt == 'true' ? true : false,
                    onChanged: (value) {
                      var a;
                      a = isCkekt == 'true' ?  tudoService.todoList[index].replaceAll("true", "false"): tudoService.todoList[index].replaceAll("false", "true") ;
                      tudoService.update(index, a);
                    },
                  ),
                  title: Text(titleText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: title,
                                      decoration: InputDecoration(
                                        hintText: "Title",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: decription,
                                      decoration: InputDecoration(
                                        hintText: "Description",
                                        // Corrected typo here
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      String a = '${title.text}/${decription.text}=$isCkekt';
                                      tudoService.update(index, a);
                                      Navigator.pop(context);
                                      title.clear();
                                      decription.clear();
                                    },
                                    child: const Text("Save"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Close",
                                    ), // Corrected typo here
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.refresh),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<DBService>().remove(index);
                        },
                        icon: const Icon(CupertinoIcons.delete),
                      ),
                    ],
                  ),
                  subtitle: Text(sutatleText),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: title,
                        decoration: InputDecoration(
                          hintText: "Title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: decription,
                        decoration: InputDecoration(
                          hintText: "Description", // Corrected typo here
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      )
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        String a = '${title.text}/${decription.text}=${false}';
                        tudoService.add(a);
                        Navigator.pop(context);
                      },
                      child: const Text("Save"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close"), // Corrected typo here
                    ),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: CupertinoColors.white,
        ),
      ),
    );
  }
}
