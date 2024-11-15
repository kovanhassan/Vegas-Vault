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
  windowName = "slots";
} //_CODE_:start:687561:

public void usernameLogin(GTextField source, GEvent event) { //_CODE_:username:503263:
   if (source.getText().length() > 0) {
    
    String[] savedData = loadStrings("SavedData.txt");

    for (int i = 0; i < savedData.length; i++) {
      String userInfo = savedData[i];
      String[] splitInfo = userInfo.split(" ");
      String userName = splitInfo[0];
      String inputedUser = source.getText();
      
      if(userName.equals(inputedUser)){
        loginInputted = "True";
        loggedUser = i;
        break;
      }
    }
  }
  
  else{
    loginInputted = "False";
  }
} //_CODE_:username:503263:

public void backButtonEvent(GButton source, GEvent event) { //_CODE_:backButton:657815:
  windowName = "login";
  
} //_CODE_:backButton:657815:

public void spinSlotEvent(GButton source, GEvent event) { //_CODE_:spinButton:399158:
  min_betWarning = false;
  insufficientFunds = false;
  if (slotUser.betAmount <= slotUser.balance) {
    
    if (slotMachine.isSpinning) {
        print();  
    } else {
        slotMachine.startSpin();
        slotUser.deduct();
    }
  } else {
    insufficientFunds = true; // Set to true if funds are insufficient
  }
} //} //_CODE_:spinButton:399158:

public void increaseBetEvent(GButton source, GEvent event) { //_CODE_:increaseBet:800397:
  slotUser.betAmount += 5;
  
  if (min_betWarning){
    min_betWarning = false;
  }
  
} //_CODE_:increaseBet:800397:

public void decreaseBetEvent(GButton source, GEvent event) { //_CODE_:decreaseBet:851747:
  int difference = slotUser.betAmount - 5;
  if(difference > 0){
    min_betWarning = false;
    slotUser.betAmount -=5;
    
    
  }
  
  else{
    min_betWarning = true;
  }
} //_CODE_:decreaseBet:851747:

public void changeNumberOfSymbolsEvent(GSlider source, GEvent event) { //_CODE_:numSymbols:926544:
  
  numberOfSymbols = numSymbols.getValueI();
  
  
  

  
} //_CODE_:numSymbols:926544:

public void warnignBoxEvent(GCheckbox source, GEvent event) { //_CODE_:warningBox:883808:
  warningChecked = true;
} //_CODE_:warningBox:883808:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:userSignUp:686135:
  println("userSignUp - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:userSignUp:686135:

public void passwordSignUpEvent(GTextField source, GEvent event) { //_CODE_:passwordSignUp:371538:
  println("passwordSignUp - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:passwordSignUp:371538:

public void confirmSignUpEvent(GButton source, GEvent event) { //_CODE_:confirmSignUp:887050:
  println("confirmSignUp - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:confirmSignUp:887050:

public void password1_change1(GTextField source, GEvent event) { //_CODE_:password:446972:
  if (source.getText().length() > 0 && loginInputted.equals("True")) {
      String[] savedData = loadStrings("SavedData.txt");
      String userInfo = savedData[loggedUser];
      String[] splitInfo = userInfo.split(" ");
      String userPass = splitInfo[1];
      String inputedPass = source.getText();
      
      if(userPass.equals(inputedPass)){
        passwordInputted = "True";
      }
  }
  
  else{
    passwordInputted = "False";
    }
} //_CODE_:password:446972:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  start = new GButton(this, 799, 582, 100, 60);
  start.setText("Start!");
  start.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  start.addEventHandler(this, "startButton");
  username = new GTextField(this, 740, 373, 220, 30, G4P.SCROLLBARS_NONE);
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
  increaseBet = new GButton(this, 890, 275, 126, 49);
  increaseBet.setText("Increase Bet");
  increaseBet.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  increaseBet.addEventHandler(this, "increaseBetEvent");
  decreaseBet = new GButton(this, 890, 351, 126, 49);
  decreaseBet.setText("Decrease Bet");
  decreaseBet.setLocalColorScheme(GCScheme.RED_SCHEME);
  decreaseBet.addEventHandler(this, "decreaseBetEvent");
  numSymbols = new GSlider(this, 762, 449, 333, 169, 10.0);
  numSymbols.setShowValue(true);
  numSymbols.setLimits(5, 5, 9);
  numSymbols.setNbrTicks(6);
  numSymbols.setStickToTicks(true);
  numSymbols.setNumberFormat(G4P.INTEGER, 0);
  numSymbols.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  numSymbols.setOpaque(false);
  numSymbols.addEventHandler(this, "changeNumberOfSymbolsEvent");
  warningBox = new GCheckbox(this, 667, 513, 423, 56);
  warningBox.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  warningBox.setText("By proceeding, you acknowledge that you are participating in a game of chance and agree to the terms and conditions associated with gambling.");
  warningBox.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  warningBox.setOpaque(false);
  warningBox.addEventHandler(this, "warnignBoxEvent");
  userSignUp = new GTextField(this, 159, 157, 120, 30, G4P.SCROLLBARS_NONE);
  userSignUp.setOpaque(true);
  userSignUp.addEventHandler(this, "textfield1_change1");
  passwordSignUp = new GTextField(this, 158, 210, 120, 30, G4P.SCROLLBARS_NONE);
  passwordSignUp.setOpaque(true);
  passwordSignUp.addEventHandler(this, "passwordSignUpEvent");
  confirmSignUp = new GButton(this, 176, 252, 80, 30);
  confirmSignUp.setText("Confirm");
  confirmSignUp.addEventHandler(this, "confirmSignUpEvent");
  password = new GTextField(this, 759, 419, 120, 30, G4P.SCROLLBARS_NONE);
  password.setOpaque(true);
  password.addEventHandler(this, "password1_change1");
}

// Variable declarations 
// autogenerated do not edit
GButton start; 
GTextField username; 
GButton backButton; 
GButton spinButton; 
GButton increaseBet; 
GButton decreaseBet; 
GSlider numSymbols; 
GCheckbox warningBox; 
GTextField userSignUp; 
GTextField passwordSignUp; 
GButton confirmSignUp; 
GTextField password; 
