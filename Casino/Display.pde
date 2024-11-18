float alpha = 0;  // Starting alpha for fading the logo
boolean fadeIn2 = true;
float alpha2 = 0;
boolean fadeIn = true;// Flag for controlling fade direction (fade in / fade out)


void displayScreen() {
  
  
  
  if( windowName == "start"){

    // Fade in/out the logo with tint
    println(alpha);
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
    
  
    
    
    
    background(startBackground);
    textSize(30);
    
    if(!showWelcomeStatement){
    text("Set Username:", 450, 360);
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
      text("Welcome Back:", 450, 360);
      username.setVisible(false);
      text(userName, 450, 460);
      
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
       
        print();;  // Start fading out after fade-in completes
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
    text("Username:", 805, 360);
    text("Password:", 805, 455);

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
    


    

  //loginInputted.equals("True") && passwordInputted.equals("True")
    if (warningChecked) {
      start.setVisible(true);
    } else {
      start.setVisible(false);
    }
  }
  else if (windowName == "slots") {
    // Background for the slots game
    tint(255,255);
    background(slotsBackground);

    // UI Elements visibility
    backButton.setVisible(true);
    start.setVisible(false);  // Hide start button
    //password.setVisible(false);  // Hide password field
    username.setVisible(false);  // Hide username field
    spinButton.setVisible(true);
    increaseBet.setVisible(true);
    decreaseBet.setVisible(true);
    numSymbols.setVisible(true);
    warningBox.setVisible(false);

    // Display slot machine stats and reels
    slotUser.displayStats();
    slotMachine.displayReels();
    slotMachine.spin();

    // Display "Insufficient Funds" message if needed
    if (insufficientFunds) {
      textAlign(CENTER);
      
      
      text("Insufficient Funds", width / 2, 170);
    }
    
    // Display "Minimum Bet Reached" warning
    if (min_betWarning) {
      insufficientFunds = false;  // Reset insufficient funds message
      textAlign(CENTER);
      
      text("Minimum Bet Reached!", width / 2, 170);
    }
  }
}
