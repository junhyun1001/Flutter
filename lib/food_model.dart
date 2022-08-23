import 'dart:convert';
import 'package:http/http.dart' as http;

// Future 클래스는 미래에 사용될 데이터를 비동기 처리하여 보관함
// await 키워드를 사용한 함수는 무조건 async 함수이어야 한다.
// async 함수는 무조건 Future를 반환해야 한다.
Future<Food> fetchFood() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Food.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load FoodData');
  }
}

var foodName = "닭가슴살";
var url =
    'http://openapi.foodsafetykorea.go.kr/api/5e61f5af77c04c20923a/I2790/json/1/10/DESC_KOR=된장찌개';

class Food {
  I2790? i2790;

  Food({this.i2790});

  Food.fromJson(Map<String, dynamic> json) {
    i2790 = json['I2790'] != null ? new I2790.fromJson(json['I2790']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.i2790 != null) {
      data['I2790'] = this.i2790!.toJson();
    }
    return data;
  }
}

class I2790 {
  String? totalCount;
  List<Row>? row;
  RESULT? rESULT;

  I2790({this.totalCount, this.row, this.rESULT});

  I2790.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    if (json['row'] != null) {
      row = <Row>[];
      json['row'].forEach((v) {
        row!.add(new Row.fromJson(v));
      });
    }
    rESULT =
        json['RESULT'] != null ? new RESULT.fromJson(json['RESULT']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    if (this.row != null) {
      data['row'] = this.row!.map((v) => v.toJson()).toList();
    }
    if (this.rESULT != null) {
      data['RESULT'] = this.rESULT!.toJson();
    }
    return data;
  }
}

class Row {
  String? nUM;
  String? fOODCD;
  String? sAMPLINGREGIONNAME;
  String? sAMPLINGMONTHNAME;
  String? sAMPLINGREGIONCD;
  String? sAMPLINGMONTHCD;
  String? gROUPNAME;
  String? dESCKOR;
  String? rESEARCHYEAR;
  String? mAKERNAME;
  String? sUBREFNAME;
  String? sERVINGSIZE;
  String? nUTRCONT1;
  String? nUTRCONT2;
  String? nUTRCONT3;
  String? nUTRCONT4;
  String? nUTRCONT5;
  String? nUTRCONT6;
  String? nUTRCONT7;
  String? nUTRCONT8;
  String? nUTRCONT9;

  Row({
    this.nUM,
    this.fOODCD,
    this.sAMPLINGREGIONNAME,
    this.sAMPLINGMONTHNAME,
    this.sAMPLINGREGIONCD,
    this.sAMPLINGMONTHCD,
    this.gROUPNAME,
    this.dESCKOR,
    this.rESEARCHYEAR,
    this.mAKERNAME,
    this.sUBREFNAME,
    this.sERVINGSIZE,
    this.nUTRCONT1,
    this.nUTRCONT2,
    this.nUTRCONT3,
    this.nUTRCONT4,
    this.nUTRCONT5,
    this.nUTRCONT6,
    this.nUTRCONT7,
    this.nUTRCONT8,
  });

  Row.fromJson(Map<String, dynamic> json) {
    nUM = json['NUM'];
    fOODCD = json['FOOD_CD'];
    sAMPLINGREGIONNAME = json['SAMPLING_REGION_NAME'];
    sAMPLINGMONTHNAME = json['SAMPLING_MONTH_NAME'];
    sAMPLINGREGIONCD = json['SAMPLING_REGION_CD'];
    sAMPLINGMONTHCD = json['SAMPLING_MONTH_CD'];
    gROUPNAME = json['GROUP_NAME'];
    dESCKOR = json['DESC_KOR'];
    rESEARCHYEAR = json['RESEARCH_YEAR'];
    mAKERNAME = json['MAKER_NAME'];
    sUBREFNAME = json['SUB_REF_NAME'];
    sERVINGSIZE = json['SERVING_SIZE'];
    nUTRCONT1 = json['NUTR_CONT1'];
    nUTRCONT2 = json['NUTR_CONT2'];
    nUTRCONT3 = json['NUTR_CONT3'];
    nUTRCONT4 = json['NUTR_CONT4'];
    nUTRCONT5 = json['NUTR_CONT5'];
    nUTRCONT6 = json['NUTR_CONT6'];
    nUTRCONT7 = json['NUTR_CONT7'];
    nUTRCONT8 = json['NUTR_CONT8'];
    nUTRCONT9 = json['NUTR_CONT9'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NUM'] = this.nUM;
    data['FOOD_CD'] = this.fOODCD;
    data['SAMPLING_REGION_NAME'] = this.sAMPLINGREGIONNAME;
    data['SAMPLING_MONTH_NAME'] = this.sAMPLINGMONTHNAME;
    data['SAMPLING_REGION_CD'] = this.sAMPLINGREGIONCD;
    data['SAMPLING_MONTH_CD'] = this.sAMPLINGMONTHCD;
    data['GROUP_NAME'] = this.gROUPNAME;
    data['DESC_KOR'] = this.dESCKOR;
    data['RESEARCH_YEAR'] = this.rESEARCHYEAR;
    data['MAKER_NAME'] = this.mAKERNAME;
    data['SUB_REF_NAME'] = this.sUBREFNAME;
    data['SERVING_SIZE'] = this.sERVINGSIZE;
    data['NUTR_CONT1'] = this.nUTRCONT1;
    data['NUTR_CONT2'] = this.nUTRCONT2;
    data['NUTR_CONT3'] = this.nUTRCONT3;
    data['NUTR_CONT4'] = this.nUTRCONT4;
    data['NUTR_CONT5'] = this.nUTRCONT5;
    data['NUTR_CONT6'] = this.nUTRCONT6;
    data['NUTR_CONT7'] = this.nUTRCONT7;
    data['NUTR_CONT8'] = this.nUTRCONT8;
    data['NUTR_CONT9'] = this.nUTRCONT9;
    return data;
  }
}

class RESULT {
  String? mSG;
  String? cODE;

  RESULT({this.mSG, this.cODE});

  RESULT.fromJson(Map<String, dynamic> json) {
    mSG = json['MSG'];
    cODE = json['CODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MSG'] = this.mSG;
    data['CODE'] = this.cODE;
    return data;
  }
}
