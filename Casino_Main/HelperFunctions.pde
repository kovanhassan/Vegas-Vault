void change( int balance){
  
  PrintWriter pw = createWriter("data/SavedData.txt");
  pw.print(str(slotUser.balance));
  
  
  pw.close();
}

void changeName (String name){
  PrintWriter pw = createWriter("data/SavedName.txt");
  pw.print(userName);
  
  pw.close();

}
