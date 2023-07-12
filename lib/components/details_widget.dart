import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({Key? key, required this.formList, required this.index})
      : super(key: key);
  final formList;
  final index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(8),
          color: Colors.deepPurple.withOpacity(0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                ' id : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(formList[index].id.toString()),

              const Text(
                ' Title : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(formList[index].title.toString()),
              const Text(
                ' Description : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  formList[index].description.toString(),
                  overflow: TextOverflow.clip,
                ),
              ),
              const Text(
                ' Type : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  formList[index].type.toString(),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
