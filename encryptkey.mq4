//+------------------------------------------------------------------+
//|                                                      Base64Key.mq4|
//|                        Copyright 2023, Your Name                 |
//|                                       https://www.yourwebsite.com|
//+------------------------------------------------------------------+
#property strict

// Function declarations
string GenerateBase64Key(string accountName, int accountNumber);
string Base64Encode(const uchar &data[], int length);
void OnStart(); // Main function

//+------------------------------------------------------------------+
//| Main function                                                    |
//+------------------------------------------------------------------+
void OnStart()
{
    string accountName = AccountName(); // Get the account name
    int accountNumber = AccountNumber(); // Get the account number

    // Generate the Base64 encryption key
    string base64Key = GenerateBase64Key(accountName, accountNumber);
    
    // Print the generated Base64 key
    Print("Base64 Encryption Key: ", base64Key);
}

//+------------------------------------------------------------------+
//| Function to generate Base64 key based on account name and number |
//+------------------------------------------------------------------+
string GenerateBase64Key(string accountName, int accountNumber)
{
    // Normalize the account name to lowercase
    string normalizedAccountName = StringToLower(accountName);
    
    // Concatenate the account name and account number
    string combinedString = normalizedAccountName + IntegerToString(accountNumber);
    
    // Convert the combined string to a byte array
    uchar data[];
    StringToCharArray(combinedString, data);
    
    // Generate the Base64 encoded string
    return Base64Encode(data, ArraySize(data));
}

//+------------------------------------------------------------------+
//| Function to encode data to Base64                                |
//+------------------------------------------------------------------+
string Base64Encode(const uchar &data[], int length)
{
    const string base64Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    string result = "";
    int i = 0;

    while (i < length)
    {
        int byte1 = (i < length) ? data[i++] : 0;
        int byte2 = (i < length) ? data[i++] : 0;
        int byte3 = (i < length) ? data[i++] : 0;

        int triple = (byte1 << 16) + (byte2 << 8) + byte3;

        result += base64Chars[(triple >> 18) & 0x3F];
        result += base64Chars[(triple >> 12) & 0x3F];
        result += (i > length + 1) ? base64Chars[(triple >> 6) & 0x3F] : '=';
        result += (i > length) ? base64Chars[triple & 0x3F] : '=';
    }

    return result;
}

//+------------------------------------------------------------------+
