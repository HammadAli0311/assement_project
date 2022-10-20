import 'package:assemement_test/apis.dart';
import 'package:assemement_test/constant/icons.dart';
import 'package:assemement_test/providers/movie_provider.dart';
import 'package:assemement_test/providers/video_provider.dart';
import 'package:assemement_test/screen/shimmer_search_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import 'movie_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  Future? movie;
  @override
  void initState() {
    super.initState();
    movie = Provider.of<MovieProvider>(context, listen: false).getMovies();
  }

  @override
  void dispose() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).getMovies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: PreferredSize(
          preferredSize: Size.fromHeight(height * .03),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: searchIcon,
                suffixIcon: closeIcon,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                filled: true,
                fillColor: textBackgroundColor,
                hintText: "TV shows, movies and more",
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50,
          ),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Top Results"),
              Divider(),
              FutureBuilder(
                  future: movie,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerSearchScreen();
                    } else {
                      if (snapshot.error != null) {
                        //
                        return const Center(
                          child: Text("An Error Occurred!"),
                        );
                      } else {
                        return Consumer<MovieProvider>(
                          builder: (context, movie, child) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              ListView.builder(
                                physics: const ScrollPhysics(
                                  parent: ScrollPhysics(),
                                ),
                                shrinkWrap: true,
                                itemCount: movie.allMovies.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => {
                                      Provider.of<VideoProvider>(context,
                                              listen: false)
                                          .getVideoId(
                                              '${movie.allMovies[index].id}'),
                                      Navigator.pushNamed(
                                          context, MovieDetailScreen.routeName,
                                          arguments: movie.allMovies[index]),
                                    },
                                    child: Container(
                                      height: height * .15,
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: FadeInImage(
                                                  width: width / 3,
                                                  fit: BoxFit.fill,
                                                imageErrorBuilder: (context,Object,StackTrace){
                                                 return Image.asset(
                                                      "assets/image.png"
                                                  );
                                                },
                                                image: NetworkImage(
                                                  imagePath +
                                                      movie.allMovies[index]
                                                          .posterPath,
                                                ),
                                                placeholder: AssetImage(
                                                  "assets/image.png"
                                                ),

                                              )),
                                          Expanded(
                                              child: ListTile(
                                            title: Text(
                                              movie.allMovies[index].title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              "---",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
