import 'package:dio/dio.dart';
import 'package:http_app/post.dart';

class PostRepository{
  final dio = Dio();
  
  Future<Post> findByID(int id) async{
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    Post user = Post.fromJson(response.data);
   return user;



    }

  Future<List<Post>> findAll() async{
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    List<dynamic> mapList=response.data;
    return mapList.map((e) => Post.fromJson(e)).toList();

    print(response.data);
  }
}