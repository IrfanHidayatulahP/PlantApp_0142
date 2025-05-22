import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/bloc/camera_bloc.dart';

class Camerahome extends StatelessWidget {
  const Camerahome({
    super.key, 
    required this.alamat
  });

  final String alamat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: BlocConsumer<CameraBloc, CameraState>(
          listener: (context, state) {
            if (state is CameraReady && state.snackBarMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.snackBarMessage!)),
              );
              context.read<CameraBloc>().add(ClearSnackBar());
            }
          },
          builder: (context, state) {
            final File? imageFile = (state is CameraReady) ? state.imageFile : null;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),

                  // Foto Profil Hanya Jika Ada Gambar
                  if (imageFile != null) ...[
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(imageFile),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ipan',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Gamer',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Alamat: $alamat',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],

                  const Divider(height: 32, thickness: 1),

                  // Tombol kamera dan galeri
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Ambil Foto'),
                          onPressed: () {
                            final bloc = context.read<CameraBloc>();
                            if (bloc.state is! CameraReady) {
                              bloc.add(InitializeCamera());
                            }
                            bloc.add(OpenCameraAndCapture(context));
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.photo),
                          label: const Text('Dari Galeri'),
                          onPressed: () => context.read<CameraBloc>().add(PickImageFromGallery()),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Pratinjau gambar jika tersedia
                  // imageFile != null
                  //     ? Column(
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Image.file(
                  //               imageFile,
                  //               width: double.infinity,
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //           Text('Disimpan di: ${imageFile.path}'),
                  //           const SizedBox(height: 8),
                  //           ElevatedButton.icon(
                  //             icon: const Icon(Icons.delete),
                  //             label: const Text('Hapus Gambar'),
                  //             onPressed: () => context.read<CameraBloc>().add(DeleteImage()),
                  //           ),
                  //         ],
                  //       )
                  //     : const Padding(
                  //         padding: EdgeInsets.all(16.0),
                  //         child: Text(
                  //           'Belum ada gambar yang diambil/dipilih',
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
