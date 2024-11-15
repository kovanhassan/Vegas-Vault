float alpha = 0;  // Starting alpha for fading the logo
boolean fadeIn = true;  // Flag for controlling fade direction (fade in / fade out)
boolean loginVisible = false;  // Flag to manage visibility of login elements

void displayScreen() {
  if (windowName == "login") {
    // Fade in/out the logo with tint
    if (fadeIn) {
      alpha += 4;  // Increase alpha for fade-in
      if (alpha >= 255) {
       
        fadeIn = false;  // Start fading out after fade-in completes
      }
    } 
    // Apply the tint with changing alpha
    tint(255, alpha);  // Full white color, but varying transparency

    // Background and UI elements for login
    background(loginBackground);
    textAlign(CENTER);
    
    // Draw the logo with fading effect
    image(logo, 700, 10);
    
    // Draw "Username" and "Password" labels
    textSize(30);
    text("Username:", 805, 360);
    text("Password:", 805, 455);

    // Handle visibility of UI elements
    username.setVisible(true);
    password.setVisible(true);
    backButton.setVisible(false);
    spinButton.setVisible(false);
    increaseBet.setVisible(false);
    decreaseBet.setVisible(false);
    numSymbols.setVisible(false);

    // Load login information from file and check credentials
    
    if (loginInputted = true && passwordInputted && warningChecked) {
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
    password.setVisible(false);  // Hide password field
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
      textSize(32);
      fill(255, 0, 0);  // Red color for warning
      text("Insufficient Funds", width / 2, 170);
    }
    
    // Display "Minimum Bet Reached" warning
    if (min_betWarning) {
      insufficientFunds = false;  // Reset insufficient funds message
      textAlign(CENTER);
      fill(255, 255, 0);  // Yellow color for warning
      text("Minimum Bet Reached!", width / 2, 170);
    }
  }
}
