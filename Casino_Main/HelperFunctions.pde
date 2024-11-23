//This tab just replaces the information in a text file for the balance of the user
void change( int balance){
  
  PrintWriter pw = createWriter("data/SavedData.txt");
  pw.print(str(slotUser.balance));
  
  pw.close();
}

//This tab just replaces the information in a text file for the name of the user
void changeName (String name){
  PrintWriter pw = createWriter("data/SavedName.txt");
  pw.print(userName);
  
  pw.close();

}
