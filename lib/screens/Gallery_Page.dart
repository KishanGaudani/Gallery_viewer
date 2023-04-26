// ignore_for_file: avoid_print, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:procamera/globals/global.dart';
import 'package:procamera/helpers/api_helpers.dart';
import 'package:procamera/model/models.dart';

class GalleryPAge extends StatefulWidget {
  const GalleryPAge({Key? key}) : super(key: key);

  @override
  State<GalleryPAge> createState() => _GalleryPAgeState();
}

class _GalleryPAgeState extends State<GalleryPAge> {


  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Gallery App",style: TextStyle(color: Colors.white),),
      ),
      backgroundColor:  Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSearchTextField(
                  controller: searchController,
                  onSubmitted: (val) {
                    setState(() {
                      Global.searchData = val;
                    });
                  },
                  placeholder: "Search Image",
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(8),
                ),
              ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "popular words",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.45,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          word(text: "Gujarat", e: 'https://img.nayatrip.com/images/state/big/GUJARAT.jpg'),
                          word(text: "Maharashtra", e: 'https://www.shutterstock.com/image-vector/popular-city-maharashtra-india-260nw-1965512662.jpg'),
                          word(text: "Assam", e: 'https://www.incredible-northeastindia.com/images/assam-head.jpg'),
                          word(text: "Goa", e: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/33/fc/f0/goa.jpg?w=700&h=500&s=1'),
                          word(text: "Kerala", e: 'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8a2VyYWxhfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: 20,),
                          word(text: "Madhya Pradesh", e: 'https://static.toiimg.com/photo/msid-80110775,width-96,height-65.cms'),
                          word(text: "Manipur", e: 'https://www.holidify.com/images/bgImages/MANIPUR.jpg'),
                          word(text: "Tamil Nadu", e: 'https://cdn.britannica.com/73/140973-050-6212C556/Shore-Temple-Mamallapuram-Seven-Pagodas-Tamil-Nadu.jpg'),
                          word(text: "Tripura", e: 'https://img.traveltriangle.com/blog/wp-content/uploads/2019/11/Things-To-Do-In-Tripura-2_dec.jpg'),
                          word(text: "Telangana", e: 'https://www.holidify.com/images/tooltipImages/TELANGANA.jpg'),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          word(text: "Andhra Pradesh", e: 'https://media.istockphoto.com/id/1285898933/photo/tall-buddha-statue-in-andhra-pradesh-state-amaravathi-india.jpg?b=1&s=170667a&w=0&k=20&c=jZZBvoZYUGJrbvKbgqPjRVSb8-KrwWt723ldeHP3Erw='),
                          word(text: "Arunachal Pradesh", e: 'https://images.unsplash.com/photo-1626761627604-f27d98885f4b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXJ1bmFjaGFsJTIwcHJhZGVzaHxlbnwwfHwwfHw%3D&w=1000&q=80'),
                          word(text: "Bihar", e: 'https://media.istockphoto.com/id/1331301616/photo/lalit-narayan-mithila-university-is-also-known-as-lnmu-is-located-in-darbhanga-bihar-india.jpg?b=1&s=170667a&w=0&k=20&c=bi7A6ISFM6xlMk-1wa6p_k4sdyJHygtuRWMNyvZpYys='),
                          word(text: "Chhattisgarh", e: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgOhZN1Q4OJJrMyPsELErOc6B_x-h3BQX9yg8btJLsgA&s'),
                          word(text: "Haryana", e: 'https://images.unsplash.com/photo-1605469237567-a39930679526?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGFyeWFuYSUyQyUyMGluZGlhfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Photos",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FutureBuilder(
                future: ApiHelpers.apiHelpers.getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error is : ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    List<Provider>? data = snapshot.data;
                    return (data != null)
                        ? GridView.builder(
                            itemCount: data.length,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 300,
                                    childAspectRatio: 1 / 4),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: (){
                                  print(data[i].image);
                                  Navigator.of(context).pushNamed("details",arguments: data[i].image);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.3),
                                          Colors.white.withOpacity(0.6)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(data[i].image),
                                        fit: BoxFit.cover),
                                    border:
                                        Border.all(color: Colors.black, width: 2),
                                  ),
                                ),
                              );
                            })
                        : const Center(
                            child: Text("Data is Not Founds ...."),
                          );
                  }
                  return Center(
                    child: LoadingAnimationWidget.discreteCircle(color: Colors.white, size: 50),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  word({required String text,required String e}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            Global.searchData = text;
            searchController.clear();
            searchController.text = text;
          });
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        child: Column(
          children: [
            Image.network(e,height: 100,width: 100,),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
