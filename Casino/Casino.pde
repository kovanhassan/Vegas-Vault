import g4p_controls.*;

PImage startBackground, start2Background, slotsBackground,logo,jackpot;
PImage cherry,seven,watermelon;
String windowName = "start";
String loginInputted = "False";
String passwordInputted = "False";
boolean warningChecked = false;
Slots slotMachine;
User slotUser;
int numRows = 2;
int userBalance;
int betAmount = 10;
boolean insufficientFunds;
boolean min_betWarning;
int loggedUser = 0;
int numberOfSymbols = 2;
String introButtonVisible = "False";
String userName;
boolean showWelcomeStatement = false;

void setup(){
  size(1100,800);
  
  
  
  String[] preload1 = loadStrings("SavedName.txt");
  userName = preload1[0];
  
  if(userName.equals("noName")){
    showWelcomeStatement = false;
    
   
  }
  
  else{
    showWelcomeStatement = true;
    userName = preload1[0];
    
  }
  

  
  
  
  
  // Load login information from file and check credentials
  String[] preload2 = loadStrings("SavedData.txt");
  userBalance = int(preload2[0]);
  
  
  startBackground = loadImage("Images/start1background.jpg");
  startBackground.resize(width,height);
  
  logo = loadImage("Images/Vegas_Vault_Logo.png");
  logo.resize(320,320);
  
  jackpot = loadImage("Images/jackpot.png");
  jackpot.resize(300,100);
  
  start2Background = loadImage("Images/purplebackground.jpg");
  start2Background.resize(1100, 800);
  
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
  
}

void draw(){

  displayScreen();
  text(userName,20,20);
  
  
  
  
  
  
  
  
  
}
