
class Slots {
  int y;
  int numRows;
  int numCols = 3;
  int symbolSize;
  PImage[] symbols;
  int[][] currentSymbols;
  float spinSpeed;
  int spinCounter;
  boolean isSpinning;
  boolean displayWinningLines;  // Variable to track if winning lines should be displayed

  int winCount = 0;  // Variable to count the number of winning lines

  // Constructor
  Slots(int y, int numRows, int symbolSize, PImage[] symbols) {
    this.y = y;
    this.numRows = numRows;
    this.symbolSize = symbolSize;
    this.symbols = symbols;
    this.currentSymbols = new int[numRows][numCols];
    this.spinSpeed = 0.1;
    this.spinCounter = 0;
    this.isSpinning = false;
    this.displayWinningLines = false;  // Initialize to false
  }

  // Method to start the spin
  void startSpin() {
    min_betWarning = false;
    isSpinning = true;
    spinCounter = 0;
    winCount = 0;  // Reset win count each time the spin starts
    displayWinningLines = false;  // Reset winning lines display when spin starts
    numSymbols.setEnabled(false);
    
  }

  // Method to spin the slot machine
  void spin() {
    if (isSpinning) {
      spinCounter++;

      for (int row = 0; row < numRows; row++) {
        for (int col = 0; col < numCols; col++) {
          if (spinCounter % int(random(5, 10)) == 0) {
            
             currentSymbols[row][col] = int(random(numberOfSymbols));
            
          }
        }
      }

      if (spinCounter > 100) {
        isSpinning = false;
        checkForWin();  
        calculateWinnings();  
        numSymbols.setEnabled(true);
      }
    }
  }

  // Method to display reels
  void displayReels() {
    int totalWidth = numCols * symbolSize;
    int startX = (width - totalWidth) / 2;

    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        int symbolX = startX + col * symbolSize;
        int symbolY = y + row * symbolSize;
        PImage symbol = symbols[currentSymbols[row][col]];
        image(symbol, symbolX, symbolY, symbolSize, symbolSize);
      }
    }

    // If there is a win, showWinningLines will be called which will just display the WINNING LINE(S) after the SPIN TO see where the slot hit
    if (displayWinningLines) {
      image(jackpot,400,80);
      showWinningLines();
     
    }
   
  }

  // Check for winning combinations
  void checkForWin() {
    for (int row = 0; row < numRows; row++) {
      if (currentSymbols[row][0] == currentSymbols[row][1] && currentSymbols[row][1] == currentSymbols[row][2]) {
        drawLineBetweenSymbols(row, 0, row, 2);
        winCount++;
        displayWinningLines = true;  // Set to true if there's a winning line
      }
    }

    for (int col = 0; col < numCols; col++) {
      if (currentSymbols[0][col] == currentSymbols[1][col] && currentSymbols[1][col] == currentSymbols[2][col]) {
        drawLineBetweenSymbols(0, col, 2, col);
        winCount++;
        displayWinningLines = true;
      }
    }

    if (currentSymbols[0][0] == currentSymbols[1][1] && currentSymbols[1][1] == currentSymbols[2][2]) {
      drawLineBetweenSymbols(0, 0, 2, 2);
      winCount++;
      displayWinningLines = true;
    }

    if (currentSymbols[0][2] == currentSymbols[1][1] && currentSymbols[1][1] == currentSymbols[2][0]) {
      drawLineBetweenSymbols(0, 2, 2, 0);
      winCount++;
      displayWinningLines = true;
    }
  }

  // Method to calculate winnings based on winning lines
  void calculateWinnings() {
    int winnings = winCount * numberOfSymbols *slotUser.betAmount;
    slotUser.balance += winnings;
    
  }

  // Draw line between symbols
  void drawLineBetweenSymbols(int row1, int col1, int row2, int col2) {
    int startX = (width - numCols * symbolSize) / 2 + col1 * symbolSize + symbolSize / 2;
    int startY = y + row1 * symbolSize + symbolSize / 2;
    int endX = (width - numCols * symbolSize) / 2 + col2 * symbolSize + symbolSize / 2;
    int endY = y + row2 * symbolSize + symbolSize / 2;

    stroke(255);
    strokeWeight(20);
    line(startX, startY, endX, endY);
  }

  // Method to show winning lines (called in displayReels when displayWinningLines is true)
  void showWinningLines() {
    checkForWin();  // Display winning lines for the current winning rows/columns
  }
}
