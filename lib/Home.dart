
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:garden_app/Resources/ImagePath.dart' as imagePath;
import 'package:garden_app/Resources/ColorsValue.dart' as c;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Iterable filteredPlant = [];
  TextEditingController _searchController=TextEditingController();
  bool searchEnabled = false;
  String _searchQuery = '';
  final List<DataModel> plantList = [
    DataModel(id: 1, name: 'Item 1', image: imagePath.plant1),
    DataModel(id: 2, name: 'Item 2', image: imagePath.plant2),
    DataModel(id: 3, name: 'Item 3', image: imagePath.plant8),
    DataModel(id: 4, name: 'Item 4', image: imagePath.plant4),
    DataModel(id: 5, name: 'Item 5', image: imagePath.plant1),
    DataModel(id: 6, name: 'Item 6', image: imagePath.plant2),
    DataModel(id: 7, name: 'Item 7', image: imagePath.plant9),
    DataModel(id: 8, name: 'Item 8', image: imagePath.plant4),
  ];
  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an app'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              //return true when click on "Yes"
              child: Text('Yes'),
            ),
          ],
        ),
      ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: c.colorPrimary,
            centerTitle: true,
            elevation: 2,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Garden App',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        child: Image.asset(
                          imagePath.logout,
                          color: c.white,
                          // fit: BoxFit.contain,
                          height: 25,
                          width: 25,
                        ),
                        onTap: () async {
                          logout();
                        }),
                  )
                ],
              ),
            ),
          ),
          body:SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                    children:[
                      Container(
                        child: Image.asset(
                          imagePath.plant8,
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                      ),
                      Neumorphic(
                        margin: EdgeInsets.only(top: 170,left: 30,right: 30,bottom: 20),
                        style: NeumorphicStyle(
                          depth: -5,
                          color: c.white,
                        ),
                        child: Container(
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(10,5, 10, 5),
                          color: c.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Container(
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                        child: AnimationLimiter(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:plantList.length,
                            // itemCount: houseList == null ? 0 : houseList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = plantList[index];
                              return  AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 300),
                                child: SlideAnimation(
                                  verticalOffset: 100.0,
                                  child: FlipAnimation(
                                    child: InkWell(
                                      onTap: () {
                                      },
                                      child: Container(
                                        width: 100,
                                                    height: 80,
                                        margin:  EdgeInsets
                                            .symmetric(
                                            horizontal: 10,
                                            vertical: 10),
                                        child: Neumorphic(
                                          style:
                                          const NeumorphicStyle(
                                              lightSource: LightSource.topRight,
                                              depth: -5,
                                              color:
                                              Colors.white),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 100,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                      color:
                                                      c.light_green,
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(
                                                              5),
                                                          topRight: Radius
                                                              .circular(
                                                              5),
                                                          bottomRight: Radius
                                                              .circular(
                                                              5),
                                                          bottomLeft: Radius
                                                              .circular(
                                                              5))),
                                                  child:Padding(padding: EdgeInsets.only(right: 10),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Image.asset(
                                                          plantList[index].image,
                                                          width: 30,
                                                          height: 30,
                                                          fit: BoxFit
                                                              .cover,
                                                        ),
                                                      ],
                                                    ),)
                                              ),
                                              Container(
                                                child: Padding(padding: EdgeInsets.only(top: 20),
                                                  child:  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          child: Padding(padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  plantList[index].name,
                                                                  style:
                                                                  TextStyle(
                                                                    fontSize: 12,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                    color: c.grey_9,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                      ),
                                                    ],
                                                  ),),)
                                            ],
                                          ),
                                        ),
                                      ),),),
                                ),
                              );
                            },
                          ),
                        ))    ,

                            ],
                          ),
                        ),
                      ),]
                ),
                Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child:Padding(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Text(
                              'Plant List',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: c.primary_text_color2,fontWeight: FontWeight.bold),
                            ),
                          )
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          height: 35,
                          child:Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                            child: TextField(
                              controller: _searchController,
                              onChanged: (value) {
                                onSearchQueryChanged(value);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(fontSize: 13),
                                contentPadding: EdgeInsets.only(top: 4, bottom: 10, left: 10, right: 0),
                                filled: true,
                                fillColor: c.grey_2,
                                suffixIcon: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: c.colorPrimary,
                                        ),
                                        color: c.colorPrimary,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                    child: InkWell(
                                      onTap: () {

                                      },
                                      child: Icon(
                                        Icons.search,
                                        color: c.white,
                                        size: 22,
                                      ),
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 0.2, color: c.grey_2),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                              ),
                            ),)
                      ),
                      /*  Container(
                        margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                        child: AnimationLimiter(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:searchEnabled
                                ? filteredHouse.length
                                : plantList.length,
                            // itemCount: houseList == null ? 0 : houseList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item =searchEnabled
                                  ? filteredHouse.elementAt(index)
                                  : plantList[index];
                              return  AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 800),
                                child: SlideAnimation(
                                  horizontalOffset: 200.0,
                                  child: FlipAnimation(
                                    child: InkWell(
                                      onTap: () {
                                      },
                                      child: Container(
                                        width: 350,
                                                    height: 150,
                                        margin:  EdgeInsets
                                            .symmetric(
                                            horizontal: 0,
                                            vertical: 10),
                                        child: Neumorphic(
                                          style:
                                          const NeumorphicStyle(
                                              lightSource: LightSource.topRight,
                                              depth: -5,
                                              color:
                                              Colors.white),
                                          child: Row(
                                            children: [
                                              Container(
                                                  width: 150,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      color:
                                                      c.colorAccent4,
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(
                                                              0),
                                                          topRight: Radius
                                                              .circular(
                                                              155),
                                                          bottomRight: Radius
                                                              .circular(
                                                              15),
                                                          bottomLeft: Radius
                                                              .circular(
                                                              0))),
                                                  child:Padding(padding: EdgeInsets.only(right: 10),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Image.asset(
                                                          "${item['img'].toString()}",
                                                          width: 30,
                                                          height: 30,
                                                          fit: BoxFit
                                                              .cover,
                                                        ),
                                                      ],
                                                    ),)
                                              ),
                                              Container(
                                                child: Padding(padding: EdgeInsets.only(top: 20),
                                                  child:  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          child: Padding(padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "${item['name'].toString()}",
                                                                  style:
                                                                  TextStyle(
                                                                    fontSize: 12,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                    color: c.grey_9,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                      ),
                                                    ],
                                                  ),),)
                                            ],
                                          ),
                                        ),
                                      ),),),
                                ),
                              );
                            },
                          ),
                        ))    ,*/
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          child: AnimationLimiter(
                            child:  ReorderableListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              buildDefaultDragHandles: false,
                              onReorder: (oldIndex, newIndex) {
                                setState(() {
                                  if (newIndex > oldIndex) {
                                    newIndex -= 1;
                                  }
                                  // final item = plantList.removeAt(oldIndex);
                                  final item = searchEnabled
                                      ? filteredPlant.toList().removeAt(oldIndex)
                                      : plantList.removeAt(oldIndex);
                                  if (searchEnabled) {
                                    filteredPlant.toList().insert(newIndex, item);
                                  }else{
                                    plantList.insert(newIndex, item);
                                  }

                                });
                              },
                              children: (searchEnabled
                                  ? filteredPlant.toList() : plantList).map((item) {
                                return _buildListItem(item);
                              }).toList(),
                            ),
                          ))    ,

                    ]) ],
            ),
          )
      ),
    );
  }

  Widget _buildListItem(DataModel item) {
    return  Dismissible(key: Key(item.id.toString()),
        background: Container(
          width: 350,
          height: 150,
          margin:  EdgeInsets
              .symmetric(
              horizontal: 0,
              vertical: 10),
          color: Colors.red,
          child: Icon(Icons.delete, color: Colors.white),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 16.0),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          setState(() {
            plantList.remove(item);
            filteredPlant.toList().remove(item);
          });
        },

        child: Container(

      width: 350,
      height: 150,
      margin:  EdgeInsets
          .symmetric(
          horizontal: 0,
          vertical: 10),
      child: ReorderableDragStartListener(
    index: searchEnabled
        ? filteredPlant.toList().indexOf(item) : plantList.indexOf(item),
    child:Neumorphic(
        style:
        const NeumorphicStyle(
            lightSource: LightSource.topRight,
            depth: -5,
            color:
            Colors.white),
        child: Row(
          children: [
            Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color:
                    c.colorAccent4,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius
                            .circular(
                            0),
                        topRight: Radius
                            .circular(
                            155),
                        bottomRight: Radius
                            .circular(
                            15),
                        bottomLeft: Radius
                            .circular(
                            0))),
                child:Padding(padding: EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item.image,
                        width: 30,
                        height: 30,
                        fit: BoxFit
                            .cover,
                      ),
                    ],
                  ),)
            ),
            Container(
              child: Padding(padding: EdgeInsets.only(top: 20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Padding(padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style:
                                TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight
                                      .normal,
                                  color: c.grey_9,
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),),)
          ],
        ),
      ),
      ),
    ));
  }

  void onSearchQueryChanged(String query) {
    searchEnabled = true;
    query!=null && query !="" ? _searchQuery = query.toLowerCase():_searchQuery ="";
    filteredPlant = plantList.where((item) {
      final name = item.name.toLowerCase();
      return name.contains(_searchQuery) ;
    });
  }

  void logout() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }

}
class DataModel {
  final int id;
  final String name;
  final String image;

  DataModel({required this.id, required this.name, required this.image});
}

