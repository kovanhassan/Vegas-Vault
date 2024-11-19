float alpha = 0;  // Starting alpha for fading the logo
boolean fadeIn2 = true;
float alpha2 = 0;
boolean fadeIn = true; // Flag for controlling fade direction (fade in / fade out


boolean depositClicked = false;

long lastDepositTime = 0;  // Last time the deposit was made
boolean canDeposit = true;  // Flag to track if deposit is allowed

void displayScreen() {
  
    // Calculate the elapsed time since the last deposit
  long elapsedTime = millis() - lastDepositTime;
  

  textAlign(CENTER);
  if( windowName == "start"){

    // Fade in/out the logo with tint
    
    if (fadeIn) {
      alpha += 2;  // Increase alpha for fade-in
      if (alpha >= 255) {
       
         fadeIn = false; // Start fading out after fade-in completes
      }
    } 
    // Apply the tint with changing alpha
    tint(255, alpha);  // Full white color, but varying transparency
    
    
    
    
    
    
    
    backButton.setVisible(false);
    spinButton.setVisible(false);
    increaseBet.setVisible(false);
    decreaseBet.setVisible(false);
    numSymbols.setVisible(false);
    warningBox.setVisible(false);
    start.setVisible(false);
    username.setVisible(true);
    guide.setVisible(false);
    backButton_guide.setVisible(false);
    deposit.setVisible(false);
    withdraw.setVisible(false);
    depositClick.setVisible(false);
    increaseDepositAmount.setVisible(false);
    decreaseDeposit.setVisible(false);
    backtoSlotsButton.setVisible(false);
    withdrawClick.setVisible(false);
    decreaseWithdrawAmount.setVisible(false);
    increaseWithdrawAmount.setVisible(false);
    
    
    
    
    background(startBackground);
    textSize(30);
    
    if(!showWelcomeStatement){
    text("Set Username:", 550, 360);
    image(logo, 400,0);
    username.setVisible(true);

    if(introButtonVisible.equals("True") && !fadeIn){
      introStart.setVisible(true);
      
    }
    
    else{
      introStart.setVisible(false);
    }
    
    
    }
    
    else{
      image(logo, 400,0);
      text("Welcome Back:", 550, 360);
      username.setVisible(false);
      text(userName, 550, 400);
      
      if(!fadeIn){
      introStart.setVisible(true);
        
      }
      
      else{
        introStart.setVisible(false);
      }
      
      
    }

  }
  
  if (windowName == "start2") {
     //Fade in/out the logo with tint
    
    

    
    
    if (fadeIn2) {
      alpha2 += 2;  // Increase alpha for fade-in
      if (alpha2 >= 255) {
       
        print();
      }
    } 
    // Apply the tint with changing alpha
    tint(255, alpha2);  // Full white color, but varying transparency

    // Background and UI elements for login
    background(start2Background);
    textAlign(CENTER);
    
    // Draw the logo with fading effect
    image(logo, 700, 10);
    
    // Draw "Username" and "Password" labels
    textSize(30);
    

    // Handle visibility of UI elements
    username.setVisible(false);
    //password.setVisible(true);
    backButton.setVisible(false);
    spinButton.setVisible(false);
    increaseBet.setVisible(false);
    decreaseBet.setVisible(false);
    numSymbols.setVisible(false);
    warningBox.setVisible(true);
    introStart.setVisible(false);
    guide.setVisible(false);
    deposit.setVisible(false);
    withdraw.setVisible(false);


    

  //loginInputted.equals("True") && passwordInputted.equals("True")
    if (warningChecked) {
      start.setVisible(true);
    } else {
      start.setVisible(false);
    }
  }
  else if (windowName == "slots") {
    // Background for the slots game
    fill(255);
    tint(255,255);
     textSize(30);
    background(startBackground);
    
    minWithdrawWarning = false;
    maxWithdrawWarning = false;
    
    minDepositWarning = false;
    maxDepositWarning = false;

    // UI Elements visibility
    guide.setVisible(true);
    backButton.setVisible(true);
    start.setVisible(false);  // Hide start button
    username.setVisible(false);  // Hide username field
    spinButton.setVisible(true);
    increaseBet.setVisible(true);
    decreaseBet.setVisible(true);
    numSymbols.setVisible(true);
    warningBox.setVisible(false);
    backButton_guide.setVisible(false);
    deposit.setVisible(true);
    withdraw.setVisible(true);
    depositClick.setVisible(false);
    increaseDepositAmount.setVisible(false);
    decreaseDeposit.setVisible(false);
    backtoSlotsButton.setVisible(false);
    withdrawClick.setVisible(false);
    decreaseWithdrawAmount.setVisible(false);
    increaseWithdrawAmount.setVisible(false);

    // Display slot machine stats and reels
    
    slotUser.displayStats();
    slotMachine.displayReels();
    slotMachine.spin();
    
    fill(255);
    text("Number Of Symbols"+":",185,395);
    

    // Display "Insufficient Funds" message if needed
    if (insufficientFunds) {
      textAlign(CENTER);
      
      fill(255);
      text("Insufficient Funds", width / 2, 170);
    }
    
    // Display "Minimum Bet Reached" warning
    if (min_betWarning) {
      insufficientFunds = false;  // Reset insufficient funds message
      textAlign(CENTER);
      
      fill(255);
      text("Minimum Bet Reached!", width / 2, 170);
    }
  }
  
  
  if(windowName == "rules"){
    
    
    

    
    
    background(slotsBackground);
    
    
    deposit.setVisible(false);
    withdraw.setVisible(false);
    introStart.setVisible(false);
    numSymbols.setVisible(false);
    increaseBet.setVisible(false);
    decreaseBet.setVisible(false);
    spinButton.setVisible(false);
    backButton.setVisible(false);
    backButton_guide.setVisible(true);
    guide.setVisible(false);

    
    image(rules,-150,-100);

  }
  
  if(windowName == "deposit"){
    background(255);
    
    
    
    deposit.setVisible(false);
    withdraw.setVisible(false);
    introStart.setVisible(false);
    numSymbols.setVisible(false);
    increaseBet.setVisible(false);
    decreaseBet.setVisible(false);
    spinButton.setVisible(false);
    backButton.setVisible(false);
    guide.setVisible(false);
    backButton_guide.setVisible(false);
    username.setVisible(false);
    warningBox.setVisible(false);
    start.setVisible(false);
    depositClick.setVisible(true);
    increaseDepositAmount.setVisible(true);
    decreaseDeposit.setVisible(true);
    backtoSlotsButton.setVisible(true);
    
    
    image(paypalLogo,400,0);
    slotUser.displayDepositStats();
    
    if(minDepositWarning){
       text("Minimum Deposit Reached!", width / 2, 470);
    }
    
    else if(maxDepositWarning){
      text("Maximum Deposit Reached!", width / 2, 470);
      
    }
    
      if (elapsedTime <= 20000 && depositClicked ) {  // 120,000 ms = 2 minutes
      text("Deposit is paused. Waiting for cooldown...",550,600);
      depositClick.setVisible(false);
    } else {
      // Otherwise, hide the deposit button
      
      depositClick.setVisible(true);
    }

  }
  
  
  if(windowName == "withdraw"){
    background(255);
    
    deposit.setVisible(false);
    withdraw.setVisible(false);
    introStart.setVisible(false);
    numSymbols.setVisible(false);
    increaseBet.setVisible(false);
    decreaseBet.setVisible(false);
    spinButton.setVisible(false);
    backButton.setVisible(false);
    guide.setVisible(false);
    backButton_guide.setVisible(false);
    username.setVisible(false);
    warningBox.setVisible(false);
    start.setVisible(false);
    backtoSlotsButton.setVisible(true);
    withdrawClick.setVisible(true);
    decreaseWithdrawAmount.setVisible(true);
    increaseWithdrawAmount.setVisible(true);
    
    
    image(paypalLogo,400,0);
    slotUser.displayWithdrawStats();
    
    if(minWithdrawWarning){
       text("Minimum Withdraw Reached!", width / 2, 470);
    }
    
    
    else if(maxWithdrawWarning){
      text("Maximum Withdraw Reached!", width / 2, 470);
      
    }
    
  }
  
  
}
