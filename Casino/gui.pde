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
      }
    }
  }
  
  else{
    loginInputted = "False";
    
  }
} //_CODE_:username:503263:

public void password1_change1(GPassword source, GEvent event) { //_CODE_:password:447245:
  String enteredPassword = source.getPassword();
  
  if(enteredPassword.length() > 1){
    passwordInputted = "True";
  }
  
  else{
    passwordInputted = "False";
    
  }
} //_CODE_:password:447245:

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
} //_ //_CODE_:spinButton:399158:

public void increaseBetEvent(GButton source, GEvent event) { //_CODE_:increaseBet:800397:
  slotUser.betAmount += 5;
  
  if (min_betWarning) {
    min_betWarning = false; // Clear the warning when the bet is increased
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



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  
      String[] preGen = loadStrings("SavedData.txt");

      String lastUserInfo = preGen[preGen.length-1];
      String[] splitInfo = lastUserInfo.split(" ");
      String lastUserName = splitInfo[0];
  
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  start = new GButton(this, 465, 550, 100, 60);
  start.setText("Start!");
  start.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  start.addEventHandler(this, "startButton");
  username = new GTextField(this, 432, 373, 220, 30, G4P.SCROLLBARS_NONE);
  username.setOpaque(false);
  username.addEventHandler(this, "usernameLogin");
  username.setText(lastUserName);
  password = new GPassword(this, 432, 470, 220, 30);
  password.setMaxWordLength(10);
  password.setOpaque(true);
  password.addEventHandler(this, "password1_change1");
  backButton = new GButton(this, 0, 0, 80, 30);
  backButton.setText("Back");
  backButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  backButton.addEventHandler(this, "backButtonEvent");
  spinButton = new GButton(this, 500, 600, 112, 42);
  spinButton.setText("Spin!");
  spinButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  spinButton.addEventHandler(this, "spinSlotEvent");
  increaseBet = new GButton(this, 934, 275, 126, 49);
  increaseBet.setText("Increase Bet");
  increaseBet.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  increaseBet.addEventHandler(this, "increaseBetEvent");
  decreaseBet = new GButton(this, 934, 351, 126, 49);
  decreaseBet.setText("Decrease Bet");
  decreaseBet.setLocalColorScheme(GCScheme.RED_SCHEME);
  decreaseBet.addEventHandler(this, "decreaseBetEvent");
}

// Variable declarations 
// autogenerated do not edit
GButton start; 
GTextField username; 
GPassword password; 
GButton backButton; 
GButton spinButton; 
GButton increaseBet; 
GButton decreaseBet; 
