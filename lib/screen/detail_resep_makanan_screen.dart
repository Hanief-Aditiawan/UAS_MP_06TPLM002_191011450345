import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/resep_makanan_cubit.dart';

class DetailResepMakananScreen extends StatefulWidget {
  // Tambahkan parameter keyResepMakanan untuk menerima key dari ResepMakananScreen
  final String? linkResepMakanan;
  final String? imageResepMakanan;
  final String? descriptionResepMakanan;
  const DetailResepMakananScreen({
    Key? key,
    this.linkResepMakanan,
    this.imageResepMakanan,
    this.descriptionResepMakanan,
  }) : super(key: key);

  @override
  State<DetailResepMakananScreen> createState() =>
      _DetailResepMakananScreenState();
}

class _DetailResepMakananScreenState extends State<DetailResepMakananScreen> {
  // Tambahkan cubit->ResepMakananCubit di screen->DetailResepMakananScreen
  final ResepMakananCubit resepMakananCubit = ResepMakananCubit();

  // Tambahkan initState
  @override
  void initState() {
    // Panggil getDetailDataResepMakanan yang ada di ResepMakananCubit
    resepMakananCubit.getDetailDataResepMakanan(widget.linkResepMakanan!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.imageResepMakanan!),
      ),
      body: BlocBuilder<ResepMakananCubit, ResepMakananState>(
        bloc: resepMakananCubit,
        builder: (context, state) {
          if (state is ResepMakananInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            children: [
              Image.network(widget.descriptionResepMakanan!),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  resepMakananCubit.detailResepMakananModel.results!.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    resepMakananCubit
                        .detailResepMakananModel.results!.servings!,
                  ),
                  Text(
                    resepMakananCubit.detailResepMakananModel.results!.times!,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    resepMakananCubit.detailResepMakananModel.results!.desc!),
              ),
            ],
          );
        },
      ),
    );
  }
}
