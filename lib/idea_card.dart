import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IdeaCard extends StatefulWidget {
  const IdeaCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
  });

  final String title;
  final String? description;
  final String category;

  @override
  State<IdeaCard> createState() {
    return _IdeaCardState();
  }
}

class _IdeaCardState extends State<IdeaCard> {
  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.of(context).textScaler;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        color: const Color.fromARGB(255, 220, 232, 255),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  SizedBox(width: textScaler.scale(23.5)),
                  Expanded(
                    child: Text(
                      widget.title,
                      maxLines: 1,
                      style: GoogleFonts.googleSansFlex(
                        color: const HSLColor.fromAHSL(
                          1.0,
                          0,
                          0.18,
                          0.2,
                        ).toColor(),
                        fontSize: 35,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: textScaler.scale(3)),
                    child: Icon(Icons.notes, size: textScaler.scale(16)),
                  ),
                  const SizedBox(width: 7.5),
                  Expanded(
                    child: Text(
                      widget.description == null ? '' : widget.description!,
                      maxLines: 2,
                      style: GoogleFonts.googleSansFlex(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
