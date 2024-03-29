//+------------------------------------------------------------------+
//|                                                TradePosition.mqh |
//|                                                    Akimasa Ohara |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Akimasa Ohara"
#property link      ""
#property version   "1.01"
class TradePosition
  {
private:

public:
   static int        TradePositionNum(string symbol, ulong magicNumber);
   static long       TradePositionType(string symbol, ulong magicNumber);
  };

// 現在の銘柄と起動しているEAのマジックナンバーでの注文数を取得する処理
static int TradePosition::TradePositionNum(string symbol, ulong magicNumber){
   int orderNum = 0;
   int orderTotalNum = PositionsTotal();
   
   for(int i = 0; i < orderTotalNum; i++){
      string position_symbol = PositionGetSymbol(i);
      
      if(position_symbol == symbol && magicNumber == PositionGetInteger(POSITION_MAGIC)){
         orderNum++;
      }
   }
   
   return orderNum;
}


// 現在の銘柄と起動しているEAのマジックナンバーでの最新の注文のタイプを取得する処理
static long TradePosition::TradePositionType(string symbol, ulong magicNumber){
   long orderType = 0;
   int orderTotalNum = PositionsTotal();
   
   for(int i = 0; i < orderTotalNum; i++){
      string position_symbol = PositionGetSymbol(i);
      
      if(position_symbol == symbol && magicNumber == PositionGetInteger(POSITION_MAGIC)){
         orderType = PositionGetInteger(POSITION_TYPE);
      }
   }
   
   return orderType;
}