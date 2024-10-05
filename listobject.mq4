//+------------------------------------------------------------------+
//|                                                      MyScript.mq4|
//|                        Copyright 2023, Your Name                 |
//|                                       https://www.yourwebsite.com|
//+------------------------------------------------------------------+
#property strict

// Input parameters
input double LotSize = 0.1; // Lot size for trading
input int Slippage = 3;      // Slippage in pips

// Function declarations
void OnStart(); // Main function

//+------------------------------------------------------------------+
//| Expert initialization function                                     |
//+------------------------------------------------------------------+
int OnInit()
{
    // Initialization code here
    return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Main function                                                    |
//+------------------------------------------------------------------+
void OnStart()
{
    string url = "https://www.forexfactory.com/calendar";
    char postData[]; // No post data for GET request
    char result[];   // To store the response
    string headers = ""; // No headers needed for this request
    string responseHeaders; // To store response headers
    
    // Make the web request
    int res = WebRequest("GET", url, headers, 10, postData, result, responseHeaders);
    
    if (res == 200) // Check if the request was successful
    {
        string response = CharArrayToString(result);
        Print("Response: ", response); // Print the entire response for debugging
        
        // Extract data for the attached chart symbol
        string symbol = Symbol(); // Get the attached chart symbol
        ExtractSymbolData(response, symbol);
    }
    else
    {
        Print("Error in WebRequest. Error code: ", GetLastError());
    }
}

//+------------------------------------------------------------------+
//| Function to extract actual and forecast data for the symbol      |
//+------------------------------------------------------------------+
void ExtractSymbolData(string response, string symbol)
{
    // Map full symbol to calendar currency code
    string currencyCode = GetCurrencyCode(symbol);
    
    if (currencyCode != "")
    {
        // Example parsing logic to find actual and forecast data
        string searchString = currencyCode; // Use the currency code for searching
        int pos = StringFind(response, searchString);
        
        if (pos != -1)
        {
            // Extract relevant data around the found position
            string relevantData = StringSubstr(response, pos - 100, 500); // Get 100 characters before and 500 after
            
            // Print the relevant data for debugging
            Print("Relevant Data: ", relevantData);
            
            // Extract event name, date, actual, and forecast values
            string eventName = ExtractEventName(relevantData);
            string eventDate = ExtractEventDate(relevantData);
            string actualValue = ExtractActualValue(relevantData);
            string forecastValue = ExtractForecastValue(relevantData);
            
            Print("Event: ", eventName);
            Print("Date: ", eventDate);
            Print("Actual Value for ", symbol, ": ", actualValue);
            Print("Forecast Value for ", symbol, ": ", forecastValue);
        }
        else
        {
            Print("No data found for currency code: ", currencyCode);
        }
    }
    else
    {
        Print("No mapping found for symbol: ", symbol);
    }
}

//+------------------------------------------------------------------+
//| Function to extract the actual value from the relevant data      |
//+------------------------------------------------------------------+
string ExtractActualValue(string data)
{
    // Look for the actual value in the HTML structure
    int startPos = StringFind(data, "calendar__cell calendar__actual");
    if (startPos != -1)
    {
        startPos = StringFind(data, "<span", startPos);
        if (startPos != -1)
        {
            startPos = StringFind(data, ">", startPos) + 1; // Move to the character after '>'
            int endPos = StringFind(data, "<", startPos);
            if (endPos != -1)
            {
                return StringSubstr(data, startPos, endPos - startPos); // Extract the value
            }
        }
    }
    return "N/A"; // Return "N/A" if not found
}

//+------------------------------------------------------------------+
//| Function to extract the forecast value from the relevant data    |
//+------------------------------------------------------------------+
string ExtractForecastValue(string data)
{
    // Look for the forecast value in the HTML structure
    int startPos = StringFind(data, "calendar__cell calendar__forecast");
    if (startPos != -1)
    {
        startPos = StringFind(data, "<span", startPos);
        if (startPos != -1)
        {
            startPos = StringFind(data, ">", startPos) + 1; // Move to the character after '>'
            int endPos = StringFind(data, "<", startPos);
            if (endPos != -1)
            {
                return StringSubstr(data, startPos, endPos - startPos); // Extract the value
            }
        }
    }
    return "N/A"; // Return "N/A" if not found
}

//+------------------------------------------------------------------+
//| Function to extract the event name from the relevant data        |
//+------------------------------------------------------------------+
string ExtractEventName(string data)
{
    // Adjust based on actual HTML structure
    int startPos = StringFind(data, "calendar__event"); // Replace with actual class or tag
    if (startPos != -1)
    {
        startPos = StringFind(data, ">", startPos) + 1; // Move to the character after '>'
        int endPos = StringFind(data, "<", startPos);
        if (endPos != -1)
        {
            return StringSubstr(data, startPos, endPos - startPos);
        }
    }
    return "N/A"; // Return "N/A" if not found
}

//+------------------------------------------------------------------+
//| Function to extract the event date from the relevant data        |
//+------------------------------------------------------------------+
string ExtractEventDate(string data)
{
    // Adjust based on actual HTML structure
    int startPos = StringFind(data, "calendar__date"); // Replace with actual class or tag
    if (startPos != -1)
    {
        startPos = StringFind(data, ">", startPos) + 1; // Move to the character after '>'
        int endPos = StringFind(data, "<", startPos);
        if (endPos != -1)
        {
            return StringSubstr(data, startPos, endPos - startPos);
        }
    }
    return "N/A"; // Return "N/A" if not found
}

//+------------------------------------------------------------------+
//| Function to map full symbol to calendar currency code            |
//+------------------------------------------------------------------+
string GetCurrencyCode(string symbol)
{
    if (symbol == "EURUSD") return "EUR";
    if (symbol == "GBPUSD") return "GBP";
    if (symbol == "USDJPY") return "JPY";
    if (symbol == "AUDUSD") return "AUD";
    if (symbol == "USDCHF") return "CHF";
    // Add more mappings as needed
    return ""; // Return empty if no mapping found
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                   |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    // Cleanup code here
}

//+------------------------------------------------------------------+