import 'package:dio/dio.dart';
import 'package:uas_mp/model/detail_resep_makanan_model.dart';

import '../model/resep_makanan_model.dart';

class ResepMakananRequest {
  // Tambahkan Function untuk request untuk Data Resep Makanan
  Future<ResepMakananModel> getResepMakanan() async {
    Response response = await Dio()
        .get('https://api-berita-indonesia.vercel.app/antara/terbaru');
    return ResepMakananModel.fromJson(response.data);
  }

  // Tambahkan Function untuk request untuk Data Detail Resep Makanan
  Future<DetailResepMakananModel> getDetailResepMakanan(String key) async {
    Response response = await Dio()
        .get('https://api-berita-indonesia.vercel.app/antara/terbaru' + key);
    return DetailResepMakananModel.fromJson(response.data);
  }
}
