class TopMechanics{
  TopMechanics({required this.mech, required this.ws, required this.phone, required this.rate}); //required this.rate});
  final String mech;
  final String ws;
  final String phone;
  final String rate;


  factory TopMechanics.fromJson(Map<String, dynamic> json) {
    return TopMechanics(
      mech: json['mechanic'],
      ws: json['Workshop'],
      phone: json['phone'],
      rate: json['Rating'],
    );
  }

}