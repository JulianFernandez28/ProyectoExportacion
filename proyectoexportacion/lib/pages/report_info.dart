import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/providers/report_provider.dart';

class ReportInfo extends StatefulWidget {
  const ReportInfo({super.key});

  @override
  State<ReportInfo> createState() => _ReportInfoState();
}

class _ReportInfoState extends State<ReportInfo> {
    @override
  void initState() {
    Provider.of<ReportProvider>(context, listen: false).getEnvioId(30);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ReportProvider>(context, listen: false).getEnvioId(30);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes'),
        backgroundColor: const Color.fromRGBO(35, 46, 141, 25),
      ),
      body: Container(
        width: double.infinity,
        
        child: Column(
          children: [
            
            Consumer<ReportProvider>(
              builder: (context, reportProvider, child) => reportProvider
                      .isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: reportProvider.reports?.length,
                        itemBuilder: (context, index) {
                          final report = reportProvider.reports![index];
                          return Container(
                           
                           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Card(
                              
                              color: Colors.grey[200],
                              child: ListTile(
                                contentPadding: EdgeInsets.all(15),
                                title: Text("${report.status}", style: TextStyle(fontSize: 20, color: Color.fromRGBO(35, 46, 141, 25)),),
                                subtitle: Text(report.description),
                                

                              ),
                            ),
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
