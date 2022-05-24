class Currency {
  String? date;
  String? base;
  Rates? rates;

  Currency({this.date, this.base, this.rates});

  Currency.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    base = json['base'];
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['base'] = this.base;
    if (this.rates != null) {
      data['rates'] = this.rates!.toJson();
    }
    return data;
  }
}

class Rates {
  double? aDA;
  double? bOB;
  double? cZK;
  double? dEM;
  double? dOGE;
  double? eUR;
  double? gBP;
  double? hUF;
  double? pHP;
  double? rOL;
  double? rON;
  double? rUB;
  int? uSD;

  Rates(
      {this.aDA,
        this.bOB,
        this.cZK,
        this.dEM,
        this.dOGE,
        this.eUR,
        this.gBP,
        this.hUF,
        this.pHP,
        this.rOL,
        this.rON,
        this.rUB,
        this.uSD});

  Rates.fromJson(Map<String, dynamic> json) {
    aDA = json['ADA'];
    bOB = json['BOB'];
    cZK = json['CZK'];
    dEM = json['DEM'];
    dOGE = json['DOGE'];
    eUR = json['EUR'];
    gBP = json['GBP'];
    hUF = json['HUF'];
    pHP = json['PHP'];
    rOL = json['ROL'];
    rON = json['RON'];
    rUB = json['RUB'];
    uSD = json['USD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ADA'] = this.aDA;
    data['BOB'] = this.bOB;
    data['CZK'] = this.cZK;
    data['DEM'] = this.dEM;
    data['DOGE'] = this.dOGE;
    data['EUR'] = this.eUR;
    data['GBP'] = this.gBP;
    data['HUF'] = this.hUF;
    data['PHP'] = this.pHP;
    data['ROL'] = this.rOL;
    data['RON'] = this.rON;
    data['RUB'] = this.rUB;
    data['USD'] = this.uSD;
    return data;
  }
}
