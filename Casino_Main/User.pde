class User{
  
  //Fields
  String name;
  int balance;
  int amountWon;
  int betAmount;
  int amountDeposit;
  int amountWithdraw;
  
  //Constructor
  User(String n, int b, int aW,int bA,int dA, int wA){
    this.name = n;
    this.balance = b;
    this.amountWon = aW;
    this.betAmount = bA;  
    this.amountDeposit = dA;
    this.amountWithdraw = wA;
  }

// Methods

// depositCash Method
int depositCash(){
  // Returns the new balance which is the balance plus the set deposit amount
  return this.balance = this.balance + amountDeposit;
}

// withdrawCash Method
int withdrawCash(){
  //Returns the new balance which is the balance minus the set withdraw amount
  return this.balance = this.balance - amountWithdraw;
  
}

// Displaying Stats Method
void displayStats(){
  fill(255);
  textAlign(CENTER);
  //Name Listed in the top right along with the user balance
  text(userName, 950,50);
  text("$"+this.balance,950,100);
  
  // Bet Amount displayed for users in the right of the screen
  text("Bet Amount"+":",950,230);
  text("$"+this.betAmount,950,270);
}

// Method for displaying Deposit Stats
void displayDepositStats(){
  textAlign(CENTER);
  fill(255);
  
  // Displaying Username and balance in the top left
  text(userName, 100,50);
  text("$"+this.balance,100,100);
  
  //Displaying the deposit amount in the middle of the screen
  text("Deposit Amount:"+" $"+amountDeposit,width/2,height/2);
  
}

// Method for displaying Withdraw Stats
void displayWithdrawStats(){
   textAlign(CENTER);
   fill(255);
   
   // Displays username and balance in the top left 
   text(userName, 100,50);
   text("$"+this.balance,100,100);
   
   // Displays the withdraw amount in the middle of the screen
   text("Withdraw Amount:"+" $"+amountWithdraw,width/2,height/2);
  
}

// Method for deducting user's balance
int deduct(){
  // Balance is subtracted by the set bet amount
  return this.balance = this.balance - this.betAmount; 

}

  
}
