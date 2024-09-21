void OnStart() {
    int a = 10;
    Print("Function OnStart() a : ", a);
    Dua();
    Print("Terima kasih.");
    Print("Layer : ", KiraLayer());
    Print("Lot Size : ", KiraLotSize());
    Print("Nama EA : ", NamaEA());
    Print("Boleh Sell Ke : ", BolehSellKe());
    Print("Waktu : ", Waktu());
}


void Dua() {
    int b = 20;
    Print("Function Dua() b : ", b);
}

int KiraLayer() {
    return 4;
}

double KiraLotSize() {
    double LotMultiplier = 2.618;
    return 0.01 * LotMultiplier;
}

string NamaEA() {
    return "EA Power";
}

bool BolehSellKe() {
    return true;
}

datetime Waktu() {
    return TimeToStr(TimeCurrent(), TIME_SECONDS);
}




