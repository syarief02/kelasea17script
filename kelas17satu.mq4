void OnStart() {
    int a = 10;
    string b = "Nama saya Zaf. Saya di Semenyih.";
    Print(a);
    Print(b);

    a = 20;
    Print(a);

    b = "Saya tinggal di Subang.";
    Print(b);

   string c = "EA Power";
   double LotSize = 0.01;
   LotSize = 10.00;

   //boolean
   //boolen true or false | 1 or 0
   bool trailingstop = true;

   trailingstop = false;

   Print(trailingstop);


   Print("Lot Size Full Margin : ", LotSize);
   Print("Trailing Stop : " + trailingstop);
}