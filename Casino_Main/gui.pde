/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void startButton(GButton source, GEvent event) { //_CODE_:start:687561:
  //Change Window To Slots
  windowName = "slots";
} //_CODE_:start:687561:

public void usernameLogin(GTextField source, GEvent event) { //_CODE_:username:503263:

 //Inputted Username must have characters inputted inside to ensure there is ACTUALLY a lengthy username
 //Once acheived, introButtonVisible boolean will become True
 if (source.getText().length() > 2 && source.getText().length() < 13) {
   userName = source.getText();
   introButtonVisible = "True";
 }
 
 else{
   introButtonVisible = "False";
 }
} //_CODE_:username:503263:

public void backButtonEvent(GButton source, GEvent event) { //_CODE_:backButton:657815:
  
  //Set Window to Start2
  windowName = "start2";
  
} //_CODE_:backButton:657815:

public void spinSlotEvent(GButton source, GEvent event) { //_CODE_:spinButton:399158:
  
  // Turn Off ALL THE WARNINGS
  min_betWarning = false;
  insufficientFunds = false;
  max_betWarning = false;
  
  //If bet amount is less than balance, machine will spin and deduct
  if (slotUser.betAmount <= slotUser.balance) {
    
    if (slotMachine.isSpinning) {
        print();  
    } 
    
    else {
        slotMachine.startSpin();
        slotUser.deduct();
        
       

        
    }
  } 
  
  else {
    // If bet amount is higher than balance, set warning
    insufficientFunds = true; // Set to true if funds are insufficient
  }
} //} //_CODE_:spinButton:399158:

public void increaseBetEvent(GButton source, GEvent event) { //_CODE_:increaseBet:800397:
  
  // If bet amount is 100, set warning that max bet amount has been hit
  if(slotUser.betAmount == 100){
    max_betWarning = true;
    
  }
  
  //Else, increment the bet amount by 5
  else{
  slotUser.betAmount += 5;
  }
  
  
  //Turn off min bet warning once clicked
  if (min_betWarning){
    min_betWarning = false;
  }
  
} //_CODE_:increaseBet:800397:

public void decreaseBetEvent(GButton source, GEvent event) { //_CODE_:decreaseBet:851747:
  
  // Take differnece of bet amount and the increment of five
  int difference = slotUser.betAmount - 5;
  
  // Turn off min bet warning
  max_betWarning = false;
  
  //If that difference is greater than 0
  if(difference > 0){
    
    // Make min bet warning false
    min_betWarning = false;
    
    //Increment bet amount by -5
    slotUser.betAmount -=5;
    
    
  }
  
  //If difference is not > 0, put a warning
  else{
    min_betWarning = true;
  }
} //_CODE_:decreaseBet:851747:

public void warningCheckedEvent(GCheckbox source, GEvent event) { //_CODE_:warningBox:883808:
  //Warning Gambling Checkbox
  warningChecked = !warningChecked;
} //_CODE_:warningBox:883808:

public void changeNumberOfSymbolsEvent(GSlider source, GEvent event) { //_CODE_:numSymbols:284724:
  // Slider that gets the integer value of the amount of symbols there are
  numberOfSymbols = numSymbols.getValueI();
  
} //_CODE_:numSymbols:284724:

public void introStartEvent(GButton source, GEvent event) { //_CODE_:introStart:457008:
  
  // Set Window to start 2
  windowName = "start2";
  
  
  // Update the users name in Data
  changeName(userName);

} //_CODE_:introStart:457008:

public void showGuideEvent(GButton source, GEvent event) { //_CODE_:guide:201962:
  
  // Set window to rules
  windowName = "rules";
} //_CODE_:guide:201962:

public void showWithdrawEvent(GButton source, GEvent event) { //_CODE_:withdraw:987209:
  
  // Set window to withdraw
  windowName = "withdraw";
} //_CODE_:withdraw:987209:

public void showdepositEvent(GButton source, GEvent event) { //_CODE_:deposit:991460:
  
  // Set window to deposit
  windowName = "deposit";
} //_CODE_:deposit:991460:

public void backButton_guideEvent(GButton source, GEvent event) { //_CODE_:backButton_guide:683789:
  
  // Set window to slots
  windowName = "slots";
} //_CODE_:backButton_guide:683789:

public void backtoSlotsButtonEvent(GButton source, GEvent event) { //_CODE_:backtoSlotsButton:473298:
 
  // Set window to slots
  windowName = "slots";
} //_CODE_:backtoSlotsButton:473298:

public void increaseDepositEvent(GButton source, GEvent event) { //_CODE_:increaseDepositAmount:735302:
  // Get the sum of the amount deposit and the increment base of 50
  int sum = slotUser.amountDeposit + 50;
  
  // If that sum is less than 1050, we can proceed with increasing the deposit
  if(sum < 1050){
  slotUser.amountDeposit += 50;
  }
  
  //If not, we set the warning
  else{
    maxDepositWarning = true;
  }
  
  //If min deposit warning is on, it will be set off
  if(minDepositWarning){
    minDepositWarning = false;
  }
  
} //_CODE_:increaseDepositAmount:735302:

public void decreaseDepositEvent(GButton source, GEvent event) { //_CODE_:decreaseDeposit:512540:
  
  //Get the difference between the amount deposit and the increment base of 50
  int difference = slotUser.amountDeposit - 50;
  
  // If that difference is greater that 50
  if(difference > 50){
    
    //minDeposit warning is set to false
    minDepositWarning = false;
    
    //Amount deposit is incremented by -50
    slotUser.amountDeposit -= 50;
  }
  
  
  //Else, set a warning
  else{
    minDepositWarning = true;
  }
  
  // If max deposit warning is true, we set it to false once this button is clicked
  if(maxDepositWarning){
    maxDepositWarning = false;
  }
} //_CODE_:decreaseDeposit:512540:

public void depositClickEvent(GButton source, GEvent event) { //_CODE_:depositClick:525797:
   
   
   depositClicked = true;
   
   // Store the time of the deposit
   lastDepositTime = millis(); 
  
  //Deposit The Cash and update the balance in the data file
  slotUser.depositCash();
  changeBalance(slotUser.balance); 
  
} //_CODE_:depositClick:525797:

public void increaseWithdrawAmountEvent(GButton source, GEvent event) { //_CODE_:increaseWithdrawAmount:472427:
  
  // Get the sum by adding amount withdraw and the base increment of 50
  int sum = slotUser.amountWithdraw + 50;
  
  
  // Set limited balance warning to false
  noBalanceToWithdrawWarning = false;
  
  // If sum is less than or equal to the balance, we can increment amount Withdraw by 50
  if(sum <= slotUser.balance){
    slotUser.amountWithdraw += 50;
    
  }
  
  // Else, we set a warning
  else{
     maxWithdrawWarning = true;
    
  }
  
  
  //If minWithdraw warning is set, set it to false once this button is clicked
  if(minWithdrawWarning){
    minWithdrawWarning = false;
  }
  
} //_CODE_:increaseWithdrawAmount:472427:

public void decreaseWithdrawAmountEvent(GButton source, GEvent event) { //_CODE_:decreaseWithdrawAmount:409170:
  
  // Get the difference between the amount withdraw and the base increment of 50
  int difference = slotUser.amountWithdraw - 50;
  
  // Set limited balance warning to false
  noBalanceToWithdrawWarning = false;
  
  // if that difference is greater than 50
  if(difference > 50){
    
    //Set minWithdraw warning to false
    minWithdrawWarning = false;
    //Increment amount Withdraw by -50
    slotUser.amountWithdraw -= 50;
  }
  
  
  // Else, set a warning
  else{
    minWithdrawWarning = true;
  }


  // If maxWithdraw warning is true, set it to false
  if(maxWithdrawWarning){
    maxWithdrawWarning = false;
  }

} //_CODE_:decreaseWithdrawAmount:409170:

public void withdrawClickEvent(GButton source, GEvent event) { //_CODE_:withdrawClick:478825:
  
  // If user balance is greater than amount Withdraw
  if(slotUser.balance >= slotUser.amountWithdraw){
  
  //Withdraw the cash and update the balance file
  slotUser.withdrawCash();
  changeBalance(slotUser.balance);
  
  //Set amountWithdraw to 100
  slotUser.amountWithdraw = 100;
  
  //Turn all warnings off
  maxWithdrawWarning = false;
  minWithdrawWarning = false;
  }
  
  
  //Else: turn max and min Withdraw warnings to false and turn on limited balance warning to warn the user he CANNOT withdraw
  else{
  maxWithdrawWarning = false;
  minWithdrawWarning = false;
  noBalanceToWithdrawWarning = true;
  }
  
  
} //_CODE_:withdrawClick:478825:

public void resetEvent(GButton source, GEvent event) { //_CODE_:reset:873492:
  
  //Reset balance and name and then UPDATE
  slotUser.balance = 100;
  userName = "noName";
  
  changeBalance(slotUser.balance);
  changeName(userName);
  
  //Turn off welcome statement
  showWelcomeStatement = false;
} //_CODE_:reset:873492:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  start = new GButton(this, 790, 477, 100, 60);
  start.setText("Start!");
  start.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  start.addEventHandler(this, "startButton");
  username = new GTextField(this, 450, 373, 200, 30, G4P.SCROLLBARS_NONE);
  username.setOpaque(false);
  username.addEventHandler(this, "usernameLogin");
  backButton = new GButton(this, 0, 0, 80, 30);
  backButton.setText("Back");
  backButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  backButton.addEventHandler(this, "backButtonEvent");
  spinButton = new GButton(this, 500, 600, 112, 42);
  spinButton.setText("Spin!");
  spinButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  spinButton.addEventHandler(this, "spinSlotEvent");
  increaseBet = new GButton(this, 870, 349, 160, 60);
  increaseBet.setText("Increase Bet");
  increaseBet.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  increaseBet.addEventHandler(this, "increaseBetEvent");
  decreaseBet = new GButton(this, 870, 416, 160, 60);
  decreaseBet.setText("Decrease Bet");
  decreaseBet.setLocalColorScheme(GCScheme.RED_SCHEME);
  decreaseBet.addEventHandler(this, "decreaseBetEvent");
  warningBox = new GCheckbox(this, 640, 364, 431, 116);
  warningBox.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  warningBox.setText("By proceeding, you acknowledge that you are participating in a game of chance and agree to the terms and conditions associated with gambling.");
  warningBox.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  warningBox.setOpaque(false);
  warningBox.addEventHandler(this, "warningCheckedEvent");
  numSymbols = new GSlider(this, 22, 398, 317, 75, 20.0);
  numSymbols.setShowValue(true);
  numSymbols.setShowLimits(true);
  numSymbols.setLimits(5, 5, 9);
  numSymbols.setNbrTicks(5);
  numSymbols.setStickToTicks(true);
  numSymbols.setShowTicks(true);
  numSymbols.setNumberFormat(G4P.INTEGER, 0);
  numSymbols.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  numSymbols.setOpaque(false);
  numSymbols.addEventHandler(this, "changeNumberOfSymbolsEvent");
  introStart = new GButton(this, 475, 500, 150, 55);
  introStart.setText("Continue");
  introStart.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  introStart.addEventHandler(this, "introStartEvent");
  guide = new GButton(this, 0, 770, 80, 30);
  guide.setText("Help/Guide");
  guide.addEventHandler(this, "showGuideEvent");
  withdraw = new GButton(this, 1020, 770, 80, 30);
  withdraw.setText("Withdraw");
  withdraw.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  withdraw.addEventHandler(this, "showWithdrawEvent");
  deposit = new GButton(this, 940, 770, 80, 30);
  deposit.setText("Deposit");
  deposit.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  deposit.addEventHandler(this, "showdepositEvent");
  backButton_guide = new GButton(this, 516, 683, 80, 30);
  backButton_guide.setText("Back");
  backButton_guide.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  backButton_guide.addEventHandler(this, "backButton_guideEvent");
  backtoSlotsButton = new GButton(this, 1020, 0, 80, 30);
  backtoSlotsButton.setText("Back");
  backtoSlotsButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  backtoSlotsButton.addEventHandler(this, "backtoSlotsButtonEvent");
  increaseDepositAmount = new GButton(this, 413, 250, 120, 50);
  increaseDepositAmount.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  increaseDepositAmount.setText("Increase");
  increaseDepositAmount.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  increaseDepositAmount.addEventHandler(this, "increaseDepositEvent");
  decreaseDeposit = new GButton(this, 542, 250, 120, 50);
  decreaseDeposit.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  decreaseDeposit.setText("Decrease");
  decreaseDeposit.setLocalColorScheme(GCScheme.RED_SCHEME);
  decreaseDeposit.addEventHandler(this, "decreaseDepositEvent");
  depositClick = new GButton(this, 498, 320, 80, 30);
  depositClick.setText("Transfer");
  depositClick.addEventHandler(this, "depositClickEvent");
  increaseWithdrawAmount = new GButton(this, 413, 250, 120, 50);
  increaseWithdrawAmount.setText("Increase");
  increaseWithdrawAmount.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  increaseWithdrawAmount.addEventHandler(this, "increaseWithdrawAmountEvent");
  decreaseWithdrawAmount = new GButton(this, 542, 250, 120, 50);
  decreaseWithdrawAmount.setText("Decrease");
  decreaseWithdrawAmount.setLocalColorScheme(GCScheme.RED_SCHEME);
  decreaseWithdrawAmount.addEventHandler(this, "decreaseWithdrawAmountEvent");
  withdrawClick = new GButton(this, 500, 320, 80, 30);
  withdrawClick.setText("Transfer");
  withdrawClick.addEventHandler(this, "withdrawClickEvent");
  reset = new GButton(this, 499, 591, 100, 45);
  reset.setText("Delete Account");
  reset.addEventHandler(this, "resetEvent");
}

// Variable declarations 
// autogenerated do not edit
GButton start; 
GTextField username; 
GButton backButton; 
GButton spinButton; 
GButton increaseBet; 
GButton decreaseBet; 
GCheckbox warningBox; 
GSlider numSymbols; 
GButton introStart; 
GButton guide; 
GButton withdraw; 
GButton deposit; 
GButton backButton_guide; 
GButton backtoSlotsButton; 
GButton increaseDepositAmount; 
GButton decreaseDeposit; 
GButton depositClick; 
GButton increaseWithdrawAmount; 
GButton decreaseWithdrawAmount; 
GButton withdrawClick; 
GButton reset; 
