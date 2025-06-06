import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/models/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Bem vindo Usuário!"),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Página Inicial"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(AppRoutes.authOrHomePage),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Pedidos"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.order),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Gerenciar Produtos"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.products),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.authOrHomePage);
            },
          )
        ],
      ),
    );
  }
}
