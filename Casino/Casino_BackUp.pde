import g4p_controls.*;

//Global Variables
PImage startBackground, start2Background, slotsBackground,logo,jackpot,rules,paypalLogo;
PImage cherry,seven,watermelon;
String windowName = "start";
boolean warningChecked = false;
Slots slotMachine;
User slotUser;
int numRows = 2;
int userBalance;
int betAmount = 10;
boolean insufficientFunds;
boolean min_betWarning;
int loggedUser = 0;
int numberOfSymbols = 5;
String introButtonVisible = "False";
String userName;
boolean showWelcomeStatement = false;
int depositAmount = 100;
int withdrawAmount = 100; 
boolean minDepositWarning = false;
boolean maxDepositWarning = false;
boolean minWithdrawWarning = false;
boolean maxWithdrawWarning = false;
float alpha = 0;  // Starting alpha for fading the logo
boolean fadeIn2 = true;
float alpha2 = 0;
boolean fadeIn = true; // Flag for controlling fade direction (fade in / fade out
boolean depositClicked = false;
long lastDepositTime = 0;  // Last time the deposit was made
boolean canDeposit = true;  // Flag to track if deposit is allowed


//Setup 
void setup(){
  //Screen Size is 1100x800
  size(1100,800);
  
  //Loads the texts from SavedName text file and get the username out of that file
  String[] preload1 = loadStrings("SavedName.txt");
  userName = preload1[0];
  
  //If that username is noName, the user will be greeted with a username input instead of a welcome back statement
  if(userName.equals("noName")){
    showWelcomeStatement = false;
  }
  
  
  // Else, show Welcome Statement as the user already has his account on the software
  else{
    showWelcomeStatement = true;
  }
  
  
  // Loads the balance in $ from the SavedData text file and put that to the userBalance variable
  String[] preload2 = loadStrings("SavedData.txt");
  userBalance = int(preload2[0]);
  
  //Loading paypal logo image
  paypalLogo = loadImage("Images/paypal.png");
  paypalLogo.resize(300,300);
  
  // Loading rules
  rules = loadImage("Images/rules.png");
  rules.resize(1400,1000);
  
  //loading Start1Background
  startBackground = loadImage("Images/start1background.jpg");
  startBackground.resize(width,height);
  
  // loading Vegas Vault Logo
  logo = loadImage("Images/Vegas_Vault_Logo.png");
  logo.resize(320,320);
  
  // loading jackpot symbol 
  jackpot = loadImage("Images/jackpot.png");
  jackpot.resize(300,100);
  
  //loading start2 background
  start2Background = loadImage("Images/purplebackground.jpg");
  start2Background.resize(1100, 800);
  
  //Creating a symbols array with PImage Type to hold the symbols of the slot machine
  PImage[] symbols = new PImage[9];
  
  //Symbols of the slot machine that can be shown on the slotMachine
  symbols[0] = loadImage("Images/cherry.png");
  symbols[1] = loadImage("Images/seven.png");
  symbols[2] = loadImage("Images/watermelon.png");
  symbols[3] = loadImage("Images/lemon.png");
  symbols[4] = loadImage("Images/crystal.png");
  symbols[5] = loadImage("Images/orange.png");
  symbols[6] = loadImage("Images/777.png");
  symbols[7] = loadImage("Images/emerald.png");
  symbols[8] = loadImage("Images/bell.png");
  
  //New SlotMachine 
  slotMachine = new Slots(200,3,120, symbols);
  //Creating new user
  slotUser = new User(userName,userBalance,0,betAmount,depositAmount,withdrawAmount);
  
  
  //loading slot machine background
  slotsBackground = loadImage("Images/slotsBackground.jpg");
  slotsBackground.resize(width, height);
  
  //Creates GUI
  createGUI();
  
}

// Draw
void draw(){

  // Calls displayScreen function
  displayScreen();
  
}
