void OnStart()
{
    int a = 10;
    int b = 20;

    int c = a + b;
    Print("c : ", c);

    int d = a - b;
    Print("d : ", d);

    int e = a * b;
    Print("e : ", e);

    double g = 10;
    double h = 30;
    double f = g / h;
    // 1/2 = 0.5

    Print("f : ", f);

    int remainder = 10 % 4;
    Print("remainder : ", remainder);
    if (a > b)
    {
        Print("a lebih besar dari b");
    }

    if (h > b)
    {
        Print("h lebih besar dari b");
    }

    if (a > b || h > b)
    {
        Print("a lebih besar dari b atau h lebih besar dari b");
    }

    if (a > b && h > b)
    {
        Print("a lebih besar dari b DAN h lebih besar dari b");
    }

    double rsi = 85;
    int level_ob = 70;
    if(rsi > level_ob) {
        Print("rsi lebih besar dari level_ob");
    }

    double harga_ask = 1.12345;
    double StopLoss = 1.12000;
    double openprice = 1.11000;
    
    if(StopLoss < harga_ask) {
        Print("Dah StopLoss");
    }
    if(harga_ask > StopLoss) {
        Print("Sama juga.. StopLoss");
    }

    // >= <= != ==
    // sekiranya layer sama dengan max layer.
    int layer = 1;
    int max_layer = 10;
    if(layer == max_layer) {
        Print("Layer sama dengan max layer");
    }

    Print("-----------------------");
    int total_layer = KiraLayer();
    Print("total_layer : ", total_layer);

}


int KiraLayer() {
    int total_layer = LayerBuy() + LayerSell();
    return total_layer;
}
int LayerBuy() {

    return 10;
}
int LayerSell() {
    return 99;
}