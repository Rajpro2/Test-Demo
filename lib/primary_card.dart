import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsondemotst/model_class.dart';
import 'package:intl/intl.dart';
class CardView extends StatelessWidget {
  final Records views;
  CardView({this.views});
  @override
  Widget build(BuildContext context) {

    DateTime start = new DateFormat("dd/MM/yy").parse('${views.startDate}');
    DateTime ends = new DateFormat("dd/MM/yy").parse('${views.endDate}');
    final difference2 = ends.difference(start).inDays;
    return Stack(
      children: [
       Flex(
         direction: Axis.vertical,
         children: <Widget>[
           Expanded(
             flex:2,
             child: Container(
               width: double.infinity,
               height: 200.0,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(0.0),
                 image: DecorationImage(
                   image: CachedNetworkImageProvider(views.mainImageUrl),
                   fit: BoxFit.fill,
                 ),
               ),
             ),
           ),
           Expanded(
             flex:1,
             child: Container( width: double.infinity, color: Colors.lightBlue, height: 200.0,child: Row(
               children: <Widget>[
                 SizedBox(width: 15.0),
                 Padding(
                   padding: const EdgeInsets.only(top:40.0),
                   child: Container(
                     height: 62,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         RichText(
                           text: TextSpan(
                             text: '\₹',
                             style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 0.8,color:Colors.white),
                             children: <TextSpan>[
                               TextSpan(text: views.collectedValue.toString(),style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 0.2,color:Colors.white)),
                             ],
                           ),
                         ),
                         Container(
                           height: 30,
                           width: 70,
                           child: Center(child: Text('FUNDED',style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14,letterSpacing: 0.2,color:Colors.white))),
                         )
                       ],
                     ),
                   ),
                 ),
                 SizedBox(width: 10.0),
                 Padding(
                   padding: const EdgeInsets.only(top:40.0),
                   child: Container(
                     height: 62,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         RichText(
                           text: TextSpan(
                             text: '\₹',
                             style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 0.2,color:Colors.white),
                             children: <TextSpan>[
                               TextSpan(text: views.totalValue.toString(),style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 0.2,color:Colors.white)),
                             ],
                           ),
                         ),
                         Container(
                           height: 30,
                           width: 70,
                           child: Center(child: Text('GOALS',style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14,letterSpacing: 0.2,color:Colors.white))),
                         )
                       ],
                     ),
                   ),
                 ),
                 SizedBox(width: 10.0),
                 Padding(
                   padding: const EdgeInsets.only(top:35.0),
                   child: Container(
                     height: 62,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Text(difference2.toString(),style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 0.2,color:Colors.white)),
                         SizedBox(height: 8,),
                         Text('ENDS IN',style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14,letterSpacing: 0.2,color:Colors.white)),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(width: 25.0),
                 Padding(
                   padding: const EdgeInsets.only(top:30.0),
                   child: FlatButton(
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(5.0),
                         side: BorderSide(color: Colors.white)),
                     onPressed: () {},
                     color: Colors.white,
                     textColor: Colors.lightBlue,
                     child: Text("Pledge".toUpperCase(), style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14,letterSpacing: 0.2)),
                   ),
                 ),
               ],
             )),
           )
         ],
       ),
       Align(
         alignment: Alignment.centerLeft,
         child: Padding(
           padding: const EdgeInsets.only(top:100.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left:5.0),
                 child: Container(
                   width: 270,
                   height: 90,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),
                     color: Colors.white,
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(left:8.0,right:8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Text(views.title, overflow: TextOverflow.ellipsis,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,letterSpacing: 0.8)),
                             new Icon(Icons.favorite , color:  Colors.red, size: 22.0,),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left:8.0,right:8.0),
                         child: Text(views.shortDescription),
                       ),
                     ],
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(right:8.0),
                 child: Container(
                     width: 70,
                     height: 100,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color:Color(0xff055e98),
                     ),
                     child: Center(
                       child: Text('100%', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                     )
                 ),
               ),

             ],
           ),
         ),
       )

      ],
    );
  }
}
