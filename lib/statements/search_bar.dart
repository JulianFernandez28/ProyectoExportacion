import 'package:flutter/material.dart';


class SearchBad extends StatelessWidget {
  const SearchBad({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
           margin: const EdgeInsets.all(20),
          child: Column(

            children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      cursorColor:Color.fromARGB(255, 0, 0, 0),
                      decoration: InputDecoration(
                        fillColor:const  Color.fromARGB(255, 179, 179, 179),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18
                        ),
                        prefixIcon: Container(
                          
                          padding: const EdgeInsets.all(15),
                          width: 18,
                          child: Image.network('https://cdn-icons-png.flaticon.com/512/3917/3917754.png'),
                                                  )
                      ),
                    ),
                  ),
                 
                ],
              )
            ],
          ),
        );
  }
}