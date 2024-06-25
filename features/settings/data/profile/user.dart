class User {
	String? id;
	String? username;
	String? email;
	bool? isAdmin;
	int? v;
	List<dynamic>? wishList;

	User({
		this.id, 
		this.username, 
		this.email, 
		this.isAdmin, 
		this.v, 
		this.wishList, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['_id'] as String?,
				username: json['username'] as String?,
				email: json['email'] as String?,
				isAdmin: json['isAdmin'] as bool?,
				v: json['__v'] as int?,
				wishList: json['wishList'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'username': username,
				'email': email,
				'isAdmin': isAdmin,
				'__v': v,
				'wishList': wishList,
			};
}
