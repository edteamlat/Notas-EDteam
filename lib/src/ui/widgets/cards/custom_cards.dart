import 'package:aplicacion_notas_edteam/src/core/controllers/theme_controller.dart';
import 'package:aplicacion_notas_edteam/src/core/models/note.dart';
import 'package:aplicacion_notas_edteam/src/ui/configure.dart';
import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  final Note note;
  final Function()? onTap;
  SimpleCard(this.note, {Key? key, this.onTap}) : super(key: key);

  Color background() => ThemeController.instance.brightnessValue
      ? Configure.BACKGROUND_DARK
      : Configure.BACKGROUND_LIGHT;

  Color fontColor() =>
      ThemeController.instance.brightnessValue ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(
            note.description ?? "Sin contenido",
            textAlign: TextAlign.center,
            style: TextStyle(color: fontColor()),
          ),
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: background()),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final Note note;
  final Function()? onTap;
  ImageCard(this.note, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                note.description ?? "Sin contenido",
                style: TextStyle(color: Colors.transparent),
              ),
            ),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(note.image ??
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1200px-No-Image-Placeholder.svg.png")),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                note.description ?? "Sin contenido",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black38),
          ),
        ],
      ),
    );
  }
}

class TextImageCard extends StatelessWidget {
  final Note note;
  final Function()? onTap;
  TextImageCard(this.note, {Key? key, this.onTap}) : super(key: key);

  Color background() =>
      !ThemeController.instance.brightnessValue ? Colors.black : Colors.white;

  Color fontColor() =>
      !ThemeController.instance.brightnessValue ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          children: [
            Container(
              height: 75,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(note.image ??
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1200px-No-Image-Placeholder.svg.png")),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: background(),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title ?? "Sin titulo",
                    style: TextStyle(color: fontColor()),
                  ),
                  SizedBox(height: 4),
                  Text(
                    note.title ?? "Sin titulo",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
