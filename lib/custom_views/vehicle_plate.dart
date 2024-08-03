import 'package:awr_vehicle_tracker/extensions/view_extensions.dart';
import 'package:flutter/material.dart';

class VehiclePlate extends StatefulWidget {
  const VehiclePlate({super.key, required this.vehiclePlate});

  final String vehiclePlate;

  @override
  State<VehiclePlate> createState() => _VehiclePlateState();
}

class _VehiclePlateState extends State<VehiclePlate> {
  @override
  Widget build(BuildContext context) {
    List plateParsedValue = widget.vehiclePlate.split(" ");
    return SizedBox(
      height: 50,
      child: FittedBox(
        child: Card.outlined(
          elevation: 10,
          color: Colors.white,
          shape: Shapes.defaultRoundedCorner,
          child: Padding(padding: const EdgeInsets.all(10), 
          child: plateParsedValue.length != 3
           ? const Text('Error') : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
                Text(plateParsedValue[1], style: secondaryPlateTextStyle,),
                const SizedBox(width: 20),
                Image(image: AssetImage(getPlatefromEmirate(plateParsedValue[0])),
                width: 50, height: 50),
                const SizedBox(width: 20),
                Text(plateParsedValue[2], style: mainPlateTextStyle),
                const SizedBox(width: 10),
          ],),)),
      ),
    );
  }

  String getPlatefromEmirate(String emirate) {
    switch (emirate) {
      case "AUX":
        return 'assets/plates/ad_logo.png';
      case "DXB":
        return 'assets/plates/dubai_logo.png';
      case "AJM":
        return 'assets/plates/ajman_logo.png';
      case "SHJ":
        return 'assets/plates/sharjah_logo.png';
      case "FUJ":
        return 'assets/plates/fujairah_logo.png';
      case "RAK":
        return 'assets/plates/rak_logo.png';
      case "UAQ":
        return 'assets/plates/uaq_logo.png';
      default:
      return '';
    }
  }
}