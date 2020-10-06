class StringFormatter {

  static String capitalize(String text){
    return text[0].toUpperCase() + text.substring(1);
  }
  
  static String toTitle(String text){
    if(text == null || text =="")
     return "";
    List<String> parts = [];
    text.split(' ').forEach((String f) => {
        if(f != "")
          parts.add(capitalize(f))
      }  
    );

    return parts.join(' ');
  }


}