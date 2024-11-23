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

  //When user adds money to their account through the deposit page
  int depositCash(){
    return this.balance = this.balance + amountDeposit;
  }
  
  //When user remove money to their account through the withdraw page
  int withdrawCash(){
    return this.balance = this.balance - amountWithdraw; 
  }
 
  int deduct(){
    return this.balance = this.balance - this.betAmount; 
  }

  //Function to display the gambling stats such as: the amount in their account
  void displayStats(){
    fill(255);
    textAlign(CENTER);
    text(userName, 950,50);
    text("$"+this.balance,950,100);
    text("Bet Amount"+":",950,230);
    text("$"+this.betAmount,950,270);
  }

  void displayDepositStats(){
    textAlign(CENTER);
    fill(255);
    text(userName, 100,50);
    text("$"+this.balance,100,100);
    text("Deposit Amount:"+" $"+amountDeposit,width/2,height/2);
  }

  void displayWithdrawStats(){
     textAlign(CENTER);
     fill(255);
     text(userName, 100,50);
     text("$"+this.balance,100,100);
     text("Withdraw Amount:"+" $"+amountWithdraw,width/2,height/2);
  }
}
