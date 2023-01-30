import 'package:flutter/material.dart';

Card cempasuchil() {
  return Card(
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(10),
    elevation: 50,
    child: Column(
      children: <Widget>[
        //Contenido de la card
        const ListTile(
          leading: Image(
            image: NetworkImage(
                'https://www.gastrolabweb.com/u/fotografias/m/2022/9/27/f1280x720-35392_167067_4938.jpg'),
          ),
          title: Text(
            'Cempasúchil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Montserrat',
            ),
          ),
          subtitle: Text(
            'Servicio: Exportación.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: Text('01 nov 2022'),
        ),
        const ListTile(
            title: (Text(
          'Cantidad: 2 TL',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),
        const ListTile(
            title: (Text(
          'Entrega: 2 días',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),

        //boton

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 180, 84, 132)),
              ),
              onPressed: () {},
              child: const Text('Ver'),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        const SizedBox(
          width: 20,
        )
      ],
    ),
  );
}

Card nocheBuena() {
  return Card(
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(10),
    elevation: 50,
    child: Column(
      children: <Widget>[
        //Contenido de la card
        const ListTile(
          leading: Image(
            image: NetworkImage(
                'https://imagenescityexpress.scdn6.secure.raxcdn.com/sites/default/files/2017-12/historia-nochebuena.jpg'),
          ),
          title: Text(
            'Noche Buena',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Montserrat',
            ),
          ),
          subtitle: Text(
            'Servicio: Exportación.',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          trailing: Text('01 nov 2022'),
        ),
        const ListTile(
            title: (Text(
          'Cantidad: 2 TL',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),
        const ListTile(
            title: (Text(
          'Entrega: 2 días',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),

        //boton

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 180, 84, 132)),
              ),
              onPressed: () {},
              child: const Text('Ver'),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        const SizedBox(
          width: 20,
        )
      ],
    ),
  );
}
//'https://www.floresyplantas.net/wp-content/uploads/flores-de-lilium.jpg'

Card lilium() {
  return Card(
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(10),
    elevation: 50,
    child: Column(
      children: <Widget>[
        //Contenido de la card
        const ListTile(
          leading: Image(
            image: NetworkImage(
                'https://www.floresyplantas.net/wp-content/uploads/flores-de-lilium.jpg'),
          ),
          title: Text(
            'Lilium',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Montserrat',
            ),
          ),
          subtitle: Text(
            'Servicio: Exportación.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: Text('01 nov 2022'),
        ),
        const ListTile(
            title: (Text(
          'Cantidad: 2 TL',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),
        const ListTile(
            title: (Text(
          'Entrega: 2 días',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),

        //boton

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 180, 84, 132)),
              ),
              onPressed: () {},
              child: const Text('Ver'),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        const SizedBox(
          width: 20,
        )
      ],
    ),
  );
}

Card clavel() {
  return Card(
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(10), //modifica el tamaño de la card
    elevation: 50,
    child: Column(
      children: <Widget>[
        //Contenido de la card
        const ListTile(
          leading: SizedBox(
              height: 200,
              width: 100,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.redagricola.com/co/assets/uploads/2022/08/claveles-760x423-c-default.jpg'),
              )),
          title: Text(
            'Clavel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Montserrat',
            ),
          ),
          subtitle: Text(
            'Servicio: Exportación.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: Text('01 nov 2022'),
        ),
        const ListTile(
            title: (Text(
          'Cantidad: 2 TL',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),
        const ListTile(
            title: (Text(
          'Entrega: 2 días',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),

        //boton

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 180, 84, 132)),
              ),
              onPressed: () {},
              child: const Text('Ver'),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        const SizedBox(
          width: 20,
        )
      ],
    ),
  );
}

Card boganvilia() {
  return Card(
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(10),
    elevation: 50,
    child: Column(
      children: <Widget>[
        //Contenido de la card
        const ListTile(
          leading: Image(
            image: NetworkImage(
                'https://plantify.mx/wp-content/uploads/2022/02/bugambilia-cuidados.jpg'),
          ),
          title: Text(
            'Bugambilia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Montserrat',
            ),
          ),
          subtitle: Text(
            'Servicio: Exportación.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: Text('01 nov 2022'),
        ),
        const ListTile(
            title: (Text(
          'Cantidad: 2 TL',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),
        const ListTile(
            title: (Text(
          'Entrega: 2 días',
          style: TextStyle(
            fontSize: 18,
          ),
        ))),

        //boton

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 180, 84, 132)),
              ),
              onPressed: () {},
              child: const Text('Ver'),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        const SizedBox(
          width: 20,
        )
      ],
    ),
  );
}
