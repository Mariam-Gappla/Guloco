import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'pic_products_state.dart';

class PicProductsCubit extends Cubit<PicProductsState> {
  PicProductsCubit() : super(PicProductsInitial());
  static PicProductsCubit get(context) => BlocProvider.of(context);
  File? selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      emit(ImagePickedState());
    } else {
      print('No image selected.');
      emit(ImagePickErrorState());
    }
  }

  Future<void> uploadImage() async {
    if (selectedImage == null) return;

    String uploadUrl =
        'http://nouraapi.runasp.net/api/upload'; // رابط الخادم الخاص بك

    try {
      var response = await DioHelper().uploadImage(
        url: uploadUrl,
        image: selectedImage!,
      );

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        emit(ImageUploadSuccessState());
      } else {
        print('Image upload failed');
        emit(ImageUploadErrorState());
      }
    } catch (e) {
      print('Error: $e');
      emit(ImageUploadErrorState());
    }
  }
}
