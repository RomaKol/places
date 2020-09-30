import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';
import '../providers/places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<Places>(
        child: Center(
          child: const Text('Got no places yet!'),
        ),
        builder: (BuildContext ctx, Places places, Widget ch) =>
            places.items.length <= 0
                ? ch
                : ListView.builder(
                    itemBuilder: (itemBuilderContext, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(places.items[index].image),
                      ),
                      title: Text(places.items[index].title),
                      onTap: () {
                        // TODO go to detail page
                      },
                    ),
                    itemCount: places.items.length,
                  ),
      ),
    );
  }
}
