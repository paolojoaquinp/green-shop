import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:green_shop/locator.dart';
import 'package:green_shop/services/navigation_service.dart';
import 'package:green_shop/ui/constants/constants.dart';
import 'package:green_shop/ui/views/news/create/create_news_controller.dart';

  class PricePoint {
    final double x;
    final double y;
    PricePoint(this.x, this.y);
  }

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CreateNewsController _newsController = CreateNewsController();
  List<DocumentSnapshot> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
       final rta = await _newsController.fetchData();
       setState(() { data = rta; });
    });
  }

  int calcColumnCount(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) { // Cambia el número de columnas si el ancho de pantalla es menor que 600
      return 2;
    }
    if (MediaQuery.of(context).size.width < 1042) { // Cambia el número de columnas si el ancho de pantalla es menor que 600
      return 4;
    }
    return 6;
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryPurple,
          minimumSize: Size(88, 46),
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        );

    final user = FirebaseAuth.instance.currentUser;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: user != null ? EdgeInsets.all(20) : EdgeInsets.symmetric(horizontal: size.width * 0.25,vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Padding(
               padding: EdgeInsets.only(left: 15.0),
               child: SizedBox(
                 child: Text('Inicio',
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w900,
                     letterSpacing: -1.5,
                     fontSize: 36
                   )
                 ),
               ),
             ),
            const SizedBox(height: 30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: (user != null) ? 4 : 12,
                  child: _newsView()
                ),
                if(user != null)
                  const SizedBox(width: 30),
                if(user != null)
                  Expanded(
                    flex: 6,
                    child: _tableView()
                  ),
                if(user != null)
                  const SizedBox(width: 50),
                if(user != null)
                  Expanded(
                    flex:4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 50,),
                            ElevatedButton.icon(
                              icon: Icon(Icons.add),
                              label: Text('Crear Denuncia'),
                              style: raisedButtonStyle,
                              onPressed: () {
                                locator<NavigationService>().navigateTo('/complaint');
                              }
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Text('Indice de casos la ultima semana'),
                        SizedBox(height: 20,),
                        _chartLine()
                      ],
                    )
                  ),
              ]
            )
          ],
        )
      ),
    );
  }


  final List<PricePoint> points = [
    PricePoint(1, 3),
    PricePoint(3, 15),
    PricePoint(5, 2),
    PricePoint(7, 14),
    PricePoint(9, 1),
  ];

  Widget _chartLine() {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
                isCurved: false,
                dotData: FlDotData(
                  show: false,
                ),
                color: Colors.red
              ),
            ],
            borderData: FlBorderData(
                border: const Border(bottom: BorderSide(), left: BorderSide())),
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
          ),
      ),
    );
  }

    SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 1:
          text = 'Lun';
          break;
        case 3:
          text = 'Mar';
          break;
        case 5:
          text = 'Mie';
          break;
        case 7:
          text = 'Jue';
          break;
        case 9:
          text = 'Vie';
          break;
        case 11:
          text = 'Sab';
          break;
        case 13:
          text = 'Dom';
          break;
      }

      return Text(text);
    },
  );

  Widget _newsView() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: primaryPurpleOpacity,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    final user = FirebaseAuth.instance.currentUser;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Noticias',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700
                ),
              ),
              if(user != null)
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () => locator<NavigationService>().navigateTo('/create-news'),
                  child: const Text('Crear Noticia',style:TextStyle(color: primaryWhite)),
                ),
            ],
          ),
          const SizedBox(height: 25,),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context,index) {
              if(data.length < 1) return const Center(child: CircularProgressIndicator(),);
              DocumentSnapshot doc = data[index];
              Map<String, dynamic> elem = doc.data() as Map<String, dynamic>;
              String titulo = elem['title'];
              String description = elem['description'];
              Timestamp fecha = elem['createdAt'];
              DateTime conv = DateTime.parse(fecha.toDate().toString());
              return _newsCard(titulo,description,'${conv.day} - ${conv.month} - ${conv.year}');
            }
          )
/*           Column(
            children: List.buil(10, (index) => _newsCard(index.toString())),
          ) */
        ],
      )
    );
  }

  Widget _newsCard(String title,String description, String date) {
    final user = FirebaseAuth.instance.currentUser;
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Card(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset('assets/logos/flutterfire_300x.png',
                      fit: BoxFit.cover
                    ),
                  ),
                  if(user == null)
                    Text(date),
                  if(user != null)
                    IconButton(onPressed: (){
                      locator<NavigationService>().navigateTo('/edit-news');
                    }, icon: Icon(Icons.edit)),
                ],
              ),

              Text(title,
                style: const TextStyle(
                  fontSize: 24.0
                )
              ),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }

  Widget _tableView() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Panel de Denuncias',
            style: TextStyle(fontSize: 24.0)
          ),
          const SizedBox(height: 20,),
          Table(
            border: TableBorder.all(
              color: primaryPurple,
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[ 
              _headerTable(),
              _itemTable(),
              _itemTable(),
              _itemTable(),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _itemTable() {
    const textStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: primaryPurple.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    return TableRow(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            alignment: Alignment.center,
            height: 70,
            child: Text('1',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Juana Perez',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('02/02/2010',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('en revision',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.yellow
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: (){},
              child: Text('Ver Detalles'),
            ),
          )
        ),
      ],
    );
  }

  TableRow _headerTable() {
    const textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    return const TableRow(
      decoration: BoxDecoration(
        color: primaryPurple,
        borderRadius: BorderRadius.only(topLeft:  Radius.circular(12), topRight:  Radius.circular(12))
      ),
      children: [
        TableCell(
          child: Text('#',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
        TableCell(
          child: Text('autor',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
        TableCell(
          child: Text('fecha creacion',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
        TableCell(
          child: Text('estado',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
        TableCell(
          child: Text('acciones',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _CharacterItem extends StatelessWidget {
  const _CharacterItem({
    Key? key,
    required this.el,
  }) : super(key: key);

  final String el;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          locator<NavigationService>().navigateTo('/character/${(el).toString()}');
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: Column(
            children: [
              Expanded(
                child: Image(image: NetworkImage(el as String))
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  el as String,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}