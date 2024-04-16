// itemBuilder: (context, index) {
//   // Calculate the index for the image in the list
//   int imageIndex = index ~/ 2;
//   // Determine if it's in the left column or the right column
//   bool isLeftColumn = index.isEven;
//   // Calculate the offset and alignment based on the column
//   double offset = isLeftColumn ? 0.0 : 20.0;
//   Alignment alignment = isLeftColumn ? Alignment.centerLeft : Alignment.centerRight;
//   return Align(
//     alignment: alignment,
//     child: Transform.translate(
//       offset: Offset(0.0, isLeftColumn ? 0.0 : 30.0),
//       child: Opacity(
//         opacity: 0.5,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               'assets/pic$imageIndex.png',
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// },
