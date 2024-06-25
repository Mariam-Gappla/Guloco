class UpdateProfile {
	String? message;

	UpdateProfile({this.message});

	factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
				message: json['message'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
			};
}
