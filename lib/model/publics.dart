class UserInfoResponse {
  int code;
  UserInfoData data;

  UserInfoResponse({this.code, this.data});

  factory UserInfoResponse.fromJson(
          Map<String, dynamic> json) =>
      UserInfoResponse(
          code: json["code"] == null ? null : json["code"],
          data: json["data"] == null
              ? null
              : UserInfoData.fromJson(json['data']));

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : data.toJson(),
      };
}

class UserInfoData {
  String schoolName;
  int schoolStatus;
  String className;
  User user;
  String teacher;
  bool impersonating;
  dynamic impersonator;
  bool subscribed;
  bool subscribedTeacher;
  bool trial;
  bool bindWechat;
  int medalCount;

  UserInfoData({
    this.schoolName,
    this.schoolStatus,
    this.className,
    this.user,
    this.teacher,
    this.impersonating,
    this.impersonator,
    this.subscribed,
    this.subscribedTeacher,
    this.trial,
    this.bindWechat,
    this.medalCount,
  });

  factory UserInfoData.fromJson(Map<String, dynamic> json) => UserInfoData(
        schoolName: json["school_name"] == null ? null : json["school_name"],
        schoolStatus:
            json["school_status"] == null ? null : json["school_status"],
        className: json["class_name"] == null ? null : json["class_name"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        teacher: json["teacher"] == null ? null : json["teacher"],
        impersonating:
            json["impersonating"] == null ? null : json["impersonating"],
        impersonator: json["impersonator"] == null ? null : null,
        subscribed: json["subscribed"] == null ? null : json["subscribed"],
        subscribedTeacher: json["subscribed_teacher"] == null
            ? null
            : json["subscribed_teacher"],
        trial: json["trial"] == null ? null : json["trial"],
        bindWechat: json["bind_wechat"] == null ? null : json["bind_wechat"],
        medalCount: json["medal_count"] == null ? null : json["medal_count"],
      );

  Map<String, dynamic> toJson() => {
        "school_name": schoolName == null ? null : schoolName,
        "school_status": schoolStatus == null ? null : schoolStatus,
        "class_name": className == null ? null : className,
        "user": user == null ? null : user.toJson(),
        "teacher": teacher == null ? null : teacher,
        "impersonating": impersonating == null ? null : impersonating,
        "impersonator": impersonator == null ? null : impersonator,
        "subscribed": subscribed == null ? null : subscribed,
        "subscribed_teacher":
            subscribedTeacher == null ? null : subscribedTeacher,
        "trial": trial == null ? null : trial,
        "bind_wechat": bindWechat == null ? null : bindWechat,
        "medal_count": medalCount == null ? null : medalCount,
      };
}

class User {
  int id;
  String name;
  dynamic email;
  String phone;
  String avatar;
  String gender;
  dynamic birthday;
  String province;
  String city;
  String district;
  dynamic wechatName;
  String type;
  int grade;
  int schoolId;
  int classId;
  int isTeacher;
  int isAdmin;
  String lastLogin;
  String lastIp;
  dynamic departmentId;
  String createdAt;
  String updatedAt;
  int teacherSchoolId;
  dynamic creatorId;
  dynamic sign;
  dynamic inviteUserId;
  dynamic inviteAt;
  int from;
  String familyTitle;
  int studentPoint;
  String gradeText;
  int circleId;
  bool nameIsEmpty;
  String familyTitleText;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.gender,
    this.birthday,
    this.province,
    this.city,
    this.district,
    this.wechatName,
    this.type,
    this.grade,
    this.schoolId,
    this.classId,
    this.isTeacher,
    this.isAdmin,
    this.lastLogin,
    this.lastIp,
    this.departmentId,
    this.createdAt,
    this.updatedAt,
    this.teacherSchoolId,
    this.creatorId,
    this.sign,
    this.inviteUserId,
    this.inviteAt,
    this.from,
    this.familyTitle,
    this.studentPoint,
    this.gradeText,
    this.circleId,
    this.nameIsEmpty,
    this.familyTitleText,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        gender: json["gender"] == null ? null : json["gender"],
        birthday: json["birthday"] == null ? null : json["birthday"],
        province: json["province"] == null ? null : json["province"],
        city: json["city"] == null ? null : json["city"],
        district: json["district"] == null ? null : json["district"],
        wechatName: json["wechat_name"] == null ? null : json["wechat_name"],
        type: json["type"] == null ? null : json["type"],
        grade: json["grade"] == null ? null : json["grade"],
        schoolId: json["school_id"] == null ? null : json["school_id"],
        classId: json["class_id"] == null ? null : json["class_id"],
        isTeacher: json["is_teacher"] == null ? null : json["is_teacher"],
        isAdmin: json["is_admin"] == null ? null : json["is_admin"],
        lastLogin: json["last_login"] == null ? null : json["last_login"],
        lastIp: json["last_ip"] == null ? null : json["last_ip"],
        departmentId:
            json["department_id"] == null ? null : json["department_id"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        teacherSchoolId: json["teacher_school_id"] == null
            ? null
            : json["teacher_school_id"],
        creatorId: json["creator_id"] == null ? null : json["creator_id"],
        sign: json["sign"] == null ? null : json["sign"],
        inviteUserId:
            json["invite_user_id"] == null ? null : json["invite_user_id"],
        inviteAt: json["invite_at"] == null ? null : json["invite_at"],
        from: json["from"] == null ? null : json["from"],
        familyTitle: json["family_title"] == null ? null : json["family_title"],
        studentPoint:
            json["student_point"] == null ? null : json["student_point"],
        gradeText: json["grade_text"] == null ? null : json["grade_text"],
        circleId: json["circle_id"] == null ? null : json["circle_id"],
        nameIsEmpty:
            json["name_is_empty"] == null ? null : json["name_is_empty"],
        familyTitleText: json["family_title_text"] == null
            ? null
            : json["family_title_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "avatar": avatar == null ? null : avatar,
        "gender": gender == null ? null : gender,
        "birthday": birthday == null ? null : birthday,
        "province": province == null ? null : province,
        "city": city == null ? null : city,
        "district": district == null ? null : district,
        "wechat_name": wechatName == null ? null : wechatName,
        "type": type == null ? null : type,
        "grade": grade == null ? null : grade,
        "school_id": schoolId == null ? null : schoolId,
        "class_id": classId == null ? null : classId,
        "is_teacher": isTeacher == null ? null : isTeacher,
        "is_admin": isAdmin == null ? null : isAdmin,
        "last_login": lastLogin == null ? null : lastLogin,
        "last_ip": lastIp == null ? null : lastIp,
        "department_id": departmentId == null ? null : departmentId,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
        "teacher_school_id": teacherSchoolId == null ? null : teacherSchoolId,
        "creator_id": creatorId == null ? null : creatorId,
        "sign": sign == null ? null : sign,
        "invite_user_id": inviteUserId == null ? null : inviteUserId,
        "invite_at": inviteAt == null ? null : inviteAt,
        "from": from == null ? null : from,
        "family_title": familyTitle == null ? null : familyTitle,
        "student_point": studentPoint == null ? null : studentPoint,
        "grade_text": gradeText == null ? null : gradeText,
        "circle_id": circleId == null ? null : circleId,
        "name_is_empty": nameIsEmpty == null ? null : nameIsEmpty,
        "family_title_text": familyTitleText == null ? null : familyTitleText,
      };
}
