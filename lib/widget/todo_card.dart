// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String vartittle;
  final bool Donnt;
  final Function myfunc;
  final int ind;
  final Function delete;

  TodoCard({
    super.key,
    required this.vartittle,
    required this.Donnt,
    required this.myfunc,
    required this.ind,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(ind);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartittle,
                style: TextStyle(
                    color: Donnt ? Colors.black : Colors.white,
                    fontSize: 20,
                    decoration: Donnt
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Row(
                children: [
                  Icon(
                    Donnt ? Icons.check : Icons.close,
                    size: 27,
                    color: Donnt ? Colors.green[400] : Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(ind);
                    },
                    icon: const Icon(Icons.delete),
                    iconSize: 25,
                    color: Color.fromARGB(255, 230, 202, 202),
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(26, 238, 238, 238),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
