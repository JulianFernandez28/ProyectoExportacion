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
    Provider.of<ReportProvider>(context, listen: false).getEnvioId(25);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ReportProvider>(context, listen: false).getEnvioId(25);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes'),
      ),
      body: Center(
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
                            child: Card(
                              color: Colors.blue[100],
                              child: ListTile(
                                splashColor: Colors.red,
                                title: Text("${report.id} ${report.status}"),
                                subtitle: Text(report.description),
                                leading: const Icon(Icons.add_home_rounded),
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
