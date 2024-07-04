import 'dart:convert';

import 'package:app/src/component/card/hz_card_A.dart';
import 'package:app/src/component/reusable/class.dart';
import 'package:app/src/models/step_passport.dart';
import 'package:app/src/tools/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SliderPaperHome extends StatefulWidget {
  const SliderPaperHome({super.key});

  @override
  _SliderPaperHome createState() => _SliderPaperHome();
}

class _SliderPaperHome extends State<SliderPaperHome> {
  late Future<List<ProcedureInfo>> futureProcedureInfo;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    futureProcedureInfo = fetchProcedureInfo();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _reloadData() {
    setState(() {
      futureProcedureInfo = fetchProcedureInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    String sliderTitle = 'Trouve ta démarche';

    const double compoWidth = 170.0;
    const double compoHeight = 350.0;
    const double compoMediaHeight = 120.0;
    const double compoInfoHeight = 220.0;

    double wh = MediaQuery.of(context).size.width;
    double hg = compoHeight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: fixPadding * 1.0, left: fixPadding * 1.0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sliderTitle, style: greyHeadingTextStyle),
              IconButton(
                icon: const Icon(Icons.refresh,
                    color: Color(0xff000000), size: 20.0),
                onPressed: _reloadData,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: fixPadding * 1.0, left: fixPadding * 1.0, bottom: 10),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.arrow_circle_right,
                    color: Color(0xff000000), size: 20.0),
                const SizedBox(width: 10.0),
                Text('Voir plus', style: smallBoldGreyTextStyle),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: fixPadding * 1.0, left: fixPadding * 1.0),
          child: SizedBox(
            width: wh,
            height: hg,
            child: FutureBuilder<List<ProcedureInfo>>(
              future: futureProcedureInfo,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  var lstItems = snapshot.data!;
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: lstItems.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var procedure = lstItems[index];
                      return InkWell(
                        child: CardHzA(
                          item: Paper(
                            title: procedure.title,
                            description: procedure.description,
                          ),
                          index: index,
                          mediaHeightVal: compoMediaHeight,
                          infoHeightVal: compoInfoHeight,
                          widthVal: compoWidth,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

Future<List<ProcedureInfo>> fetchProcedureInfo() async {
  var url = 'http://localhost:3000/procedure/all';

  final uri = Uri.parse(url);
  final response = await http.get(
    uri,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json;charset=UTF-8"
    },
  );

  if (response.statusCode == 200) {
    try {
      final body = response.body;
      final List<dynamic> json = jsonDecode(body);

      final List<ProcedureInfo> result = json.map((item) {
        return ProcedureInfo.fromJson(item);
      }).toList();

      return result;
    } catch (e) {
      print('Error parsing JSON: $e');
      throw Exception('Failed to parse procedures');
    }
  } else {
    throw Exception('Failed to load procedures');
  }
}
