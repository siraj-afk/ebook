import 'package:ebooks/bloc/ebook_bloc.dart';
import 'package:ebooks/repositery/model/ebookmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late List<Ebook> ebook;

  @override
  void initState() {
    BlocProvider.of<EbookBloc>(context).add(FetchEbookEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15.0.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Book ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontFamily: 'Playfair Display',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'Junction',
                        style: TextStyle(
                          color: Color(0xFFD1618A),
                          fontSize: 18.sp,
                          fontFamily: 'Playfair Display',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ])),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0.w),
                      child: Icon(Icons.notifications_none_outlined),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Search for books',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24))),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 38.w,
                      height: 31.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF929292)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: Color(0xFF929292),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 77.w,
                      height: 31.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF929292)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Romance',
                          style: TextStyle(
                            color: Color(0xFF929292),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 77.w,
                      height: 31.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF929292)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sci-fi',
                          style: TextStyle(
                            color: Color(0xFF929292),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 77.w,
                      height: 31.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF404066),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF404066)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Fantasy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 77.w,
                        height: 31.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF929292)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Classics',
                            style: TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Continue Reading',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Playfair Display',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 150,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Screen2()));
                    },
                    child: BlocBuilder<EbookBloc, EbookState>(
                      builder: (context, state) {
                        if (state is EbookblocLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is EbookblocError) {
                          return RefreshIndicator(
                              child: Center(child: Text('error')),
                              onRefresh: () async {
                                return BlocProvider.of<EbookBloc>(context)
                                    .add(FetchEbookEvent());
                              });
                        }
                        if (state is EbookblocLoaded) {
                          ebook = BlocProvider.of<EbookBloc>(context).ebook;
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 290,
                                height: 144,
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x0C000000),
                                        blurRadius: 50,
                                        offset: Offset(0, 10),
                                        spreadRadius: 0,
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 144,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFCBF5FF)),
                                      child: Center(
                                          child: Image.network(
                                              ebook[index].bookImage.toString(),
                                              width: 69.w,
                                              height: 105.h)),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'popo',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Playfair Display',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          ebook[index].bookAuthor.toString(),
                                          style: TextStyle(
                                            color: Color(0xFF505050),
                                            fontSize: 12,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          width: 150,
                                          height: 5,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFD9D9D9),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                          width: 109,
                                          height: 29,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF404066)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Update Progress',
                                              style: TextStyle(
                                                color: Color(0xFF404066),
                                                fontSize: 11,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 5.w,
                              );
                            },
                            itemCount: ebook.length,
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Best Sellers',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Playfair Display',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 400.h,
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: BlocBuilder<EbookBloc, EbookState>(
                      builder: (context, state) {
                        if (state is EbookblocLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is EbookblocError) {
                          return RefreshIndicator(
                              child: Center(child: Text('error')),
                              onRefresh: () async {
                                return BlocProvider.of<EbookBloc>(context)
                                    .add(FetchEbookEvent());
                              });
                        }
                        if (state is EbookblocLoaded) {
                          ebook = BlocProvider.of<EbookBloc>(context).ebook;
                          return GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 169 / 275,
                            shrinkWrap: true,
                            children: List.generate(4, (index) {
                              return Container(
                                width: 169.w,
                                height: 275.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 60,
                                      offset: Offset(0, 26),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 178.w,
                                      height: 178.h,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF5E9BC),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(4),
                                            bottomRight: Radius.circular(4),
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                          child: Image.asset(
                                              'assets/image 8.png')),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Book of Night',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'Playfair Display',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8.0),
                                                child: Container(
                                                  width: 37,
                                                  height: 16,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 4,
                                                      vertical: 2),
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFFFF8DF),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            'Holly Black',
                                            style: TextStyle(
                                              color: Color(0xFF505050),
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$9.99',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8.0),
                                                child: Icon(Icons
                                                    .arrow_circle_right_outlined),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
