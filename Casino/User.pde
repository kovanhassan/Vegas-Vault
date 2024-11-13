class User{
  
  //Fields
  String name;
  int balance;
  int amountWon;
  int betAmount;
  
  //Constructor
  User(String n, int b, int aW,int bA){
    this.name = n;
    this.balance = b;
    this.amountWon = aW;
    this.betAmount = bA;   
  }
  
  
void displayStats(){
   text("John", 950,50);
   text("$"+this.balance,950,100);
}

int deduct(){
  return this.balance = this.balance - this.betAmount; 
}
  
  
}
