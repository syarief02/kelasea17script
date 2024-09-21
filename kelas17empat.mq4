double KiraRisk(double price, double risk) {
    return price - (price * risk);
}

int contohkira(int a, int b) {
    return a + b;
}

void OnStart()
{
    // oekokeokeokeokeok
    //  SellStop();
    //  SellStop();
    //  SellStop();
    //  SellStop();
    Print("Loop Start");
    for (int i = 0; i < 4; i++)
    {
        SellStop();
    }
    Print("Loop End");
    Print("Kira Buy : " + KiraBuy());
    //Print("Kira Risk : " + KiraRisk(1.23456, 0.01));

    Print("----- contoh kira -----");
    Print("Contoh Kira : " + contohkira(10, 99));
}

int KiraBuy() {
    if(!IsConnected())
    return 9999;
    
    int total = 0;
    for(int i = OrdersTotal() - 1; i>=0 ; i--) {
        if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == 111) {
                total++;
            }
        }
    }
    return total;
}


void SellStop()
{
    Print("Sell Stop");
}

