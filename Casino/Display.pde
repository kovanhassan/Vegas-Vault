void displayScreen(){
  
  if(windowName == "login"){
    background(loginBackground);
    textAlign(CENTER);
    textSize(58);
    image(logo, 400, 30);
    textSize(30);
    text("Username:", width/2 - 55, 360);
    text("Password:", width/2 - 55, 455);
    
    username.setVisible(true);
    password.setVisible(true);
    backButton.setVisible(false);
    spinButton.setVisible(false);
    
    String[] preload = loadStrings("SavedData.txt");
    String logininfo = preload[preload.length - 1];
    String[] datasplit = logininfo.split(" ");
    String loginInputted = datasplit[3];
    String passwordInputted = datasplit[4];
    
    if (loginInputted.equals("True") && passwordInputted.equals("True")) {
      start.setVisible(true);
    } else {
      start.setVisible(false);
    }
  }
  
  else if(windowName == "slots"){
    background(slotsBackground);
    
    backButton.setVisible(true);
    start.setVisible(false);
    password.setVisible(false);
    username.setVisible(false);
    spinButton.setVisible(true);
    
    
    
    slotUser.displayStats();
    slotMachine.displayReels();
    slotMachine.spin();
    
    
    
    
    
    
    
  }
}
