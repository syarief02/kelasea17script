//+------------------------------------------------------------------+
//|                                                      encodedecode.mq4 |
//|                        Copyright 2023, Your Name                 |
//|                                       https://www.yourwebsite.com |
//+------------------------------------------------------------------+
#property strict

extern string name = "";
extern string accNumber = "";

//+------------------------------------------------------------------+
//| ArrayToHex                                                       |
//+------------------------------------------------------------------+
string ArrayToHex(uchar &arr[], int count = -1)
{
    string res = "";
    //--- check
    if (count < 0 || count > ArraySize(arr))
        count = ArraySize(arr);
    //--- transform to HEX string
    for (int i = 0; i < count; i++)
        res += StringFormat("%.2X", arr[i]);
    //---
    return (res);
}
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
    string text = name;
    string keystr = accNumber;
    uchar src[], dst[], key[];
    //--- prepare key
    StringToCharArray(keystr, key);
    //--- copy text to source array src[]
    StringToCharArray(text, src);
    //--- print initial data
    PrintFormat("Initial data: size=%d, string='%s'", ArraySize(src), CharArrayToString(src));
    //--- encrypt src[] with DES 56-bit key in key[]
    int res = CryptEncode(CRYPT_DES, src, key, dst);
    //--- check error
    if (res > 0)
    {
        //--- print encrypted data
        PrintFormat("Encoded data: size=%d %s", res, ArrayToHex(dst));
        //--- decode dst[] to src[]
        res = CryptDecode(CRYPT_DES, dst, key, src);
        //--- check error
        if (res > 0)
        {
            //--- print decoded data
            PrintFormat("Decoded data: size=%d, string='%s'", ArraySize(src), CharArrayToString(src));
        }
        else
            Print("Error in CryptDecode. Error code=", GetLastError());
    }
    else
        Print("Error in CryptEncode. Error code=", GetLastError());
}