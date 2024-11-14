import g4p_controls.*;

PImage loginBackground, slotsBackground,logo;
PImage cherry,seven,watermelon;
String windowName = "login";
String loginInputted = "False";
String passwordInputted = "False";
Slots slotMachine;
User slotUser;
int numRows = 2;
int userBalance = 100;
int betAmount = 10;
boolean insufficientFunds;
boolean min_betWarning;
int loggedUser = 0;

void setup(){
  size(1100,800);
  
  logo = loadImage("Images/Vegas_Vault_Logo.png");
  logo.resize(300,300);
  
  loginBackground = loadImage("Images/mainBackground.jpg");
  loginBackground.resize(width, height);
  
  PImage[] symbols = new PImage[5];
  symbols[0] = loadImage("Images/cherry.png");
  symbols[1] = loadImage("Images/seven.png");
  symbols[2] = loadImage("Images/watermelon.png");
  symbols[3] = loadImage("Images/lemon.png");
  symbols[4] = loadImage("Images/crystal.png");
  //symbols[5] = loadImage("Images/orange.png");
  //symbols[6] = loadImage("Images/777.png");
  //symbols[7] = loadImage("Images/emerald.png");
  //symbols[8] = loadImage("Images/bell.png");
  
  slotMachine = new Slots(200,3,120, symbols);
  slotUser = new User("John",userBalance,0,betAmount);
  
  slotsBackground = loadImage("Images/slotsBackground.jpg");
  slotsBackground.resize(width, height);
  
  createGUI();
  
}

void draw(){

  displayScreen();

  
  
  
  
  
}
