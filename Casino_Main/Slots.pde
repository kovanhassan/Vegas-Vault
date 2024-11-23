class Slots {
  
  // Fields
  int y; // the vertical position of the slot machine
  int numRows;  // number of rows in the slot machine
  int numCols = 3; // Number of columns (FIXED TO THREE)
  int symbolSize; // Size of each slot symbol
  PImage[] symbols; // array holding slot machine symbol images
  int[][] currentSymbols; // 2D array storing the current displayed symbols
  
  int spinCounter; // used to track the duration of a spin
  boolean isSpinning; // used to decide when the slot machine is currently spinning OR not spinning
  
  boolean displayWinningLines; // used whether to display the winning lines
  int winnings; // variable to count how many dollars the user won
  int winCount = 0;  // variable to count the number of winning lines

  // Constructor
  Slots(int y, int numRows, int symbolSize, PImage[] symbols) {
    this.y = y;
    this.numRows = numRows;
    this.symbolSize = symbolSize;
    this.symbols = symbols;
    this.currentSymbols = new int[numRows][numCols];  // Initialize the 2D array for symbols
    this.spinCounter = 0; // Initialize spin counter
    this.isSpinning = false; // Slot starts in a NON SPINNING STATE
    this.displayWinningLines = false;  // Default: do not display winning lines (CHANGED DEPEDNING IF WON OR NOT)
  }

//METHODS

  // Method to start the spin
  void startSpin() {
    
    // Clear any minimum bet warnings
    min_betWarning = false;
    
    // set spinning state to true
    isSpinning = true;
    
    // reset the spin counter
    spinCounter = 0;
    
    // Reset win count each time the spin starts
    winCount = 0;  
    
    // Reset winning lines display when spin starts
    displayWinningLines = false; 
    
    //As spin starts, this is set to false to disallow users from changing the number of symbols Slider
    numSymbols.setEnabled(false);
    
  }

  // Method to spin the slot machine
  void spin() {
    
    // If isSpinning is set to true
    if (isSpinning) {
      
      // Increment the spin counter
      spinCounter++;
      
      // Disable all major buttons on the slot window
      spinButton.setEnabled(false);
      increaseBet.setEnabled(false);
      decreaseBet.setEnabled(false);
      
      // Randomly update the symbols during the spin
      for (int row = 0; row < numRows; row++) {
        for (int col = 0; col < numCols; col++) {
          
          // Randomly update symbols based on spinCounter, ensuring they change unpredictably and at varying intervals
          if (spinCounter % int(random(5, 10)) == 0) {
            
             currentSymbols[row][col] = int(random(numberOfSymbols));  // Assign a random symbol
            
          }
        }
      }
      
      // If spin cycles is greater than 100
      if (spinCounter > 100) {
        
        // stops spinning
        isSpinning = false;
        
        // Re-enable the main GUI in the slot window
        spinButton.setEnabled(true);
        increaseBet.setEnabled(true);
        decreaseBet.setEnabled(true);
        numSymbols.setEnabled(true);
        
        // Check For Wins
        checkForWin();  
        
        // Calculate winnings based on the results of the slots
        calculateWinnings();  
        
        
        
      }
    }
  }

  // Method to display reels
  void displayReels() {
    
    //Called in order to make the background of the slot machine black
    drawSlotBlack();
    
    // calculate total width of the slot machine
    int totalWidth = numCols * symbolSize;
    
    // center the slot machine horizontally in the window screen
    int startX = (width - totalWidth) / 2;


    // display each symbol at its RESPECTIVE position
    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        
        // Calculate x position of the symbol
        int symbolX = startX + col * symbolSize;
        
        // Calculating the y position of the symbol
        int symbolY = y + row * symbolSize;
        
        // get the current symbol
        PImage symbol = symbols[currentSymbols[row][col]];
        
        // display the symbol
        image(symbol, symbolX, symbolY, symbolSize, symbolSize);
      }
    }

    // If there are winning lines, display the results
    if (displayWinningLines) {
      // Display jackpot image
      image(jackpot,400,80);
      fill(0,180,0);
      
      // Display winnings
      text("You Won: $"+winnings,550,50);
      
       // Highlight winning lines
      showWinningLines();
     
    }
  }

  // Check for winning combinations
  void checkForWin() {
    
    //For loop checking for ROW WINS
    for (int row = 0; row < numRows; row++) {
      if (currentSymbols[row][0] == currentSymbols[row][1] && currentSymbols[row][1] == currentSymbols[row][2]) {
        drawLineBetweenSymbols(row, 0, row, 2); // draw line across the winning row
        
        //Increment winCount
        winCount++;
        
         // Set to true if there's a winning line
        displayWinningLines = true; 
      }
    }

    //For loop checking for COL WINS
    for (int col = 0; col < numCols; col++) {
      if (currentSymbols[0][col] == currentSymbols[1][col] && currentSymbols[1][col] == currentSymbols[2][col]) {
        drawLineBetweenSymbols(0, col, 2, col); // draw line across the winning column
        
        // Increment Win Count
        winCount++;
        
        // Set flag to display winning lines
        displayWinningLines = true;
      }
    }

    //If Statement checking for DIAGONAL WINS (Top left to bottom right)
    if (currentSymbols[0][0] == currentSymbols[1][1] && currentSymbols[1][1] == currentSymbols[2][2]) {
      drawLineBetweenSymbols(0, 0, 2, 2); // Draw line for top-left to bottom-right diagonal
      
      // Increment Win Count
      winCount++;
      
      // Set flag to display winning lines
      displayWinningLines = true;
    }
    
    //If Statement checking for DIAGONAL WINS (Top right to bottom left)
    if (currentSymbols[0][2] == currentSymbols[1][1] && currentSymbols[1][1] == currentSymbols[2][0]) {
      drawLineBetweenSymbols(0, 2, 2, 0); // draw line for top-right to bottom-left diagonal
      
      // Increment Win Count
      winCount++;
      
      // Set flag to display winning lines
      displayWinningLines = true;
    }
  }

  
  // Method to calculate winnings based on winning lines
  void calculateWinnings() {
    
     // Calculate Winnins
    winnings = winCount * (numberOfSymbols-1) * slotUser.betAmount;
    
    // Update user balance
    slotUser.balance += winnings;
    
    // Save Balance Into Data
    changeBalance(slotUser.balance);
    
    
  }

  // Draw line between symbols
  void drawLineBetweenSymbols(int row1, int col1, int row2, int col2) {
    // startX position for the line
    int startX = (width - numCols * symbolSize) / 2 + col1 * symbolSize + symbolSize / 2;
    
    // startY position for the line
    int startY = y + row1 * symbolSize + symbolSize / 2;
    
    //End positions for the line
    int endX = (width - numCols * symbolSize) / 2 + col2 * symbolSize + symbolSize / 2;
    int endY = y + row2 * symbolSize + symbolSize / 2;
    
    // Draws the line that showcases which symbols connected
    stroke(0,155,0);
    strokeWeight(20);
    line(startX, startY, endX, endY);
  }

  // Method to show winning lines (called in displayReels when displayWinningLines is true)
  void showWinningLines() {
    checkForWin();  // Recheck for winning lines (if necessary)
  }
  
  // Method that draws the black background of the slot machine
  void drawSlotBlack(){
    fill(0);
    stroke(0);  // Set the outline color to white (or any other color you want)
    strokeWeight(11);  // Set the outline thickness
    rect((width - 370) / 2, (height - 410) / 2, 370, 370);

  }
}
