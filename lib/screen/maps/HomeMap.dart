import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/bloc/camera_bloc.dart';
import 'package:plant_app/camera/CameraHome.dart';
import 'package:plant_app/screen/maps/MapPage.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  String? alamatDipilih;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.map, color: Colors.blue),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapPage(),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          alamatDipilih = result;
                        });
                      }
                    },
                  ),
                ],
              ),

              alamatDipilih == null
                  ? const Text('Tidak Ada Alamat Yang Dipilih')
                  : Text(alamatDipilih!),

              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: alamatDipilih != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => CameraBloc(),
                              child: Camerahome(alamat: alamatDipilih!),
                            )
                          )
                        );
                      }
                    : null,
                icon: const Icon(Icons.send),
                label: const Text('Kirim ke Camerahome'),
              ),
            ],
          ),
        )
      ),
    );
  }
}