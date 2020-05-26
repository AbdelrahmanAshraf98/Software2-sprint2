import 'package:flutter/material.dart';
import 'addDrugs.dart';
import 'drugClass.dart';
class DrugsList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrugsState();
  }
}

class DrugsState extends State<DrugsList>{

  List<Drugs> drugsList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (drugsList == null) {
      drugsList = new List<Drugs>();

    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Drugs"),
        ),
        body: getDrugsList(),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddDrugsForm();
            }));
          },
          tooltip: 'Add Drug',
          child: Icon(Icons.add),
        )
    );
  }

  ListView getDrugsList(){

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position){
          return Card (
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.check),
                ),
                title: Text(this.drugsList[position].drugName),
                subtitle: Text("Code "+this.drugsList[position].drugCode + " | " +
                    " price "+ this.drugsList[position].drugPrice.toString()
                    +"/n"+"Quantity "+ this.drugsList[position].drugQuantity.toString()
                    +" Date "+ this.drugsList[position].date_added),
                trailing:
                GestureDetector( child: Icon(Icons.delete, color: Colors.grey,),
                  onTap: (){
                    /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return class_delete ("delete Drug");
                }));*/
                  },
                ),

              ));
        });
  }

}