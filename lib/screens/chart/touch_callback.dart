// ЭТА ШТУКА ЗА АНИМАЦИЮ ПРИ НАЖАТИИ ОТВЕЧАЕТ, ЕСЛИ ЧТО ВСТАВИШЬ ОБРАТНО ЕЕ ПОТОМ, В BARTOUCHDATA

// touchCallback: (FlTouchEvent event, response) {
// if (response == null || response.spot == null) {
// setState(() {
// touchedGroupIndex = -1;
// showingBarGroups = List.of(rawBarGroups);
// });
// return;
// }
//
// touchedGroupIndex =
// response.spot!.touchedBarGroupIndex;
//
// setState(() {
// if (!event.isInterestedForInteractions) {
// touchedGroupIndex = -1;
// showingBarGroups = List.of(rawBarGroups);
// return;
// }
//
// showingBarGroups = List.of(rawBarGroups);
//
// if (touchedGroupIndex != -1) {
// var sum = 0.0;
// for (var rod in showingBarGroups[touchedGroupIndex].barRods) {
// sum += rod.toY;
// }
// final avg = sum / showingBarGroups[touchedGroupIndex].barRods.length;
//
// showingBarGroups[touchedGroupIndex] = showingBarGroups[touchedGroupIndex].copyWith(
// barRods: showingBarGroups[touchedGroupIndex]
//     .barRods
//     .map((rod) {
// return rod.copyWith(toY: avg);
// }).toList(),
// );
// }
// });
// },