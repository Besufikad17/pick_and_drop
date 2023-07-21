import 'package:flutter/material.dart';
import 'package:pickanddrop/components/button.dart';
import 'package:pickanddrop/constants/colors.dart';
import 'package:pickanddrop/ecDart/calendar/GregorianCalendar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pickanddrop/utils/util.dart';

class GC extends HookConsumerWidget {
  final Function(String, String) onPressed;
  final String flag;

  GC({super.key, required this.onPressed, required this.flag});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = GregorianCalendar.now();
    final current = useState(GregorianCalendar.now());
    GregorianCalendar gc = current.value;
    var current_days = gc.getMonth();
    
    var month_start_index = GregorianCalendar.gc_days.indexOf(current_days[0].day_name!);
    var weeks = ((month_start_index + current_days.length) / 7).ceil();
    var date = "";

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 500),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: KPrimaryColor.shade100.withOpacity(0),
                        )
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: getColorFromHex("#165214"),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.chevron_left),
                              onPressed: () {
                                current.value = gc.previousMonth();
                              },
                              color: KPrimaryColor.shade100,
                              iconSize: 25,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                current.value = today;
                              },
                              child: Column(
                                children: [
                                  Text(
                                    gc.month_name ?? '',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: getColorFromHex("#165214"),
                                    ),
                                  ),
                                  Text(
                                    "${gc.year}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: getColorFromHex("#165214"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: getColorFromHex("#165214"),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.chevron_right),
                              onPressed: () {
                                current.value = gc.nextMonth();
                              },
                              color: KPrimaryColor.shade100,
                              iconSize: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 40,
                        child: GridView.count(
                          crossAxisCount: 7,
                          children: GregorianCalendar.gc_days
                              .map(
                                (e) => Center(
                                  child: Text(
                                    e.substring(0, 2),
                                    style:TextStyle(
                                      color: getColorFromHex("#165214"),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 40 * weeks + 10 * (weeks + 1),
                        child: AnimationLimiter(
                          child: GridView.count(
                            crossAxisCount: 7,
                            mainAxisSpacing: 10,
                            children: [
                              ...List.filled(month_start_index, 0)
                                  .map(
                                    (e) => const Center(
                                      child: Text(''),
                                    ),
                                  )
                                  .toList(),
                              ...current_days.asMap().entries.map((x) {
                                var e = x.value;
                                var i = x.key;
                                var isToday = (DateTime(
                                      e.year ?? 0,
                                      e.month ?? 0,
                                      e.day ?? 0,
                                    )
                                        .difference(
                                          DateTime(
                                            today.year!,
                                            today.month!,
                                            today.day!,
                                          ),
                                        )
                                        .inDays ==
                                    0);

                                 var isPassed = (DateTime(
                                      e.year ?? 0,
                                      e.month ?? 0,
                                      e.day ?? 0,
                                    )
                                        .difference(
                                          DateTime(
                                            today.year!,
                                            today.month!,
                                            today.day!,
                                          ),
                                        )
                                        .inDays <
                                    0);
                                var bg = "#ffffff";
                                var fg = "#165214";    
                                return AnimationConfiguration.staggeredGrid(
                                  position: i,
                                  columnCount: 7,
                                  duration: Duration(microseconds: 500),
                                  child: FadeInAnimation(
                                    child: ScaleAnimation(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: isToday
                                                ? getColorFromHex("#165214")
                                                : getColorFromHex(bg),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    bg = "#000000";
                                                    fg = "#ffffff";
                                                    if(!isPassed){
                                                      date = "${e.day}-${e.month}-${e.year}";
                                                    }
                                                  },
                                                  child: Text(
                                                    '${e.day}',
                                                    style: TextStyle(
                                                      color: isToday
                                                          ? getColorFromHex("#ffffff") 
                                                          : isPassed ? Colors.grey : getColorFromHex(fg),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child:  SizedBox(height: 10,)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: MyButton(
                  text: "Pick", 
                  width: 250, 
                  height: 50, 
                  bgcolor: "#165214", 
                  borderRadius: 5, 
                  fgcolor: "#ffffff", 
                  fontSize: 14, 
                  onPressed: (){
                    if(date != ""){
                      onPressed(date, flag);
                    }
                    // Navigator.pop(context);
                  }
                ),
              ),
            )
          ]
        )
      )
    );
  }
}