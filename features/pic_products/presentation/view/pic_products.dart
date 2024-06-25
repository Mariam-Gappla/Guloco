import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/pic_products/presentation/manager/cubit/pic_products_cubit.dart';

class PicProductsView extends StatelessWidget {
  const PicProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PicProductsCubit(),
      child: BlocConsumer<PicProductsCubit, PicProductsState>(
        listener: (context, state) {
          if (state is ImageUploadSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image uploaded successfully!')),
            );
          } else if (state is ImageUploadErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image upload failed!')),
            );
          }
        },
        builder: (context, state) {
          var cubit = PicProductsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('Pick and Upload Image'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (cubit.selectedImage != null)
                    Image.file(
                      cubit.selectedImage!,
                      height: 200,
                      width: 200,
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      cubit.pickImage();
                    },
                    child: const Text('Pick Image'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      cubit.uploadImage();
                    },
                    child: const Text('Upload Image'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
