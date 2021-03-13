
class Suggestions
{
  Map<String, List<String>> data;
  Suggestions()
  {
    data = {};
  }

  void addSuggestion(String category, String item)
  {
    data[category].add(item);
  }
}

class Listings
{
  Listings()
  {
    this.data = {};
  }

  Map<String,Map> data;
  
  void addListing(String photo, String description, String origin, bool completed)
  {
    //print(stuff);
    //data.add(stuff);
    //print(data);
    data[data.length.toString()] = {};
    data[(data.length - 1).toString()]["photo"] = photo;
    data[(data.length - 1).toString()]["description"] = description;
    data[(data.length - 1).toString()]["origin"] = origin;
    data[(data.length - 1).toString()]["completed"] = completed;
    //print(data);
  }

  void addListing1(String origin)
  {
    //print(stuff);
    //data.add(stuff);
    //print(data.length);
    //print(data);
    data[data.length.toString()] = {};
    data[(data.length - 1).toString()]["photo"] = "${data.length - 1}";
    data[(data.length - 1).toString()]["description"] = "Test ${data.length - 1}";
    data[(data.length - 1).toString()]["origin"] = origin;
    data[(data.length - 1).toString()]["completed"] = true;
    //print(data);
  }
}

