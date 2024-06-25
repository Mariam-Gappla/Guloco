import 'data.dart';

class Profile {
	bool? success;
	Data? data;

	Profile({this.success, this.data});

	factory Profile.fromJson(Map<String, dynamic> json) => Profile(
				success: json['success'] as bool?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'success': success,
				'data': data?.toJson(),
			};
}
