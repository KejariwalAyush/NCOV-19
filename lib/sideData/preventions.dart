import 'package:flutter/material.dart';

class Preventions extends StatelessWidget {
  static const String fontName = 'Comfortaa';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NCOV - 19",
              style: TextStyle(
                fontFamily: fontName,
                color: Colors.white,
                fontSize: 20.0,
              )),
          centerTitle: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          elevation: 20,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.redAccent,
        ),
        body:SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
        //            height: ,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[100]),
            child: Column(
              children: <Widget>[
              RichText(
                text: TextSpan(
                text: 'Precautions',
                style: TextStyle(fontFamily: fontName,
                color: Colors.blue, fontSize: 28),
                ),
              ),
              Divider(height: 10,),
              Card(child:Padding(padding: EdgeInsets.all(15),
                  child:Text('Preventions you should take',softWrap: true,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))),
              Card(
                child: Padding(padding: EdgeInsets.all(15),
                  child: Text("Strategies for preventing transmission of the disease include overall good personal hygiene, hand washing, avoiding touching the eyes, nose or mouth with unwashed hands, coughing/sneezing into a tissue and putting the tissue directly into a dustbin. Those who may already have the infection have been advised to wear a surgical mask in public. Social distancing measures are also recommended to prevent transmission.\nMany governments have restricted or advised against all non-essential travel to and from countries and areas affected by the outbreak. However, the virus has reached the stage of community spread in large parts of the world. This means that the virus is spreading within communities whose members have not travelled to areas with widespread transmission.\nHealth care providers taking care of someone who may be infected are recommended to use standard precautions, contact precautions and airborne precautions with eye protection. \n Contact tracing is an important method for health authorities to determine the source of an infection and to prevent further transmission. Misconceptions are circulating about how to prevent infection, for example: rinsing the nose and gargling with mouthwash are not effective. \n As of 13 March 2020, there is no COVID-19 vaccine though a number of organizations are working to develop one. China has banned the trading and consumption of wild animals. \n \n Hand washing\nHand washing is recommended to prevent the spread of the disease. The US Centers for Disease Control and Prevention (CDC) recommends that people wash hands often with soap and water for at least 20 seconds, especially after going to the toilet or when hands are visibly dirty; before eating; and after blowing one's nose, coughing, or sneezing. It further recommended using an alcohol-based hand sanitizer with at least 60% alcohol by volume when soap and water are not readily available. The WHO also advises people to avoid touching the eyes, nose, or mouth with unwashed hands. \n \n Respiratory hygiene\n Health organizations recommended that people cover their mouth and nose with a bent elbow or a tissue when coughing or sneezing (the tissue should then be disposed of immediately). The use of surgical masks by those who may be infected has been recommended, as they can limit the volume and travel distance of expiratory droplets dispersed when talking, sneezing and coughing. The WHO has issued instructions on when and how to use masks. \n Masks have also been recommended for use by those taking care of someone who may have the disease. Masks are not recommended for most people. WHO has recommended the wearing of masks by healthy people only if they are at high risk, such as those who are caring for a person with COVID-19, although masks may help people avoid touching their faces.\n Surgical masks are the lowest grade of protection, and are designed mainly to protect others from the wearer. Masks designed to protect the wearer are technically respirators, though calling them masks is common. Only China has specifically recommended the use of masks by healthy members of the public. Nevertheless, face masks have been widely used by healthy people in Hong Kong, Japan, Malaysia, and Singapore. \n \n Social distancing\n Main article: Social distancing\n Social distancing includes infection control actions intended to slow the spread of disease by minimizing close contact between individuals. Methods include quarantines; travel restrictions; and the closing of schools, workplaces, stadiums, theatres, or shopping centres. Individuals may also apply social distancing methods by staying at home, limiting travel, avoiding crowded areas, not shaking hands, and physically distancing themselves from others. Many governments are now mandating or recommending social distancing in regions affected by the outbreak. \n Older adults and those with serious chronic conditions face increased risk of serious illness and complications and have been advised by the US CDC to avoid crowds and stay home as much as possible in areas of community outbreak. \n \n Self-isolation\nSelf-isolation at home has been recommended for those diagnosed with COVID-19 and those who suspect they have been infected. Additionally, individuals who have recently travelled to a country with widespread transmission or who have been in direct contact with someone diagnosed with COVID-19 have also been asked by some government health agencies to self-quarantine or practise social distancing for 14 days from the time of last possible exposure. \n The National Health Service in the UK has recommended that those with symptoms of COVID-19 should stay at home for 14 days, taking precautions to avoid infecting others within the household. As long as symptoms dont significantly worsen health services should not be contacted. \n\n" ,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),softWrap: true,),)
              ),
            // Text('% wise Symptoms',textAlign: TextAlign.end,style: TextStyle(fontSize: 25,color: Colors.blue),),
            // Card(child: 
            //     Text('Symptoms\t\t\t\t\t\t\t\t\t\t\t\t\t	%\nFever\t\t\t\t\t\t\t\t\t\t\t\t\t	87.9%\nDry cough\t\t\t\t\t\t\t\t\t\t\t\t\t	67.7%\nFatigue\t\t\t\t\t\t\t\t\t\t\t\t\t	38.1%\nSputum production\t\t\t\t\t\t\t\t\t\t\t\t\t	33.4%\nShortness of breath\t\t\t\t\t\t\t\t\t\t\t\t\t	18.6%\nMuscle pain or joint pain	\t\t\t\t\t\t\t\t\t\t\t\t\t14.8%\nSore throat\t\t\t\t\t\t\t\t\t\t\t\t\t	13.9%\nHeadache\t\t\t\t\t\t\t\t\t\t\t\t\t	13.6%\nChills\t\t\t\t\t\t\t\t\t\t\t\t\t	11.4%\nNausea or vomiting\t\t\t\t\t\t\t\t\t\t\t\t\t	5.0%\nNasal congestion\t\t\t\t\t\t\t\t\t\t\t\t\t	4.8%\nDiarrhoea\t\t\t\t\t\t\t\t\t\t\t\t\t	3.7%\nHaemoptysis\t\t\t\t\t\t\t\t\t\t\t\t\t	0.9%\nConjunctival congestion\t\t\t\t\t\t\t\t\t\t\t\t\t	0.8%',
            //     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            //     textAlign: TextAlign.end,textWidthBasis: TextWidthBasis.parent,),
            // ),
          ]
      )
    )
        )
    );
  }
}