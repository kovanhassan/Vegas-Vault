void displayScreen() {
  if (windowName == "login") {
    background(loginBackground);
    textAlign(CENTER);
    textSize(58);  // Large size for the header text (logo)
    image(logo, 400, 30);

    textSize(30);  // Regular size for "Username" and "Password"
    text("Username:", width / 2 - 55, 360);
    text("Password:", width / 2 - 55, 455);

    username.setVisible(true);
    password.setVisible(true);
    backButton.setVisible(false);
    spinButton.setVisible(false);
    increaseBet.setVisible(false);
    decreaseBet.setVisible(false);

    if (loginInputted.equals("True") && passwordInputted.equals("True")) {
      start.setVisible(true);
    } else {
      start.setVisible(false);
    }
  }
  else if (windowName == "slots") {
    background(slotsBackground);
    backButton.setVisible(true);
    start.setVisible(false);
    password.setVisible(false);
    username.setVisible(false);
    spinButton.setVisible(true);
    increaseBet.setVisible(true);
    decreaseBet.setVisible(true);

    slotUser.displayStats();
    slotMachine.displayReels();
    slotMachine.spin();

    // Show "Insufficient Funds" message with specific size
    if (insufficientFunds) {
      textAlign(CENTER);
      text("Insufficient Funds", width / 2, 170);
    }
    
    
    if (min_betWarning){
      insufficientFunds = false;
      
      text("Minimum Bet Reached!", width/2,170);
      
        
      }
      
      
      
      
      
    }
  }
