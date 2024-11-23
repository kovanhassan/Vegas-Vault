//Display Function
void displayScreen() {
  
  // Calculate the elapsed time since the last deposit
  long elapsedTime = millis() - lastDepositTime;
  
  textAlign(CENTER);

  //If window name is start
  if( windowName == "start"){

    //Inital Animation
    
    //If fadeIn:
    if (fadeIn) {
      alpha += 2;  // Increase alpha for fade-in
      if (alpha >= 255) {
       
         fadeIn = false; // Start fading out after fade in completes
      }
    } 
    // Apply the tint with changing alpha
    tint(255, alpha);  
    
    // Showing the visible or not visible GUI 
    backButton.setVisible(false);
    spinButton.setVisible(false);
    increaseBet.setVisible(false);
    decreaseBet.setVisible(false);
    numSymbols.setVisible(false);
    warningBox.setVisible(false);
    start.setVisible(false);
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
    reset.setVisible(false);
    username.setVisible(true);
    
    //Assign startBackground to the display
    background(startBackground);
    textSize(30);
    
    // If showWelcomeStatement is false, we print the text of "Set Username" and we show the username GUI box
    if(!showWelcomeStatement){
    
      text("Set Username:", 550, 360);
      image(logo, 400,0);
      username.setVisible(true);

    // If introButtionVisible equals True and fadeIn is false, the intro start button becomes visible
    // introButtionVisible becomes true when characters are typed into the username box
      if(introButtonVisible.equals("True") && !fadeIn){
        introStart.setVisible(true); 
      }
    
    //Else, dont show the introStart Buttion
      else{
        introStart.setVisible(false);
      }
    }
    
    //Else, show logo, welcome back statement, disable the username GUI
    else{
      image(logo, 400,0);
      text("Welcome Back:", 550, 360);
      username.setVisible(false);
      text(userName, 550, 400);
      
      //If Not fading in anymore, the intro button will show
      if(!fadeIn){
        introStart.setVisible(true);
        reset.setVisible(true);   
      }
      
      //Else: the intro button will not show when the fade in animation is occuring
      else{
        introStart.setVisible(false);
      }
    }
  }
  
  //If window name is "start2"
  if (windowName == "start2") {
    //Fade in/out the logo with tint
    
    // If fadeIn2 is equal to true
    if (fadeIn2) {
      alpha2 += 2;  // Increase alpha for fade-in
    } 
    // Apply the tint with changing alpha
    tint(255, alpha2);  

    //Background for window
    background(start2Background);
       
    // Draw the betting software's logo
    image(logo, 700, 10);
       
    textSize(30);
    
    // Handle visibility of UI elements
    username.setVisible(false);
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
    reset.setVisible(false);

    //If the warning has been clicked by the user, the start button will show and user can proceed to software
    if (warningChecked) {
      start.setVisible(true);
    } 
    
    //Else, dont show the start button as the checkbox warning was NOT clicked
    else {
      start.setVisible(false);
    }
  }
  
  // If window name is slots
  if (windowName == "slots") {
    
    
    
    textSize(30);
    
    //Background
    background(startBackground);
    
    
    //Turn Off All the warnings for Depositing and Withdrawing 
    minWithdrawWarning = false;
    maxWithdrawWarning = false;
    minDepositWarning = false;
    maxDepositWarning = false;

    // GUI visibility
    guide.setVisible(true);
    backButton.setVisible(true);
    start.setVisible(false);  
    username.setVisible(false);  
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

    // Display slot machine stats,display reels and have the maching 
    // (although isSpinning is false preventing the machine from spinning at all times)
    slotUser.displayStats();
    slotMachine.displayReels();
    slotMachine.spin();
    
    fill(255);
    
    //Number Of Symbols Text Above Slider
    text("Number Of Symbols"+":",185,395);
    

    // Display "Insufficient Funds" message if needed
    if (insufficientFunds) {
      textAlign(CENTER);
      
      fill(255);
      text("Insufficient Funds", width / 2, 170);
    }
    
    // Display "Minimum Bet Reached" warning
    if (min_betWarning) {
      insufficientFunds = false;  // Reset insufficient funds message to prevent overlapping of texts
      textAlign(CENTER);
      fill(255);
      text("Minimum Bet Reached!", width / 2, 170);
    }
  }
  
  
  //if window name is rules
  if(windowName == "rules"){
    

    // Use our green casino themed background
    background(slotsBackground);
    
    // Displayed/Not Displayed GUI
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

    
    // Display Set Of Rules
    image(rules,-150,-100);

  }
  
  
  // If Window Name Is Deposit
  if(windowName == "deposit"){
    background(dep_witBackground);
    
    
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
       text("Minimum Deposit Reached!", width / 2, 480);
    }
    
    else if(maxDepositWarning){
      text("Maximum Deposit Reached!", width / 2, 480);
      
    }
    
      if (elapsedTime <= 20000 && depositClicked ) {  // 120,000 ms = 2 minutes
      text("Deposit is paused. Waiting for cooldown...",550,440);
      depositClick.setVisible(false);
    } else {
      // Otherwise, hide the deposit button
      
      depositClick.setVisible(true);
    }

  }
  
  
  if(windowName == "withdraw"){
    background(dep_witBackground);
    
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
