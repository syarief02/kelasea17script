//+------------------------------------------------------------------+
//|                                                      ListObjects.mq4|
//|                        Copyright 2023, Your Name                  |
//|                                       https://www.yourwebsite.com |
//+------------------------------------------------------------------+
void ListAllObjects() {
    int totalObjects = ObjectsTotal(); // Dapatkan jumlah objek
    for (int i = 0; i < totalObjects; i++) {
        string objectName = ObjectName(i); // Dapatkan nama objek
        Print(objectName); // Cetak nama objek ke dalam log
    }
}

//+------------------------------------------------------------------+
//| Script program start function                                     |
//+------------------------------------------------------------------+
void OnStart() {
    ListAllObjects(); // Panggil fungsi untuk menyenaraikan semua objek
}
//+------------------------------------------------------------------+
