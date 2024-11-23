//Display Function
void displayScreen() {
  
  // Calculate the elapsed time since the last deposit
  long elapsedTime = millis() - lastDepositTime;
  textAlign(CENTER);
  
  //"Start" window screen
  if( windowName == "start"){

    //Inital Animation
    //If fadeIn:
    if (fadeIn) {
      
      // Increase alpha for fade-in
      alpha += 2;  
      
      if (alpha >= 255) {
        
         // Switch fadeIn off
         fadeIn = false;
      }
    } 
    
    // Apply the tint with changing alpha
    tint(255, alpha);  
    
    // Showing the visible or not visible GUI 
    showGUI_start();
    
    //Make Sure That reset.setVisible is ONLY setVISIBLE to FALSE ONCE to avoid bugging
    if(showreset == 0){
      reset.setVisible(false);
      showreset++;
    }

    
    //Assign startBackground to the display
    background(startBackground);
    textSize(30);
    
    // If showWelcomeStatement is false, we print the text of "Set Username" and we show the username GUI box
    if(!showWelcomeStatement){
    
    // Reset Button will be hidden
    reset.setVisible(false);
    text("Set Username:", 550, 360);
    image(logo, 400,0);
    username.setVisible(true);

    // If introButtonVisible equals True and fadeIn is false, the intro start button becomes visible
    // *Note*: introButtionVisible becomes true when characters are typed into the username box
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
      
      //If fading animation is finished, the intro and reset button will be visible
      if(!fadeIn){
      introStart.setVisible(true);
      reset.setVisible(true);
      }
      
      //If fading animation is still going on, the intro button will not show
      else{
        introStart.setVisible(false);
      }
      
    }
  }
  
  
  
  
  //"START2" window screen
  if (windowName == "start2") {
  
    // If fadeIn2 is equal to true
    if (fadeIn2) {
      
      // Increase alpha for fade-in
      alpha2 += 2;  
      
      if (alpha2 >= 255) {
       
        // Switch fadeIn2 off
        fadeIn2 = false;
      }
    } 
    // Apply the tint with changing alpha
    tint(255, alpha2);  

    //Background for window
    background(start2Background);
   
    textAlign(CENTER);
    
    // Draw the betting software's logo
    image(logo, 700, 10);
    textSize(30);
    

    // Handle visibility of GUI elements
    showGUI_start2();


    //If the warning has been clicked by the user and animation has finished, the start button will show and user can proceed to software
    if (warningChecked && !fadeIn2) {
      start.setVisible(true);
    } 
    
    //Else, dont show the start button as the checkbox warning was NOT clicked or animation will not completed
    else {
      start.setVisible(false);
    }
  }
  
  // "Slots" window tab
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
    showGUI_slots();

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
    
    // If Max Bet Warning
    if(max_betWarning){
      
      // Reset insufficient funds message to prevent overlapping of texts
      insufficientFunds = false;  
      textAlign(CENTER);
      fill(255);
      
      //Print Text to tell user max bet has been reached
      text("Maximum Bet Reached!", width / 2, 170);
      
    }
    
    
    // Display "Minimum Bet Reached" warning if its true
    else if (min_betWarning) {
      insufficientFunds = false;  // Reset insufficient funds message to prevent overlapping of texts
      textAlign(CENTER);
      fill(255);
      text("Minimum Bet Reached!", width / 2, 170);
    }
  }
  
  
  //Rules Window
  if(windowName == "rules"){
    

    // Use our green casino themed background
    background(slotsBackground);
    
    // Displayed/Not Displayed GUI
    showGUI_rules();
    
    // Display Set Of Rules
    image(rules,-150,-100);

  }
  
  
  // Deposit Window
  if(windowName == "deposit"){
    //Background
    background(dep_witBackground);
    
    //Showing/Not Visible GUI
    showGUI_deposit();
    
    //Display PayPal Logo
    image(paypalLogo,400,0);
    
    // Showcase Deposit Stats
    slotUser.displayDepositStats();
    
    
    // if Min Deposit Warning, warn the user
    if(minDepositWarning){
       text("Minimum Deposit Reached!", width / 2, 480);
    }
    
    // if Max Deposit Warning, warn the user
    else if(maxDepositWarning){
      text("Maximum Deposit Reached!", width / 2, 480);
      
    }
    
    
      // Once user clicks deposit, there will be a cooldown
      if (elapsedTime <= 40000 && depositClicked ) {  // 40,000 ms = 40 seconds
      text("Deposit is paused. Waiting for cooldown...",550,440);
      depositClick.setVisible(false);
    } else {
      // Otherwise, hide the deposit button
      
      depositClick.setVisible(true);
    }

  }
  
  //Withdraw Page
  if(windowName == "withdraw"){
    
    //Background
    background(dep_witBackground);
    
    
    //Show/Not Show GUI
    showGUI_withdraw();
    
    //Display PayPal logo
    image(paypalLogo,400,0);
    
    //Display User Withdraw Stats
    slotUser.displayWithdrawStats();
    
    
    //Warn user that they cannot withdraw
    if(noBalanceToWithdrawWarning){
      text("Limited Balance To Withdraw!", width / 2, 470);
    }
    
    
    // Warn user about min withdraw amount
    if(minWithdrawWarning){
       text("Minimum Withdraw Reached!", width / 2, 470);
    }
    
    // Warn user about max withdraw amount
    else if(maxWithdrawWarning){
      text("Maximum Withdraw Reached!", width / 2, 470);
      
    }
    
  }
  
}
