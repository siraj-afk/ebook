import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Screen2 extends StatefulWidget {
final String image;
final String title;
final String author;
final String description;


  const Screen2({super.key,required this.image,required this.title,required this.author,required this.description});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0,top: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(onTap: (){
                      Navigator.pop(context);
                    },
                        child: Icon(Icons.arrow_circle_left_outlined,size: 30,)),
                    SizedBox(width: 80.w),
                    Text(  widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Playfair Display',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    widget.author,
                    style: TextStyle(
                      color: Color(0xFF686868),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Center(
                  child: Container(
                    width: 152.w,
                    height: 240.h,
                    decoration: BoxDecoration(

                      boxShadow: [
                        BoxShadow(
                          color: Color(0x66193130),
                          blurRadius: 50,


                        )
                      ],

                    ),
                    child: Image.network(widget.image,fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 30.h,),
                Center(
                  child: Container(
                    width: 295,
                    height: 54,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x0C000000),
                          blurRadius: 50,
                          offset: Offset(0, 24),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 37,
                            height: 16,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFF8DF),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 13,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '4.0',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                          ),
                      Container(
                        width: 66,
                        height: 23,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE2FBFA),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Center(
                          child: Text( 'Fantasy',
                            style: TextStyle(
                              color: Color(0xFF153337),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),),
                        ),
                      ),
                          Padding(
                            padding:  EdgeInsets.only(right: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '432',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),

                                  TextSpan(
                                    text: 'Pages',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Text(
                  'Synopsis',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Playfair Display',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                SizedBox(height: 20.h,),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),
                SizedBox(height: 50.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
