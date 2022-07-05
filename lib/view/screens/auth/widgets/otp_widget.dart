// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../../../../dimensions.dart';
//
// class OTPWidget extends StatefulWidget {
//   const OTPWidget({Key? key}) : super(key: key);
//
//   @override
//   State<OTPWidget> createState() => _OTPWidgetState();
// }
//
// class _OTPWidgetState extends State<OTPWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //Text field for each character of pin
//       children: [
//         Container(
//           height: Dimensions.getHeight(context, 70),
//           width: Dimensions.getWidth(context, 70),
//           decoration: BoxDecoration(
//             color: Colors.grey
//           ),
//           child: TextField(
//             textAlign: TextAlign.center,
//             onChanged: (value) {
//               //if filled , proceed to next
//               if (value.length == 1) {
//                 FocusScope.of(context).nextFocus();
//                 //if emptied, proceed to previous
//               } else if (value.isEmpty) {
//                 FocusScope.of(context).previousFocus();
//               }
//             },
//             decoration: InputDecoration(
//                 hintText: "0",
//               // isDense: true,
//               border: InputBorder.none,
//               focusedBorder: OutlineInputBorder(
//                 // borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: Colors.white,),
//
//               )
//               // isDense: true,
//
//             ),
//             style: Theme.of(context).textTheme.headline6,
//             //allow only number as input
//             keyboardType: TextInputType.number,
//             //allow only one character
//             inputFormatters: [
//               LengthLimitingTextInputFormatter(1),
//               FilteringTextInputFormatter.digitsOnly
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
