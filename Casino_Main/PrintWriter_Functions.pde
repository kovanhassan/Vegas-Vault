// Function used to change balance in SavedData text file
void changeBalance( int balance){
  
  PrintWriter pw = createWriter("data/SavedData.txt");
  
  // Prints the user balance into the file and replaces the old balance
  pw.print(str(slotUser.balance));
  
  // Saves the balance
  pw.close();
}


// Function used to change name in SavedName text file
void changeName (String name){
  PrintWriter pw = createWriter("data/SavedName.txt");
  
  // Prints the user name into the file and replaces the old name
  pw.print(userName);
  
  // Saves the name
  pw.close();

}
