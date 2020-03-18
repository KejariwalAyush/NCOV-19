
class Details{
  List<dynamic> data;

  Details(this.data){
    int totalCase=0,recovered=0,death=0,activeCase=0;
    totalCase = data.length;
    for (var cases in data) {
      if(cases["status"] == "RECOVERED")
        recovered++;
      else if(cases["status"] == "HOSPITALIZED")
        activeCase++;
      else
        death++;
      
    }
    List<int> ret = [totalCase,death,activeCase,recovered];
    print("Total cases: $totalCase\nrecovered: $recovered\nactive cases: $activeCase\nDeath: $death");
    // return ret;
  }
}