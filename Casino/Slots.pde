class Slots {
  int y;               // y position of the slot machine, x will be calculated dynamically for centering
  int numRows;            // Number of rows (symbols per column)
  int numCols = 3;        // Fixed number of columns (3 columns)
  int symbolSize;         // Size of each symbol
  PImage[] symbols;       // Array holding the images for symbols
  int[][] currentSymbols; // 2D array to store the indices of the currently displayed symbols
  float spinSpeed;        // Speed of the spin (higher is faster)
  int spinCounter;        // Counter to track how many frames have passed
  boolean isSpinning;   // Flag to check if the slot machine is currently spinning
  
  int wins;

  // Constructor
  Slots(int y, int numRows, int symbolSize, PImage[] symbols) {
    this.y = y;                       // y position for the slot machine
    this.numRows = numRows;           // Number of rows for symbols
    this.symbolSize = symbolSize;     // Size of each symbol
    this.symbols = symbols;           // Array of images for symbols
    this.currentSymbols = new int[numRows][numCols]; // 2D array for current symbols
    this.spinSpeed = 0.1;              // Set spin speed (slow speed for demo)
    this.spinCounter = 0;              // Initialize counter
    this.isSpinning = false;          // Slot machine is not spinning initially
  }

  // Method to start the spin
  void startSpin() {
    isSpinning = true; // Begin spinning
    spinCounter = 0;   // Reset the counter
  }

  // Method to "spin" the slot machine
  void spin() {
    if (isSpinning) {
      spinCounter++; // Increment the counter every frame

      // Update the symbols for each position (rows x columns)
      for (int row = 0; row < numRows; row++) {
        for (int col = 0; col < numCols; col++) {
          // Each symbol changes at a random interval
          if (spinCounter % int(random(5, 10)) == 0) {
            currentSymbols[row][col] = int(random(symbols.length));
          }
        }
      }

      // If the counter reaches a certain point, stop the spin (after spinning a while)
      if (spinCounter > 100) {  // Stop after 100 frames (adjust as needed)
        isSpinning = false;
      }
    }
  }

  // Method to display the symbols in a grid (3 columns and numRows rows)
  void displayReels() {
    // Calculate the total width for centering
    int totalWidth = numCols * symbolSize;

    // Set the starting x to center the symbols
    int startX = (width - totalWidth) / 2;

    // Draw each symbol in the grid (3 columns and numRows rows)
    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        // Set a fixed vertical position for each row
        int symbolX = startX + col * symbolSize;
        int symbolY = y + row * symbolSize;

        // Draw the symbol
        PImage symbol = symbols[currentSymbols[row][col]];
        image(symbol, symbolX, symbolY, symbolSize, symbolSize);
      }
    }
    
    // Check for a win after displaying the symbols
    checkForWin();
    
  }

  void payout(){
    println(wins);
    
  }


  // Method to check for winning combinations (3 in a row, column, or diagonal)
  void checkForWin() {
    // Check rows for wins
    for (int row = 0; row < numRows; row++) {
      if (currentSymbols[row][0] == currentSymbols[row][1] && currentSymbols[row][1] == currentSymbols[row][2]) {
        // Draw a line for the row win
        if (spinCounter > 100){
        drawLineBetweenSymbols(row, 0, row, 2);
        wins = wins + 1;
        
        }
      }
    }

    // Check columns for wins
    for (int col = 0; col < numCols; col++) {
      if (currentSymbols[0][col] == currentSymbols[1][col] && currentSymbols[1][col] == currentSymbols[2][col]) {
        // Draw a line for the column win
        if (spinCounter > 100){
        drawLineBetweenSymbols(0, col, 2, col);
        wins = wins + 1;
        }
      }
    }

    // Check diagonal (top-left to bottom-right) for wins
    if (currentSymbols[0][0] == currentSymbols[1][1] && currentSymbols[1][1] == currentSymbols[2][2]) {
      // Draw a diagonal line for the win
      if (spinCounter > 100){
      drawLineBetweenSymbols(0, 0, 2, 2);
      wins = wins + 1;
      }
    }

    // Check diagonal (top-right to bottom-left) for wins
    if (currentSymbols[0][2] == currentSymbols[1][1] && currentSymbols[1][1] == currentSymbols[2][0]) {
      // Draw a diagonal line for the win
      if (spinCounter > 100){
      drawLineBetweenSymbols(0, 2, 2, 0);
      wins = wins + 1;
      
      }
    }
  }

  // Method to draw a line between two symbols
  void drawLineBetweenSymbols(int row1, int col1, int row2, int col2) {
    // Calculate the positions of the two symbols
    int startX = (width - numCols * symbolSize) / 2 + col1 * symbolSize + symbolSize / 2;
    int startY = y + row1 * symbolSize + symbolSize / 2;
    int endX = (width - numCols * symbolSize) / 2 + col2 * symbolSize + symbolSize / 2;
    int endY = y + row2 * symbolSize + symbolSize / 2;

    // Draw a line between the symbols
    stroke(130,0,130);  // Red color for the winning line
    strokeWeight(20);
    line(startX, startY, endX, endY);
  }
}
