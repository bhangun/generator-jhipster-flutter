import 'package:flutter/material.dart';

class KutAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onLogout;
  const KutAppBar({this.title, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              title: Text(title!),
              actions: <Widget>[
                IconButton(
                  splashRadius: 15,
                  onPressed: () => onLogout,//context.read<AuthBloc>().logout(),
                  icon: Icon(
                    Icons.power_settings_new,
                  ),
                )
              ],
            )
            );
  }

  logout(BuildContext context){
    print('<><>logout<><>');
    //context.read<AuthBloc>().add(LoggedOut());
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
