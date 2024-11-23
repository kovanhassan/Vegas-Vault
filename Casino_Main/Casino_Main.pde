import g4p_controls.*;

//Global Variables

//Images
PImage startBackground, start2Background, slotsBackground,logo,jackpot,rules,paypalLogo,dep_witBackground; 

//Inital Window
String windowName = "start";

//Gambling Warning
boolean warningChecked = false; 

Slots slotMachine;
User slotUser;

int numRows = 2;
int userBalance; 
int betAmount = 10; //Inital Bet Amount
boolean insufficientFunds; // No Funds Warning

int numberOfSymbols = 5;
String introButtonVisible = "False";
String userName;
boolean showWelcomeStatement = false;

//Initial Deposit and Withdraw Amounts
int depositAmount = 100; 
int withdrawAmount = 100; 

//Deposit and Withdraw Warnings
boolean minDepositWarning = false;
boolean maxDepositWarning = false;
boolean minWithdrawWarning = false;
boolean maxWithdrawWarning = false;

//Variables For Fade In Animation
float alpha = 0;  
boolean fadeIn2 = true;
float alpha2 = 0;
boolean fadeIn = true; 


boolean depositClicked = false;
long lastDepositTime = 0;  // Last time the deposit was made
boolean canDeposit = true;  // Flag to track if deposit is allowed
boolean noBalanceToWithdrawWarning = false; // Limited Balance Warning
boolean max_betWarning = false; // Max Bet Warning
boolean min_betWarning; // Min Bet Warning
int showreset = 0;

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
  
  dep_witBackground = loadImage("Images/depbackground.jpg");
  dep_witBackground.resize(width,height);
  
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
