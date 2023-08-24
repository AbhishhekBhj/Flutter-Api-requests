import 'package:blocapirequests/features/posts/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostBloc postBloc = PostBloc();
  @override
  void initState() {
    postBloc.add(PostFetchInitalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.add(PostAddEvent());
        },
        child: Icon(Icons.add),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostFetchingLoadingState:
              return Center(child: CircularProgressIndicator());
            case PostSuccessfulFetchingState:
              final successState = state as PostSuccessfulFetchingState;

              return Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.all(16.0),
                      color: Colors.blueGrey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(successState.posts[index].title),
                          Text(successState.posts[index].body)
                        ],
                      ),
                    );
                  },
                  itemCount: successState.posts.length,
                ),
              );

            case PostFetchingErrorState:
              return Container(
                child: Center(
                  child: Text(
                    "Some Error Occurred",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
