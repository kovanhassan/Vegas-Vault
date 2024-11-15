import g4p_controls.*;

PImage loginBackground, slotsBackground,logo,jackpot;
PImage cherry,seven,watermelon;
String windowName = "login";
Boolean loginInputted = false;
Boolean passwordInputted = false;
boolean warningChecked = false;
Slots slotMachine;
User slotUser;
int numRows = 2;
int userBalance = 100;
int betAmount = 10;
boolean insufficientFunds;
boolean min_betWarning;
int loggedUser = 0;
int numberOfSymbols = 2;

void setup(){
  size(1100,800);
  
  logo = loadImage("Images/Vegas_Vault_Logo.png");
  logo.resize(320,320);
  
  jackpot = loadImage("Images/jackpot.png");
  jackpot.resize(300,100);
  
  loginBackground = loadImage("Images/purplebackground.jpg");
  loginBackground.resize(1100, 800);
  
  PImage[] symbols = new PImage[9];
  symbols[0] = loadImage("Images/cherry.png");
  symbols[1] = loadImage("Images/seven.png");
  symbols[2] = loadImage("Images/watermelon.png");
  symbols[3] = loadImage("Images/lemon.png");
  symbols[4] = loadImage("Images/crystal.png");
  symbols[5] = loadImage("Images/orange.png");
  symbols[6] = loadImage("Images/777.png");
  symbols[7] = loadImage("Images/emerald.png");
  symbols[8] = loadImage("Images/bell.png");
  
  slotMachine = new Slots(200,3,120, symbols);
  slotUser = new User("John",userBalance,0,betAmount);
  
  slotsBackground = loadImage("Images/slotsBackground.jpg");
  slotsBackground.resize(width, height);
  
  createGUI();
  
  String[] savedData = loadStrings("SavedData.txt");
  if (savedData.length > 0) {
      String userInfo = savedData[savedData.length - 1];
      String[] splitInfo = userInfo.split(" ");
      String userName = splitInfo[0];
      String userPass = splitInfo[1];
      username.setText(userName);
      password.setText(userPass);
      Boolean loginInputted = true;
      Boolean passwordInputted = true;
  }
}

void draw(){
  
  println(loginInputted, passwordInputted);

  displayScreen();
  
  
  
  
  
  
  
  
  
}
