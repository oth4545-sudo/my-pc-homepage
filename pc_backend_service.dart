import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// NOTE: Ensure you run `flutterfire configure` or provide Firebase options.

class CompatibilityInfo {
  final String? socket;
  final String? chipset;
  final String? memoryType;
  final String? formFactor;
  final String? pcieVersion;
  final int? maxTdpWatts;
  final List<String>? powerConnectors;
  final List<String>? supportedMemorySpeeds;

  CompatibilityInfo({
    this.socket,
    this.chipset,
    this.memoryType,
    this.formFactor,
    this.pcieVersion,
    this.maxTdpWatts,
    this.powerConnectors,
    this.supportedMemorySpeeds,
  });

  factory CompatibilityInfo.fromJson(Map<String, dynamic> json) {
    return CompatibilityInfo(
      socket: json['socket'] as String?,
      chipset: json['chipset'] as String?,
      memoryType: json['memoryType'] as String?,
      formFactor: json['formFactor'] as String?,
      pcieVersion: json['pcieVersion'] as String?,
      maxTdpWatts: json['maxTdpWatts'] as int?,
      powerConnectors: json['powerConnectors'] != null
          ? List<String>.from(json['powerConnectors'] as List<dynamic>)
          : null,
      supportedMemorySpeeds: json['supportedMemorySpeeds'] != null
          ? List<String>.from(json['supportedMemorySpeeds'] as List<dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'socket': socket,
      'chipset': chipset,
      'memoryType': memoryType,
      'formFactor': formFactor,
      'pcieVersion': pcieVersion,
      'maxTdpWatts': maxTdpWatts,
      'powerConnectors': powerConnectors,
      'supportedMemorySpeeds': supportedMemorySpeeds,
    };
  }
}

class Cpu {
  final String id;
  final String name;
  final String manufacturer;
  final double baseClockGhz;
  final double boostClockGhz;
  final int coreCount;
  final int threadCount;
  final int tdpWatts;
  final bool integratedGraphics;
  final double price;
  final CompatibilityInfo compatibility;

  Cpu({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.baseClockGhz,
    required this.boostClockGhz,
    required this.coreCount,
    required this.threadCount,
    required this.tdpWatts,
    required this.integratedGraphics,
    required this.price,
    required this.compatibility,
  });

  factory Cpu.fromJson(Map<String, dynamic> json) {
    return Cpu(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      baseClockGhz: (json['baseClockGhz'] as num).toDouble(),
      boostClockGhz: (json['boostClockGhz'] as num).toDouble(),
      coreCount: json['coreCount'] as int,
      threadCount: json['threadCount'] as int,
      tdpWatts: json['tdpWatts'] as int,
      integratedGraphics: json['integratedGraphics'] as bool,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'baseClockGhz': baseClockGhz,
      'boostClockGhz': boostClockGhz,
      'coreCount': coreCount,
      'threadCount': threadCount,
      'tdpWatts': tdpWatts,
      'integratedGraphics': integratedGraphics,
      'price': price,
      'compatibility': compatibility.toJson(),
    };
  }
}

class Gpu {
  final String id;
  final String name;
  final String manufacturer;
  final int memoryGb;
  final String memoryType;
  final int tdpWatts;
  final int lengthMm;
  final List<String> powerConnectors;
  final double price;
  final CompatibilityInfo compatibility;

  Gpu({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.memoryGb,
    required this.memoryType,
    required this.tdpWatts,
    required this.lengthMm,
    required this.powerConnectors,
    required this.price,
    required this.compatibility,
  });

  factory Gpu.fromJson(Map<String, dynamic> json) {
    return Gpu(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      memoryGb: json['memoryGb'] as int,
      memoryType: json['memoryType'] as String,
      tdpWatts: json['tdpWatts'] as int,
      lengthMm: json['lengthMm'] as int,
      powerConnectors:
          List<String>.from(json['powerConnectors'] as List<dynamic>),
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'memoryGb': memoryGb,
      'memoryType': memoryType,
      'tdpWatts': tdpWatts,
      'lengthMm': lengthMm,
      'powerConnectors': powerConnectors,
      'price': price,
      'compatibility': compatibility.toJson(),
    };
  }
}

class Ram {
  final String id;
  final String name;
  final String manufacturer;
  final int capacityGb;
  final String type;
  final int speedMhz;
  final int modules;
  final double voltage;
  final bool ecc;
  final double price;
  final CompatibilityInfo compatibility;

  Ram({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.capacityGb,
    required this.type,
    required this.speedMhz,
    required this.modules,
    required this.voltage,
    required this.ecc,
    required this.price,
    required this.compatibility,
  });

  factory Ram.fromJson(Map<String, dynamic> json) {
    return Ram(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      capacityGb: json['capacityGb'] as int,
      type: json['type'] as String,
      speedMhz: json['speedMhz'] as int,
      modules: json['modules'] as int,
      voltage: (json['voltage'] as num).toDouble(),
      ecc: json['ecc'] as bool,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'capacityGb': capacityGb,
      'type': type,
      'speedMhz': speedMhz,
      'modules': modules,
      'voltage': voltage,
      'ecc': ecc,
      'price': price,
      'compatibility': compatibility.toJson(),
    };
  }
}

class Motherboard {
  final String id;
  final String name;
  final String manufacturer;
  final String chipset;
  final String socket;
  final String formFactor;
  final int memorySlots;
  final int maxMemoryGb;
  final String supportedMemoryType;
  final String pciExpressVersion;
  final List<String> storageInterfaces;
  final List<String> powerConnectors;
  final double price;
  final CompatibilityInfo compatibility;

  Motherboard({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.chipset,
    required this.socket,
    required this.formFactor,
    required this.memorySlots,
    required this.maxMemoryGb,
    required this.supportedMemoryType,
    required this.pciExpressVersion,
    required this.storageInterfaces,
    required this.powerConnectors,
    required this.price,
    required this.compatibility,
  });

  factory Motherboard.fromJson(Map<String, dynamic> json) {
    return Motherboard(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      chipset: json['chipset'] as String,
      socket: json['socket'] as String,
      formFactor: json['formFactor'] as String,
      memorySlots: json['memorySlots'] as int,
      maxMemoryGb: json['maxMemoryGb'] as int,
      supportedMemoryType: json['supportedMemoryType'] as String,
      pciExpressVersion: json['pciExpressVersion'] as String,
      storageInterfaces:
          List<String>.from(json['storageInterfaces'] as List<dynamic>),
      powerConnectors:
          List<String>.from(json['powerConnectors'] as List<dynamic>),
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'chipset': chipset,
      'socket': socket,
      'formFactor': formFactor,
      'memorySlots': memorySlots,
      'maxMemoryGb': maxMemoryGb,
      'supportedMemoryType': supportedMemoryType,
      'pciExpressVersion': pciExpressVersion,
      'storageInterfaces': storageInterfaces,
      'powerConnectors': powerConnectors,
      'price': price,
      'compatibility': compatibility.toJson(),
    };
  }
}

class PowerSupply {
  final String id;
  final String name;
  final String manufacturer;
  final int wattage;
  final String efficiencyRating;
  final bool modular;
  final List<String> connectors;
  final double price;
  final CompatibilityInfo compatibility;

  PowerSupply({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.wattage,
    required this.efficiencyRating,
    required this.modular,
    required this.connectors,
    required this.price,
    required this.compatibility,
  });

  factory PowerSupply.fromJson(Map<String, dynamic> json) {
    return PowerSupply(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      wattage: json['wattage'] as int,
      efficiencyRating: json['efficiencyRating'] as String,
      modular: json['modular'] as bool,
      connectors: List<String>.from(json['connectors'] as List<dynamic>),
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'wattage': wattage,
      'efficiencyRating': efficiencyRating,
      'modular': modular,
      'connectors': connectors,
      'price': price,
      'compatibility': compatibility.toJson(),
    };
  }
}

class Storage {
  final String id;
  final String name;
  final String manufacturer;
  final String type;
  final int capacityGb;
  final String interfaceType;
  final String formFactor;
  final double price;

  Storage({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.capacityGb,
    required this.interfaceType,
    required this.formFactor,
    required this.price,
  });

  factory Storage.fromJson(Map<String, dynamic> json) {
    return Storage(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      type: json['type'] as String,
      capacityGb: json['capacityGb'] as int,
      interfaceType: json['interfaceType'] as String,
      formFactor: json['formFactor'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'type': type,
      'capacityGb': capacityGb,
      'interfaceType': interfaceType,
      'formFactor': formFactor,
      'price': price,
    };
  }
}

class PcCase {
  final String id;
  final String name;
  final String manufacturer;
  final String formFactor;
  final int maxGpuLengthMm;
  final int maxCoolerHeightMm;
  final List<String> frontPanelUsb;
  final double price;

  PcCase({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.formFactor,
    required this.maxGpuLengthMm,
    required this.maxCoolerHeightMm,
    required this.frontPanelUsb,
    required this.price,
  });

  factory PcCase.fromJson(Map<String, dynamic> json) {
    return PcCase(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      formFactor: json['formFactor'] as String,
      maxGpuLengthMm: json['maxGpuLengthMm'] as int,
      maxCoolerHeightMm: json['maxCoolerHeightMm'] as int,
      frontPanelUsb: List<String>.from(json['frontPanelUsb'] as List<dynamic>),
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'formFactor': formFactor,
      'maxGpuLengthMm': maxGpuLengthMm,
      'maxCoolerHeightMm': maxCoolerHeightMm,
      'frontPanelUsb': frontPanelUsb,
      'price': price,
    };
  }
}

class SimulatorDevice {
  final String id;
  final String name;
  final String manufacturer;
  final String deviceType;
  final double price;
  final CompatibilityInfo compatibility;

  SimulatorDevice({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.deviceType,
    required this.price,
    required this.compatibility,
  });

  factory SimulatorDevice.fromJson(Map<String, dynamic> json) {
    return SimulatorDevice(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      deviceType: json['deviceType'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'deviceType': deviceType,
      'price': price,
      'compatibility': compatibility.toJson(),
    };
  }
}

class RacingWheel extends SimulatorDevice {
  final int rotationDegrees;
  final bool forceFeedback;

  RacingWheel({
    required String id,
    required String name,
    required String manufacturer,
    required double price,
    required CompatibilityInfo compatibility,
    required this.rotationDegrees,
    required this.forceFeedback,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          deviceType: 'RacingWheel',
          price: price,
          compatibility: compatibility,
        );

  factory RacingWheel.fromJson(Map<String, dynamic> json) {
    return RacingWheel(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      rotationDegrees: json['rotationDegrees'] as int,
      forceFeedback: json['forceFeedback'] as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'rotationDegrees': rotationDegrees,
      'forceFeedback': forceFeedback,
    });
    return json;
  }
}

class PedalSet extends SimulatorDevice {
  final bool adjustable;
  final bool analog;

  PedalSet({
    required String id,
    required String name,
    required String manufacturer,
    required double price,
    required CompatibilityInfo compatibility,
    required this.adjustable,
    required this.analog,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          deviceType: 'PedalSet',
          price: price,
          compatibility: compatibility,
        );

  factory PedalSet.fromJson(Map<String, dynamic> json) {
    return PedalSet(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      adjustable: json['adjustable'] as bool,
      analog: json['analog'] as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'adjustable': adjustable,
      'analog': analog,
    });
    return json;
  }
}

class Shifter extends SimulatorDevice {
  final String pattern;
  final int gears;

  Shifter({
    required String id,
    required String name,
    required String manufacturer,
    required double price,
    required CompatibilityInfo compatibility,
    required this.pattern,
    required this.gears,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          deviceType: 'Shifter',
          price: price,
          compatibility: compatibility,
        );

  factory Shifter.fromJson(Map<String, dynamic> json) {
    return Shifter(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      pattern: json['pattern'] as String,
      gears: json['gears'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'pattern': pattern,
      'gears': gears,
    });
    return json;
  }
}

class Cockpit extends SimulatorDevice {
  final bool adjustableSeat;
  final bool supportsWheelMount;

  Cockpit({
    required String id,
    required String name,
    required String manufacturer,
    required double price,
    required CompatibilityInfo compatibility,
    required this.adjustableSeat,
    required this.supportsWheelMount,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          deviceType: 'Cockpit',
          price: price,
          compatibility: compatibility,
        );

  factory Cockpit.fromJson(Map<String, dynamic> json) {
    return Cockpit(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      adjustableSeat: json['adjustableSeat'] as bool,
      supportsWheelMount: json['supportsWheelMount'] as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'adjustableSeat': adjustableSeat,
      'supportsWheelMount': supportsWheelMount,
    });
    return json;
  }
}

class FlightStick extends SimulatorDevice {
  final int buttons;
  final bool throttleIncluded;
  final String sensorType;

  FlightStick({
    required String id,
    required String name,
    required String manufacturer,
    required double price,
    required CompatibilityInfo compatibility,
    required this.buttons,
    required this.throttleIncluded,
    required this.sensorType,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          deviceType: 'FlightStick',
          price: price,
          compatibility: compatibility,
        );

  factory FlightStick.fromJson(Map<String, dynamic> json) {
    return FlightStick(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      buttons: json['buttons'] as int,
      throttleIncluded: json['throttleIncluded'] as bool,
      sensorType: json['sensorType'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'buttons': buttons,
      'throttleIncluded': throttleIncluded,
      'sensorType': sensorType,
    });
    return json;
  }
}

class WaterCoolingPart {
  final String id;
  final String name;
  final String manufacturer;
  final String material;
  final double price;
  final CompatibilityInfo compatibility;

  WaterCoolingPart({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.material,
    required this.price,
    required this.compatibility,
  });

  factory WaterCoolingPart.fromJson(Map<String, dynamic> json) {
    return WaterCoolingPart(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      material: json['material'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'material': material,
      'price': price,
      'compatibility': compatibility.toJson(),
    };
  }
}

class WaterBlock extends WaterCoolingPart {
  final List<String> supportedSockets;
  final double maxFlowRateLpm;

  WaterBlock({
    required String id,
    required String name,
    required String manufacturer,
    required String material,
    required double price,
    required CompatibilityInfo compatibility,
    required this.supportedSockets,
    required this.maxFlowRateLpm,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          material: material,
          price: price,
          compatibility: compatibility,
        );

  factory WaterBlock.fromJson(Map<String, dynamic> json) {
    return WaterBlock(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      material: json['material'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      supportedSockets:
          List<String>.from(json['supportedSockets'] as List<dynamic>),
      maxFlowRateLpm: (json['maxFlowRateLpm'] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'supportedSockets': supportedSockets,
      'maxFlowRateLpm': maxFlowRateLpm,
    });
    return json;
  }
}

class Radiator extends WaterCoolingPart {
  final int widthMm;
  final int heightMm;
  final int thicknessMm;
  final int fanCount;

  Radiator({
    required String id,
    required String name,
    required String manufacturer,
    required String material,
    required double price,
    required CompatibilityInfo compatibility,
    required this.widthMm,
    required this.heightMm,
    required this.thicknessMm,
    required this.fanCount,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          material: material,
          price: price,
          compatibility: compatibility,
        );

  factory Radiator.fromJson(Map<String, dynamic> json) {
    return Radiator(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      material: json['material'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      widthMm: json['widthMm'] as int,
      heightMm: json['heightMm'] as int,
      thicknessMm: json['thicknessMm'] as int,
      fanCount: json['fanCount'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'widthMm': widthMm,
      'heightMm': heightMm,
      'thicknessMm': thicknessMm,
      'fanCount': fanCount,
    });
    return json;
  }
}

class Pump extends WaterCoolingPart {
  final double maxFlowRateLpm;
  final double maxHeadM;
  final String powerConnector;

  Pump({
    required String id,
    required String name,
    required String manufacturer,
    required String material,
    required double price,
    required CompatibilityInfo compatibility,
    required this.maxFlowRateLpm,
    required this.maxHeadM,
    required this.powerConnector,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          material: material,
          price: price,
          compatibility: compatibility,
        );

  factory Pump.fromJson(Map<String, dynamic> json) {
    return Pump(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      material: json['material'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      maxFlowRateLpm: (json['maxFlowRateLpm'] as num).toDouble(),
      maxHeadM: (json['maxHeadM'] as num).toDouble(),
      powerConnector: json['powerConnector'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'maxFlowRateLpm': maxFlowRateLpm,
      'maxHeadM': maxHeadM,
      'powerConnector': powerConnector,
    });
    return json;
  }
}

class Reservoir extends WaterCoolingPart {
  final int volumeMl;
  final String mountType;

  Reservoir({
    required String id,
    required String name,
    required String manufacturer,
    required String material,
    required double price,
    required CompatibilityInfo compatibility,
    required this.volumeMl,
    required this.mountType,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          material: material,
          price: price,
          compatibility: compatibility,
        );

  factory Reservoir.fromJson(Map<String, dynamic> json) {
    return Reservoir(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      material: json['material'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      volumeMl: json['volumeMl'] as int,
      mountType: json['mountType'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'volumeMl': volumeMl,
      'mountType': mountType,
    });
    return json;
  }
}

class Tube extends WaterCoolingPart {
  final double innerDiameterMm;
  final double outerDiameterMm;
  final int lengthMm;

  Tube({
    required String id,
    required String name,
    required String manufacturer,
    required String material,
    required double price,
    required CompatibilityInfo compatibility,
    required this.innerDiameterMm,
    required this.outerDiameterMm,
    required this.lengthMm,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          material: material,
          price: price,
          compatibility: compatibility,
        );

  factory Tube.fromJson(Map<String, dynamic> json) {
    return Tube(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      material: json['material'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      innerDiameterMm: (json['innerDiameterMm'] as num).toDouble(),
      outerDiameterMm: (json['outerDiameterMm'] as num).toDouble(),
      lengthMm: json['lengthMm'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'innerDiameterMm': innerDiameterMm,
      'outerDiameterMm': outerDiameterMm,
      'lengthMm': lengthMm,
    });
    return json;
  }
}

class Fitting extends WaterCoolingPart {
  final String fittingSizeMm;
  final String type;

  Fitting({
    required String id,
    required String name,
    required String manufacturer,
    required String material,
    required double price,
    required CompatibilityInfo compatibility,
    required this.fittingSizeMm,
    required this.type,
  }) : super(
          id: id,
          name: name,
          manufacturer: manufacturer,
          material: material,
          price: price,
          compatibility: compatibility,
        );

  factory Fitting.fromJson(Map<String, dynamic> json) {
    return Fitting(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      material: json['material'] as String,
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      fittingSizeMm: json['fittingSizeMm'] as String,
      type: json['type'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'fittingSizeMm': fittingSizeMm,
      'type': type,
    });
    return json;
  }
}

class Coolant {
  final String id;
  final String name;
  final String manufacturer;
  final String color;
  final int capacityMl;
  final double thermalConductivityWPerMK;
  final double price;
  final CompatibilityInfo compatibility;

  Coolant({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.color,
    required this.capacityMl,
    required this.thermalConductivityWPerMK,
    required this.price,
    required this.compatibility,
  });

  factory Coolant.fromJson(Map<String, dynamic> json) {
    return Coolant(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      color: json['color'] as String,
      capacityMl: json['capacityMl'] as int,
      thermalConductivityWPerMK:
          (json['thermalConductivityWPerMK'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      compatibility: CompatibilityInfo.fromJson(
          json['compatibility'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'color': color,
      'capacityMl': capacityMl,
      'thermalConductivityWPerMK': thermalConductivityWPerMK,
      'price': price,
      'compatibility': compatibility.toJson(),
    };
  }
}

class CompatibilityCheckResult {
  final bool compatible;
  final List<String> issues;
  final List<String> recommendations;

  CompatibilityCheckResult({
    required this.compatible,
    required this.issues,
    required this.recommendations,
  });
}

class UserPcSpec {
  final Cpu? cpu;
  final Gpu? gpu;
  final Ram? ram;
  final Motherboard? motherboard;
  final PowerSupply? powerSupply;
  final PcCase? pcCase;
  final Storage? storage;
  final List<SimulatorDevice>? simulatorDevices;

  UserPcSpec({
    this.cpu,
    this.gpu,
    this.ram,
    this.motherboard,
    this.powerSupply,
    this.pcCase,
    this.storage,
    this.simulatorDevices,
  });
}

class UpgradeRecommendation {
  final String targetUsage;
  final List<String> upgradeSteps;
  final List<Map<String, dynamic>> recommendedParts;
  final double estimatedPrice;

  UpgradeRecommendation({
    required this.targetUsage,
    required this.upgradeSteps,
    required this.recommendedParts,
    required this.estimatedPrice,
  });
}

class BuildEstimate {
  final String name;
  final List<Map<String, dynamic>> parts;
  final double totalPrice;
  final List<String> notes;

  BuildEstimate({
    required this.name,
    required this.parts,
    required this.totalPrice,
    required this.notes,
  });
}

class PCBackendService {
  final List<Cpu> cpus;
  final List<Gpu> gpus;
  final List<Ram> rams;
  final List<Motherboard> motherboards;
  final List<PowerSupply> powerSupplies;
  final List<PcCase> cases;
  final List<Storage> storages;
  final List<SimulatorDevice> simulatorDevices;
  final List<WaterCoolingPart> waterCoolingParts;
  final List<Coolant> coolants;
  final String openAiApiKey; // OpenAI/Gemini API 키를 생성자 주입으로 전달합니다.

  static final List<SimulatorDevice> mockSimulatorDevices = [
    RacingWheel(
      id: 'fanatec-podium-dd1',
      name: 'Fanatec Podium DD1',
      manufacturer: 'Fanatec',
      price: 1299000.0,
      compatibility: CompatibilityInfo(pcieVersion: 'USB 3.0'),
      rotationDegrees: 1080,
      forceFeedback: true,
    ),
    PedalSet(
      id: 'fanatec-clubsport-v3',
      name: 'Fanatec ClubSport V3 Pedals',
      manufacturer: 'Fanatec',
      price: 599000.0,
      compatibility: CompatibilityInfo(powerConnectors: ['USB']),
      adjustable: true,
      analog: true,
    ),
    Shifter(
      id: 'fanatec-clubsport-shifter',
      name: 'Fanatec ClubSport Shifter SQ',
      manufacturer: 'Fanatec',
      price: 329000.0,
      compatibility: CompatibilityInfo(),
      pattern: 'H-pattern',
      gears: 6,
    ),
    Cockpit(
      id: 'fanatec-podium-cockpit',
      name: 'Fanatec Podium Racing Cockpit',
      manufacturer: 'Fanatec',
      price: 799000.0,
      compatibility:
          CompatibilityInfo(formFactor: 'Universal', memoryType: 'Racing'),
      adjustableSeat: true,
      supportsWheelMount: true,
    ),
    RacingWheel(
      id: 'logitech-g923',
      name: 'Logitech G923',
      manufacturer: 'Logitech',
      price: 499000.0,
      compatibility: CompatibilityInfo(pcieVersion: 'USB 3.0'),
      rotationDegrees: 900,
      forceFeedback: true,
    ),
    FlightStick(
      id: 'thrustmaster-warhog',
      name: 'Thrustmaster HOTAS Warthog',
      manufacturer: 'Thrustmaster',
      price: 429000.0,
      compatibility: CompatibilityInfo(pcieVersion: 'USB 2.0'),
      buttons: 19,
      throttleIncluded: true,
      sensorType: 'Hall Effect',
    ),
    FlightStick(
      id: 'thrustmaster-t-flight-hotas-4',
      name: 'Thrustmaster T.Flight HOTAS 4',
      manufacturer: 'Thrustmaster',
      price: 199000.0,
      compatibility: CompatibilityInfo(pcieVersion: 'USB 2.0'),
      buttons: 12,
      throttleIncluded: true,
      sensorType: 'Potentiometer',
    ),
  ];

  static final List<WaterCoolingPart> mockWaterCoolingParts = [
    WaterBlock(
      id: 'corsair-xh305i',
      name: 'Corsair Hydro X Series XC7 RGB',
      manufacturer: 'Corsair',
      material: 'Nickel-Plated Copper',
      price: 219000.0,
      compatibility: CompatibilityInfo(),
      supportedSockets: ['LGA1700', 'LGA1200', 'AM4'],
      maxFlowRateLpm: 80.0,
    ),
    Radiator(
      id: 'ek-coolstream-pe-360',
      name: 'EK-CoolStream PE 360',
      manufacturer: 'EK',
      material: 'Aluminum',
      price: 109000.0,
      compatibility: CompatibilityInfo(),
      widthMm: 120,
      heightMm: 398,
      thicknessMm: 30,
      fanCount: 3,
    ),
    Pump(
      id: 'corsair-xd5',
      name: 'Corsair Hydro X XD5 Pump/Reservoir Combo',
      manufacturer: 'Corsair',
      material: 'Plastic',
      price: 199000.0,
      compatibility: CompatibilityInfo(powerConnectors: ['SATA']),
      maxFlowRateLpm: 85.0,
      maxHeadM: 5.2,
      powerConnector: 'SATA',
    ),
    Reservoir(
      id: 'ek-res-x3',
      name: 'EK-Quantum Kinetic FLT 280',
      manufacturer: 'EK',
      material: 'Acrylic',
      price: 89000.0,
      compatibility: CompatibilityInfo(),
      volumeMl: 500,
      mountType: 'Case Mount',
    ),
    Tube(
      id: 'corsair-hx-tube',
      name: 'Corsair Hydro X Series Rigid PETG Tube',
      manufacturer: 'Corsair',
      material: 'PETG',
      price: 25000.0,
      compatibility: CompatibilityInfo(),
      innerDiameterMm: 10.0,
      outerDiameterMm: 13.0,
      lengthMm: 500,
    ),
    Fitting(
      id: 'bitspower-90',
      name: 'Bitspower G1/4" 90 Degree Rotary Fitting',
      manufacturer: 'Bitspower',
      material: 'Brass',
      price: 18000.0,
      compatibility: CompatibilityInfo(),
      fittingSizeMm: '1/4"',
      type: '90 degree',
    ),
  ];

  static final List<Coolant> mockCoolants = [
    Coolant(
      id: 'corsair-hx-green',
      name: 'Corsair Hydro X Series XL5 Coolant - Green',
      manufacturer: 'Corsair',
      color: 'Green',
      capacityMl: 1000,
      thermalConductivityWPerMK: 0.58,
      price: 25000.0,
      compatibility: CompatibilityInfo(),
    ),
    Coolant(
      id: 'ek-coolant-clear',
      name: 'EK-CryoFuel Clear Coolant',
      manufacturer: 'EK',
      color: 'Clear',
      capacityMl: 1000,
      thermalConductivityWPerMK: 0.49,
      price: 18000.0,
      compatibility: CompatibilityInfo(),
    ),
  ];

  static final List<PcCase> mockCockpits = [
    PcCase(
      id: 'playseat-evolution',
      name: 'Playseat Evolution',
      manufacturer: 'Playseat',
      formFactor: 'Universal',
      maxGpuLengthMm: 300,
      maxCoolerHeightMm: 160,
      frontPanelUsb: ['USB 3.0'],
      price: 499000.0,
    ),
    PcCase(
      id: 'next-level-racing-f1',
      name: 'Next Level Racing F-GT Elite',
      manufacturer: 'Next Level Racing',
      formFactor: 'Cockpit',
      maxGpuLengthMm: 320,
      maxCoolerHeightMm: 170,
      frontPanelUsb: ['USB 3.0', 'USB-C'],
      price: 650000.0,
    ),
  ];

  static PCBackendService withMockData({required String openAiApiKey}) {
    return PCBackendService(
      cpus: [
        Cpu(
          id: 'cpu-01',
          name: 'Intel Core i9-13900K',
          manufacturer: 'Intel',
          baseClockGhz: 3.0,
          boostClockGhz: 5.8,
          coreCount: 24,
          threadCount: 32,
          tdpWatts: 125,
          integratedGraphics: true,
          price: 820000.0,
          compatibility: CompatibilityInfo(
              socket: 'LGA1700', chipset: 'Z790', memoryType: 'DDR5'),
        ),
      ],
      gpus: [
        Gpu(
          id: 'gpu-01',
          name: 'NVIDIA GeForce RTX 4080',
          manufacturer: 'NVIDIA',
          memoryGb: 16,
          memoryType: 'GDDR6X',
          tdpWatts: 320,
          lengthMm: 304,
          powerConnectors: ['PCIe 8-pin', 'PCIe 8-pin'],
          price: 1790000.0,
          compatibility: CompatibilityInfo(pcieVersion: '4.0'),
        ),
      ],
      rams: [
        Ram(
          id: 'ram-01',
          name: 'Corsair Vengeance DDR5 32GB',
          manufacturer: 'Corsair',
          capacityGb: 32,
          type: 'DDR5',
          speedMhz: 5600,
          modules: 2,
          voltage: 1.25,
          ecc: false,
          price: 290000.0,
          compatibility: CompatibilityInfo(memoryType: 'DDR5'),
        ),
      ],
      motherboards: [
        Motherboard(
          id: 'mb-01',
          name: 'ASUS ROG Strix Z790-E',
          manufacturer: 'ASUS',
          chipset: 'Z790',
          socket: 'LGA1700',
          formFactor: 'ATX',
          memorySlots: 4,
          maxMemoryGb: 128,
          supportedMemoryType: 'DDR5',
          pciExpressVersion: '5.0',
          storageInterfaces: ['M.2', 'SATA'],
          powerConnectors: ['24-pin', '8-pin', '8-pin'],
          price: 620000.0,
          compatibility: CompatibilityInfo(
              socket: 'LGA1700',
              chipset: 'Z790',
              memoryType: 'DDR5',
              formFactor: 'ATX'),
        ),
      ],
      powerSupplies: [
        PowerSupply(
          id: 'psu-01',
          name: 'Seasonic PRIME TX-850',
          manufacturer: 'Seasonic',
          wattage: 850,
          efficiencyRating: '80 Plus Titanium',
          modular: true,
          connectors: ['24-pin', '8-pin', 'PCIe 8-pin', 'PCIe 8-pin'],
          price: 320000.0,
          compatibility:
              CompatibilityInfo(powerConnectors: ['24-pin', 'PCIe 8-pin']),
        ),
      ],
      cases: [...mockCockpits],
      storages: [
        Storage(
          id: 'storage-01',
          name: 'Samsung 980 Pro 1TB',
          manufacturer: 'Samsung',
          type: 'NVMe',
          capacityGb: 1000,
          interfaceType: 'PCIe 4.0',
          formFactor: 'M.2',
          price: 150000.0,
        ),
      ],
      simulatorDevices: [...mockSimulatorDevices],
      waterCoolingParts: [...mockWaterCoolingParts],
      coolants: [...mockCoolants],
      openAiApiKey: openAiApiKey,
    );
  }

  PCBackendService({
    required this.cpus,
    required this.gpus,
    required this.rams,
    required this.motherboards,
    required this.powerSupplies,
    required this.cases,
    required this.storages,
    required this.simulatorDevices,
    required this.waterCoolingParts,
    required this.coolants,
    required this.openAiApiKey,
  });

  CompatibilityCheckResult checkCompatibility({
    Cpu? cpu,
    Gpu? gpu,
    Ram? ram,
    Motherboard? motherboard,
    PowerSupply? powerSupply,
    PcCase? pcCase,
  }) {
    final issues = <String>[];
    final recommendations = <String>[];

    if (cpu != null && motherboard != null) {
      if (cpu.compatibility.socket != null && motherboard.socket.isNotEmpty) {
        if (cpu.compatibility.socket != motherboard.socket) {
          issues.add(
              'CPU 소켓(${cpu.compatibility.socket})이 메인보드 소켓(${motherboard.socket})과 일치하지 않습니다.');
          recommendations.add('같은 소켓의 CPU 또는 메인보드를 선택하세요.');
        }
      }
    }

    if (ram != null && motherboard != null) {
      if (ram.type != motherboard.supportedMemoryType) {
        issues.add(
            'RAM 타입(${ram.type})이 메인보드 지원 메모리 타입(${motherboard.supportedMemoryType})과 일치하지 않습니다.');
        recommendations.add('호환되는 메모리 타입을 선택하세요.');
      }
      if (ram.capacityGb > motherboard.maxMemoryGb) {
        issues.add(
            'RAM 용량(${ram.capacityGb}GB)이 메인보드 최대 지원 용량(${motherboard.maxMemoryGb}GB)을 초과합니다.');
        recommendations.add('메인보드 최대 메모리 용량 이하의 RAM 키트를 사용하세요.');
      }
      if (ram.modules > motherboard.memorySlots) {
        issues.add(
            'RAM 모듈 수(${ram.modules})가 메인보드 메모리 슬롯 수(${motherboard.memorySlots})를 초과합니다.');
        recommendations.add('메모리 슬롯 수에 맞는 모듈 구성을 사용하세요.');
      }
    }

    if (gpu != null) {
      if (gpu.powerConnectors.isNotEmpty && powerSupply != null) {
        final requiredPcie = gpu.powerConnectors
            .where((connector) => connector.toLowerCase().contains('pci'))
            .toList();
        for (final required in requiredPcie) {
          if (!powerSupply.connectors.any((connector) =>
              connector.toLowerCase().contains(required.toLowerCase()))) {
            issues.add('GPU 전원 커넥터($required)가 PSU에 없습니다.');
            recommendations.add('필요한 PCIe 전원 커넥터가 있는 PSU로 교체하세요.');
            break;
          }
        }
      }
      if (pcCase != null) {
        if (gpu.lengthMm > pcCase.maxGpuLengthMm) {
          issues.add(
              'GPU 길이(${gpu.lengthMm}mm)가 케이스 허용 길이(${pcCase.maxGpuLengthMm}mm)를 초과합니다.');
          recommendations.add('케이스 또는 짧은 GPU를 선택하세요.');
        }
      }
    }

    if (powerSupply != null && cpu != null) {
      final neededWatt = cpu.tdpWatts + (gpu?.tdpWatts ?? 0) + 150;
      if (powerSupply.wattage < neededWatt) {
        issues.add(
            '추천 PSU 와트 수(${powerSupply.wattage}W)가 필요한 최소 와트(${neededWatt}W)보다 낮습니다.');
        recommendations.add('여유 전력을 확보할 수 있는 PSU를 선택하세요.');
      }
      if (!powerSupply.connectors
          .any((connector) => connector.toLowerCase().contains('24-pin'))) {
        issues.add('PSU에 24핀 메인 전원 커넥터가 없습니다.');
        recommendations.add('24핀 메인 커넥터가 있는 PSU를 선택하세요.');
      }
    }

    if (motherboard != null && pcCase != null) {
      if (motherboard.formFactor != pcCase.formFactor) {
        issues.add(
            '메인보드 폼팩터(${motherboard.formFactor})가 케이스 폼팩터(${pcCase.formFactor})와 일치하지 않습니다.');
        recommendations.add('같은 폼팩터 또는 케이스가 지원하는 폼팩터를 선택하세요.');
      }
    }

    return CompatibilityCheckResult(
      compatible: issues.isEmpty,
      issues: issues,
      recommendations: recommendations,
    );
  }

  UpgradeRecommendation getUpgradeRecommendations(
      UserPcSpec currentSpec, String targetUsage) {
    final steps = <String>[];
    final recommended = <Map<String, dynamic>>[];
    double price = 0.0;
    final highPerformance = targetUsage.contains('상옵') ||
        targetUsage.contains('레이싱') ||
        targetUsage.contains('VR') ||
        targetUsage.contains('플라이트');

    final targetGpu = _recommendGpu(currentSpec.gpu, highPerformance);
    if (targetGpu != null &&
        (currentSpec.gpu == null || targetGpu.id != currentSpec.gpu!.id)) {
      steps.add('GPU 교체 또는 업그레이드가 필요합니다.');
      recommended
          .add({'component': 'GPU', 'recommendation': targetGpu.toJson()});
      price += targetGpu.price;
    }

    final targetCpu = _recommendCpu(currentSpec.cpu, highPerformance);
    if (targetCpu != null &&
        (currentSpec.cpu == null || targetCpu.id != currentSpec.cpu!.id)) {
      steps.add('CPU 교체를 고려하세요.');
      recommended
          .add({'component': 'CPU', 'recommendation': targetCpu.toJson()});
      price += targetCpu.price;
    }

    final targetRam = _recommendRam(currentSpec.ram, highPerformance);
    if (targetRam != null &&
        (currentSpec.ram == null || targetRam.id != currentSpec.ram!.id)) {
      steps.add('RAM 용량 또는 속도 업그레이드가 필요합니다.');
      recommended
          .add({'component': 'RAM', 'recommendation': targetRam.toJson()});
      price += targetRam.price;
    }

    final requiredPsu =
        _recommendPowerSupply(currentSpec.powerSupply, targetCpu, targetGpu);
    if (requiredPsu != null &&
        (currentSpec.powerSupply == null ||
            requiredPsu.id != currentSpec.powerSupply!.id)) {
      steps.add('더 높은 용량 또는 적절한 커넥터를 가진 PSU를 선택하세요.');
      recommended.add(
          {'component': 'PowerSupply', 'recommendation': requiredPsu.toJson()});
      price += requiredPsu.price;
    }

    if (targetUsage.contains('레이싱') || targetUsage.contains('콕핏')) {
      final cockpit = _findSimulator('Cockpit');
      if (cockpit != null) {
        steps.add('레이싱 콕핏 또는 시뮬레이터 장비를 추가하세요.');
        recommended.add(
            {'component': 'Simulator', 'recommendation': cockpit.toJson()});
        price += cockpit.price;
      }
    }

    if (steps.isEmpty) {
      steps.add('현재 사양으로도 목표 용도에 충분할 가능성이 있습니다.');
    }

    return UpgradeRecommendation(
      targetUsage: targetUsage,
      upgradeSteps: steps,
      recommendedParts: recommended,
      estimatedPrice: price,
    );
  }

  List<BuildEstimate> getCustomBuildEstimate(double budget, String useCase) {
    final estimates = <BuildEstimate>[];
    final isRacing = useCase.contains('레이싱') || useCase.contains('콕핏');
    final isFlight = useCase.contains('플라이트');
    final isVr = useCase.contains('VR');
    final isWaterCooling = useCase.contains('수랭');

    estimates.add(_buildPackage(
        '기본 패키지', budget, isRacing, isFlight, isVr, isWaterCooling, false));
    estimates.add(_buildPackage(
        '성능 패키지', budget, isRacing, isFlight, isVr, isWaterCooling, true));

    return estimates
        .where((estimate) => estimate.totalPrice <= budget * 1.1)
        .toList();
  }

  BuildEstimate _buildPackage(String name, double budget, bool isRacing,
      bool isFlight, bool isVr, bool isWaterCooling, bool premium) {
    final cpu = premium ? _selectCpu(6) : _selectCpu(4);
    final gpu = _selectGpu(isVr ? 10 : 8, premium ? 10 : 8);
    final ram = premium ? _selectRam(32) : _selectRam(16);
    final motherboard = _selectMotherboardForCpu(cpu);
    final psu = _selectPowerSupplyForBuild(cpu, gpu, premium);
    final pcCase = _selectCaseForGpu(gpu);
    final storage = _selectStorage();

    final parts = <Map<String, dynamic>>[
      {'component': 'CPU', 'item': cpu.toJson()},
      {'component': 'GPU', 'item': gpu.toJson()},
      {'component': 'RAM', 'item': ram.toJson()},
      {'component': 'Motherboard', 'item': motherboard.toJson()},
      {'component': 'PowerSupply', 'item': psu.toJson()},
      {'component': 'Case', 'item': pcCase.toJson()},
      {'component': 'Storage', 'item': storage.toJson()},
    ];

    if (isRacing || isFlight) {
      final simType = isFlight ? 'FlightStick' : 'Cockpit';
      final simulator =
          _findSimulator(simType) ?? _findSimulator('RacingWheel');
      if (simulator != null) {
        parts.add({'component': 'Simulator', 'item': simulator.toJson()});
      }
    }

    if (isWaterCooling) {
      final waterKit = _buildWaterCoolingKit(cpu);
      parts.addAll(waterKit.map(
          (item) => {'component': item['component'], 'item': item['item']}));
    }

    final totalPrice = parts.fold<double>(0.0, (sum, part) {
      final item = part['item'];
      if (item is Map<String, dynamic> && item.containsKey('price')) {
        return sum + (item['price'] as num).toDouble();
      }
      return sum;
    });

    final notes = <String>[];
    if (totalPrice > budget) {
      notes.add('선택된 부품 조합의 예상 가격이 예산을 초과할 수 있습니다.');
    }
    if (isWaterCooling && budget < 1500000) {
      notes.add('수랭 조립은 예산이 부족할 수 있으므로 추가 예산을 고려하세요.');
    }
    if (isVr) {
      notes.add('VR은 높은 GPU 성능과 CPU 코어 수를 요구하므로 충분한 예산을 확보하세요.');
    }

    return BuildEstimate(
      name: name,
      parts: parts,
      totalPrice: totalPrice,
      notes: notes,
    );
  }

  Cpu _recommendCpu(Cpu? currentCpu, bool highPerformance) {
    if (currentCpu == null) {
      return highPerformance ? _bestCpu() : _selectCpu(4);
    }
    final candidates = cpus
        .where((cpu) =>
            cpu.compatibility.socket == currentCpu.compatibility.socket)
        .toList();
    candidates.sort((a, b) => b.coreCount.compareTo(a.coreCount));
    final selected = candidates.firstWhere(
      (cpu) =>
          cpu.coreCount > currentCpu.coreCount ||
          cpu.boostClockGhz > currentCpu.boostClockGhz,
      orElse: () => currentCpu,
    );
    return selected;
  }

  Gpu _recommendGpu(Gpu? currentGpu, bool highPerformance) {
    if (currentGpu == null) {
      return highPerformance ? _bestGpu() : _selectGpu(8, 8);
    }
    final candidates =
        gpus.where((gpu) => gpu.memoryGb >= (highPerformance ? 8 : 8)).toList();
    candidates.sort((a, b) => b.memoryGb.compareTo(a.memoryGb));
    final selected = candidates.firstWhere(
      (gpu) =>
          gpu.memoryGb > currentGpu.memoryGb ||
          gpu.tdpWatts > currentGpu.tdpWatts,
      orElse: () => currentGpu,
    );
    return selected;
  }

  Ram _recommendRam(Ram? currentRam, bool highPerformance) {
    final targetSize = highPerformance ? 32 : 16;
    if (currentRam == null || currentRam.capacityGb < targetSize) {
      return rams.where((ram) => ram.capacityGb >= targetSize).fold(rams.first,
          (Ram best, Ram candidate) {
        return candidate.price < best.price ? candidate : best;
      });
    }
    return currentRam;
  }

  PowerSupply? _recommendPowerSupply(
      PowerSupply? currentPsu, Cpu? cpu, Gpu? gpu) {
    final neededWatt = (cpu?.tdpWatts ?? 65) + (gpu?.tdpWatts ?? 100) + 150;
    final candidate = powerSupplies
        .where((psu) => psu.wattage >= neededWatt)
        .fold<PowerSupply?>(null, (previous, next) {
      if (previous == null) return next;
      return next.price < previous.price ? next : previous;
    });
    if (currentPsu == null) return candidate;
    if (candidate != null && candidate.wattage > currentPsu.wattage) {
      return candidate;
    }
    return null;
  }

  Cpu _bestCpu() {
    return cpus.reduce((a, b) => a.coreCount > b.coreCount ? a : b);
  }

  Gpu _bestGpu() {
    return gpus.reduce((a, b) => a.memoryGb > b.memoryGb ? a : b);
  }

  Cpu _selectCpu(int minCores) {
    final candidates = cpus.where((cpu) => cpu.coreCount >= minCores).toList();
    if (candidates.isEmpty) return cpus.first;
    candidates.sort((a, b) => a.price.compareTo(b.price));
    return candidates.first;
  }

  Gpu _selectGpu(int minMemory, int minMemoryPreferred) {
    final candidates =
        gpus.where((gpu) => gpu.memoryGb >= minMemoryPreferred).toList();
    if (candidates.isEmpty) {
      final fallback = gpus.where((gpu) => gpu.memoryGb >= minMemory).toList();
      return fallback.isNotEmpty ? fallback.first : gpus.first;
    }
    candidates.sort((a, b) => a.price.compareTo(b.price));
    return candidates.first;
  }

  Ram _selectRam(int minCapacity) {
    final candidates =
        rams.where((ram) => ram.capacityGb >= minCapacity).toList();
    if (candidates.isEmpty) return rams.first;
    candidates.sort((a, b) => a.price.compareTo(b.price));
    return candidates.first;
  }

  Motherboard _selectMotherboardForCpu(Cpu cpu) {
    final candidates = motherboards
        .where((mb) => mb.socket == cpu.compatibility.socket)
        .toList();
    if (candidates.isEmpty) return motherboards.first;
    candidates.sort((a, b) => a.price.compareTo(b.price));
    return candidates.first;
  }

  PowerSupply _selectPowerSupplyForBuild(Cpu cpu, Gpu gpu, bool premium) {
    final needed = cpu.tdpWatts + gpu.tdpWatts + 150;
    final candidates =
        powerSupplies.where((psu) => psu.wattage >= needed).toList();
    if (candidates.isEmpty) return powerSupplies.first;
    candidates.sort((a, b) =>
        premium ? a.price.compareTo(b.price) : a.price.compareTo(b.price));
    return candidates.first;
  }

  PcCase _selectCaseForGpu(Gpu gpu) {
    final candidates =
        cases.where((pcCase) => pcCase.maxGpuLengthMm >= gpu.lengthMm).toList();
    if (candidates.isEmpty) return cases.first;
    candidates.sort((a, b) => a.price.compareTo(b.price));
    return candidates.first;
  }

  Storage _selectStorage() {
    final candidates = storages.toList();
    candidates.sort((a, b) => a.price.compareTo(b.price));
    return candidates.first;
  }

  SimulatorDevice? _findSimulator(String type) {
    if (simulatorDevices.isEmpty) {
      return null;
    }
    return simulatorDevices.firstWhere(
      (device) => device.deviceType == type,
      orElse: () => simulatorDevices.first,
    );
  }

  List<Map<String, dynamic>> _buildWaterCoolingKit(Cpu cpu) {
    final items = <Map<String, dynamic>>[];

    final block = waterCoolingParts.whereType<WaterBlock>().firstWhere(
          (part) => part.supportedSockets.contains(cpu.compatibility.socket),
          orElse: () => waterCoolingParts.whereType<WaterBlock>().first,
        );
    final radiator = waterCoolingParts
        .whereType<Radiator>()
        .reduce((a, b) => a.price < b.price ? a : b);
    final pump = waterCoolingParts
        .whereType<Pump>()
        .reduce((a, b) => a.price < b.price ? a : b);
    final reservoir = waterCoolingParts
        .whereType<Reservoir>()
        .reduce((a, b) => a.price < b.price ? a : b);
    final tube = waterCoolingParts
        .whereType<Tube>()
        .reduce((a, b) => a.price < b.price ? a : b);
    final fitting = waterCoolingParts
        .whereType<Fitting>()
        .reduce((a, b) => a.price < b.price ? a : b);
    final coolant = coolants.reduce((a, b) => a.price < b.price ? a : b);

    items.add({'component': 'WaterBlock', 'item': block.toJson()});
    items.add({'component': 'Radiator', 'item': radiator.toJson()});
    items.add({'component': 'Pump', 'item': pump.toJson()});
    items.add({'component': 'Reservoir', 'item': reservoir.toJson()});
    items.add({'component': 'Tube', 'item': tube.toJson()});
    items.add({'component': 'Fitting', 'item': fitting.toJson()});
    items.add({'component': 'Coolant', 'item': coolant.toJson()});

    return items;
  }

  Future<List<BuildEstimate>> getCustomBuildEstimateFromNaturalLanguage(
      String userRequest) async {
    final prompt = _buildAiPrompt(userRequest);
    final aiResponse = await _callAiApi(prompt);
    final aiBuildRequest = _parseAiBuildRequest(aiResponse);
    final useCase = aiBuildRequest.equipment.isNotEmpty
        ? '${aiBuildRequest.targetUsage} ${aiBuildRequest.equipment.join(' ')}'
        : aiBuildRequest.targetUsage;
    final estimates =
        getCustomBuildEstimate(aiBuildRequest.budget, useCase.trim());
    for (final estimate in estimates) {
      estimate.notes.add('요청 스타일: ${aiBuildRequest.style}');
      if (aiBuildRequest.notes.isNotEmpty) {
        estimate.notes.add('AI 분석 노트: ${aiBuildRequest.notes}');
      }
    }
    return estimates;
  }

  String _buildAiPrompt(String userRequest) {
    return '''당신은 PC 빌드 및 커스터마이징 전문가입니다.
사용자 요청 문장을 분석하여 다음 JSON 형식으로 응답하세요.

출력 형식:
{
  "targetUsage": "레이싱 게임 상옵", 
  "budget": 2500000,
  "equipment": ["레이싱 콕핏", "커스텀 수랭"],
  "style": "초록색 불빛",
  "notes": "추가 요구 사항이나 기대 성능을 간단히 기술"
}

규칙:
1. 사용자가 요청한 성능/용도, 장비 종류, 예산, 스타일 등을 최대한 구조화합니다.
2. 예산이 명시되지 않으면 합리적인 기본 예산(약 2500000원)을 설정합니다.
3. 출력은 반드시 JSON 객체만 포함해야 하며, 추가 설명은 포함하지 않습니다.
4. "equipment" 배열에는 요청에 해당하는 장비 카테고리를 넣습니다. 예: 레이싱 콕핏, VR 헤드셋, 플라이트 스틱, 커스텀 수랭.
5. "style"에는 디자인/조명/테마과 같은 시각적 요구를 넣습니다.

사용자 문장: "$userRequest"
''';
  }

  Future<String> _callAiApi(String prompt) async {
    if (openAiApiKey.isEmpty) {
      throw StateError('OpenAI API 키가 비어 있습니다. 생성자에 유효한 API 키를 전달하세요.');
    }

    final uri = Uri.parse('https://api.openai.com/v1/chat/completions');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $openAiApiKey',
    };
    final body = jsonEncode({
      'model': 'gpt-4.1-mini',
      'messages': [
        {'role': 'system', 'content': 'You are an expert PC build assistant.'},
        {'role': 'user', 'content': prompt}
      ],
      'temperature': 0.2,
      'max_tokens': 800,
    });

    final response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode != 200) {
      throw Exception(
          'AI API 호출 오류: ${response.statusCode} - ${response.body}');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final choices = decoded['choices'] as List<dynamic>?;
    if (choices == null || choices.isEmpty) {
      throw FormatException('AI 응답에 choices가 없습니다.');
    }
    final message = choices.first['message'] as Map<String, dynamic>?;
    if (message == null) {
      throw FormatException('AI 응답 메시지 형식이 올바르지 않습니다.');
    }
    return message['content'] as String;
  }

  AiBuildRequest _parseAiBuildRequest(String jsonString) {
    final cleanJson = _extractJson(jsonString);
    final decoded = jsonDecode(cleanJson) as Map<String, dynamic>;
    return AiBuildRequest.fromJson(decoded);
  }

  String _extractJson(String text) {
    final start = text.indexOf('{');
    final end = text.lastIndexOf('}');
    if (start >= 0 && end > start) {
      return text.substring(start, end + 1);
    }
    return text;
  }
}

class AiBuildRequest {
  final String targetUsage;
  final double budget;
  final List<String> equipment;
  final String style;
  final String notes;

  AiBuildRequest({
    required this.targetUsage,
    required this.budget,
    required this.equipment,
    required this.style,
    required this.notes,
  });

  factory AiBuildRequest.fromJson(Map<String, dynamic> json) {
    return AiBuildRequest(
      targetUsage: json['targetUsage'] as String? ?? '',
      budget: (json['budget'] as num?)?.toDouble() ?? 2500000.0,
      equipment: json['equipment'] != null
          ? List<String>.from(json['equipment'] as List<dynamic>)
          : <String>[],
      style: json['style'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
    );
  }
}

// -------------------------
// Integration service skeletons
// -------------------------

/// Payment service skeleton for integrating with Korean PGs (TossPayments, KakaoPay, etc.)
///
/// This class provides dummy methods and TODO comments that an external developer
/// can replace with real server-side integration. Important notes are included:
/// - PG 연동은 민감 정보(merchant key, secret)를 서버에서 안전하게 처리해야 합니다.
/// - 클라이언트는 결제 창 호출 또는 결제 토큰 요청만 수행하고, 결제 검증은 백엔드에서 수행하세요.
class PaymentResult {
  final bool success;
  final String message;
  final String? transactionId;

  PaymentResult({required this.success, required this.message, this.transactionId});
}

class PaymentService {
  // TODO: Replace with secure server endpoints and remove direct client-side API calls.

  /// Initiates a payment process for the given method.
  /// method: one of 'card', 'toss', 'kakaopay', 'bank_transfer', etc.
  /// amount: amount in KRW
  /// metadata: arbitrary map for order id, user id, estimate id, etc.
  static Future<PaymentResult> initiatePayment(
      {required String method,
      required int amount,
      Map<String, dynamic>? metadata}) async {
    // Dummy implementation: simulate network latency and return a fake success.
    await Future.delayed(const Duration(seconds: 1));

    // TODO: IMPLEMENTATION GUIDE
    // 1) Create an order record in your backend with state=CREATED and a secure server-side order id.
    // 2) Call the PG provider's server API from your backend (not from the client) to create a payment session.
    //    - TossPayments: POST /v2/payments with merchant key (server-side)
    //    - KakaoPay: POST /v1/payment/ready with admin key (server-side)
    // 3) Backend returns a redirect URL or payment token to the client.
    // 4) Client opens the provider's payment page (webview or external) or invokes native SDK.
    // 5) After payment, PG redirects to your backend webhook/callback URL; backend verifies signature and updates order state.
    // 6) Backend notifies client (websocket/polling) or returns final status.

    return PaymentResult(
        success: true,
        message: '결제 모의 실행 완료 (클라이언트 시뮬레이션)',
        transactionId: 'tx_demo_${DateTime.now().millisecondsSinceEpoch}');
  }

  /// Verifies payment on the backend. In production this should call your server endpoint
  /// which validates the PG signature/webhook payload and returns canonical status.
  static Future<bool> verifyPaymentOnServer(String transactionId) async {
    // Dummy: always true after delay
    await Future.delayed(const Duration(milliseconds: 600));
    // TODO: Call your server: POST /payments/verify { transactionId }
    return true;
  }
}

/// Authentication and DB integration skeleton using Firebase (recommended for quick setup)
///
/// TODO guide for external devs:
/// - Add Firebase packages: `firebase_core`, `firebase_auth`, `cloud_firestore`.
/// - Initialize Firebase in `main()` with `WidgetsFlutterBinding.ensureInitialized()` and `Firebase.initializeApp()`.
/// - Use secure rules in Firestore and set up indexes for query performance.
class AuthService {
  // TODO: Replace demo methods with real `firebase_auth` usage.

  /// Initializes Firebase SDKs. Call from app startup.
  static Future<void> initialize() async {
    // Ensure Flutter bindings are initialized before calling this from `main()`.
    try {
      await Firebase.initializeApp();
      // If you use FlutterFire CLI, use:
      // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    } catch (e) {
      // If initialization fails, the integrator should verify Firebase configuration files.
      rethrow;
    }
  }

  /// Signs in with email/password. Implement using `FirebaseAuth.instance.signInWithEmailAndPassword`.
  static Future<String?> signInWithEmail(String email, String password) async {
    try {
      final cred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return cred.user?.uid;
    } catch (e) {
      // In production, map errors to user-friendly messages.
      return null;
    }
  }

  /// Signs up a new user using email/password.
  static Future<String?> signUpWithEmail(String email, String password) async {
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user?.uid;
    } catch (e) {
      return null;
    }
  }

  /// Signs out current user.
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /// Saves an estimate under the user's document in the DB.
  /// Example Firestore schema:
  /// users/{uid}/estimates/{estimateId} -> { parts: [...], totalPrice: 123456, createdAt: Timestamp }
  static Future<void> saveEstimateForUser(
      {required String uid, required Map<String, dynamic> estimate}) async {
    final coll = FirebaseFirestore.instance.collection('users').doc(uid).collection('estimates');
    await coll.add({...estimate, 'createdAt': FieldValue.serverTimestamp()});
  }

  /// Fetches saved estimates for a user.
  static Future<List<Map<String, dynamic>>> fetchEstimatesForUser(String uid) async {
    final coll = FirebaseFirestore.instance.collection('users').doc(uid).collection('estimates');
    final snap = await coll.orderBy('createdAt', descending: true).limit(100).get();
    return snap.docs.map((d) => {...d.data(), 'id': d.id}).toList().cast<Map<String, dynamic>>();
  }
}

/// Admin service skeleton for backend product CRUD operations.
/// This is a client-side SDK-style wrapper that should call your secure backend admin APIs.
/// Backend responsibilities:
/// - Authenticate admin users (JWT or Firebase custom claims)
/// - Validate and sanitize input
/// - Persist product data in a database with versioning/audit logs
class AdminService {
  // Base URL for admin API. Change to your server address. For Android emulator use 10.0.2.2
  static String baseUrl = const String.fromEnvironment('ADMIN_BASE_URL', defaultValue: 'http://10.0.2.2:4000');
  // Admin token for demo usage. In production, store securely (do not hardcode).
  static String? adminToken;
  
  /// Logs in admin and stores JWT token for subsequent admin calls.
  static Future<bool> loginAdmin({required String email, required String password}) async {
    final uri = Uri.parse('$baseUrl/admin/login');
    final resp = await http.post(uri, headers: {'Content-Type': 'application/json'}, body: jsonEncode({'email': email, 'password': password}));
    if (resp.statusCode == 200) {
      final decoded = jsonDecode(resp.body) as Map<String, dynamic>;
      adminToken = decoded['token'] as String?;
      return true;
    }
    return false;
  }
  /// Creates a new product/part entry. In production call your admin backend with authentication.
  static Future<Map<String, dynamic>> createPart(Map<String, dynamic> partData) async {
    final uri = Uri.parse('$baseUrl/admin/parts');
    final headers = <String, String>{'Content-Type': 'application/json'};
    if (adminToken != null) headers['x-admin-token'] = adminToken!;
    final resp = await http.post(uri, headers: headers, body: jsonEncode(partData));
    if (resp.statusCode == 200) return jsonDecode(resp.body) as Map<String, dynamic>;
    throw Exception('createPart failed ${resp.statusCode} ${resp.body}');
  }

  /// Updates an existing part by id.
  static Future<bool> updatePart(String id, Map<String, dynamic> updates) async {
    final uri = Uri.parse('$baseUrl/admin/parts/$id');
    final headers = <String, String>{'Content-Type': 'application/json'};
    if (adminToken != null) headers['x-admin-token'] = adminToken!;
    final resp = await http.put(uri, headers: headers, body: jsonEncode(updates));
    return resp.statusCode == 200;
  }

  /// Deletes a part by id.
  static Future<bool> deletePart(String id) async {
    final uri = Uri.parse('$baseUrl/admin/parts/$id');
    final headers = <String, String>{};
    if (adminToken != null) headers['x-admin-token'] = adminToken!;
    final resp = await http.delete(uri, headers: headers);
    return resp.statusCode == 200;
  }

  /// Lists parts with optional filters and pagination. Should call backend admin list endpoint.
  static Future<List<Map<String, dynamic>>> listParts({int limit = 50, int offset = 0}) async {
    final uri = Uri.parse('$baseUrl/admin/parts?limit=$limit&offset=$offset');
    final headers = <String, String>{};
    if (adminToken != null) headers['x-admin-token'] = adminToken!;
    final resp = await http.get(uri, headers: headers);
    if (resp.statusCode == 200) {
      final decoded = jsonDecode(resp.body) as List<dynamic>;
      return decoded.cast<Map<String, dynamic>>();
    }
    throw Exception('listParts failed ${resp.statusCode} ${resp.body}');
  }
}

void main() async {
  final service = PCBackendService(
    cpus: [
      Cpu(
        id: 'cpu-01',
        name: 'Demo CPU',
        manufacturer: 'DemoCorp',
        baseClockGhz: 3.5,
        boostClockGhz: 4.5,
        coreCount: 6,
        threadCount: 12,
        tdpWatts: 95,
        integratedGraphics: false,
        price: 300000.0,
        compatibility: CompatibilityInfo(
            socket: 'AM4', chipset: 'X570', memoryType: 'DDR4'),
      ),
    ],
    gpus: [
      Gpu(
        id: 'gpu-01',
        name: 'Demo GPU',
        manufacturer: 'DemoCorp',
        memoryGb: 8,
        memoryType: 'GDDR6',
        tdpWatts: 180,
        lengthMm: 280,
        powerConnectors: ['PCIe 8-pin'],
        price: 500000.0,
        compatibility: CompatibilityInfo(pcieVersion: '4.0'),
      ),
    ],
    rams: [
      Ram(
        id: 'ram-01',
        name: 'Demo RAM',
        manufacturer: 'DemoCorp',
        capacityGb: 16,
        type: 'DDR4',
        speedMhz: 3200,
        modules: 2,
        voltage: 1.35,
        ecc: false,
        price: 120000.0,
        compatibility: CompatibilityInfo(memoryType: 'DDR4'),
      ),
    ],
    motherboards: [
      Motherboard(
        id: 'mb-01',
        name: 'Demo Board',
        manufacturer: 'DemoCorp',
        chipset: 'X570',
        socket: 'AM4',
        formFactor: 'ATX',
        memorySlots: 4,
        maxMemoryGb: 128,
        supportedMemoryType: 'DDR4',
        pciExpressVersion: '4.0',
        storageInterfaces: ['M.2', 'SATA'],
        powerConnectors: ['24-pin', '8-pin'],
        price: 220000.0,
        compatibility: CompatibilityInfo(
            socket: 'AM4',
            chipset: 'X570',
            memoryType: 'DDR4',
            formFactor: 'ATX'),
      ),
    ],
    powerSupplies: [
      PowerSupply(
        id: 'psu-01',
        name: 'Demo PSU',
        manufacturer: 'DemoCorp',
        wattage: 650,
        efficiencyRating: '80 Plus Gold',
        modular: true,
        connectors: ['24-pin', '8-pin', 'PCIe 8-pin'],
        price: 130000.0,
        compatibility:
            CompatibilityInfo(powerConnectors: ['24-pin', 'PCIe 8-pin']),
      ),
    ],
    cases: [
      PcCase(
        id: 'case-01',
        name: 'Demo Case',
        manufacturer: 'DemoCorp',
        formFactor: 'ATX',
        maxGpuLengthMm: 320,
        maxCoolerHeightMm: 165,
        frontPanelUsb: ['USB 3.0', 'USB-C'],
        price: 100000.0,
      ),
    ],
    storages: [
      Storage(
        id: 'storage-01',
        name: 'Demo SSD',
        manufacturer: 'DemoCorp',
        type: 'NVMe',
        capacityGb: 1000,
        interfaceType: 'PCIe 4.0',
        formFactor: 'M.2',
        price: 140000.0,
      ),
    ],
    simulatorDevices: [
      Cockpit(
        id: 'sim-01',
        name: 'Demo Cockpit',
        manufacturer: 'DemoCorp',
        price: 450000.0,
        compatibility: CompatibilityInfo(),
        adjustableSeat: true,
        supportsWheelMount: true,
      ),
    ],
    waterCoolingParts: [
      WaterBlock(
        id: 'wc-block-01',
        name: 'Demo WaterBlock',
        manufacturer: 'DemoCorp',
        material: 'Copper',
        price: 120000.0,
        compatibility: CompatibilityInfo(),
        supportedSockets: ['AM4'],
        maxFlowRateLpm: 80.0,
      ),
      Radiator(
        id: 'wc-rad-01',
        name: 'Demo Radiator',
        manufacturer: 'DemoCorp',
        material: 'Aluminum',
        price: 90000.0,
        compatibility: CompatibilityInfo(),
        widthMm: 120,
        heightMm: 275,
        thicknessMm: 30,
        fanCount: 3,
      ),
      Pump(
        id: 'wc-pump-01',
        name: 'Demo Pump',
        manufacturer: 'DemoCorp',
        material: 'Plastic',
        price: 70000.0,
        compatibility: CompatibilityInfo(),
        maxFlowRateLpm: 120.0,
        maxHeadM: 4.5,
        powerConnector: 'DC',
      ),
      Reservoir(
        id: 'wc-res-01',
        name: 'Demo Reservoir',
        manufacturer: 'DemoCorp',
        material: 'Acrylic',
        price: 45000.0,
        compatibility: CompatibilityInfo(),
        volumeMl: 500,
        mountType: 'Case Mount',
      ),
      Tube(
        id: 'wc-tube-01',
        name: 'Demo Tube',
        manufacturer: 'DemoCorp',
        material: 'PETG',
        price: 15000.0,
        compatibility: CompatibilityInfo(),
        innerDiameterMm: 10.0,
        outerDiameterMm: 13.0,
        lengthMm: 500,
      ),
      Fitting(
        id: 'wc-fit-01',
        name: 'Demo Fitting',
        manufacturer: 'DemoCorp',
        material: 'Brass',
        price: 12000.0,
        compatibility: CompatibilityInfo(),
        fittingSizeMm: '1/4"',
        type: '90 degree',
      ),
    ],
    coolants: [
      Coolant(
        id: 'wc-coolant-01',
        name: 'Demo Coolant',
        manufacturer: 'DemoCorp',
        color: 'Green',
        capacityMl: 1000,
        thermalConductivityWPerMK: 0.6,
        price: 25000.0,
        compatibility: CompatibilityInfo(),
      ),
    ],
    openAiApiKey:
        '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', // 실제 OpenAI API 키로 교체하세요.
  );

  try {
    final estimates = await service.getCustomBuildEstimateFromNaturalLanguage(
      '레이싱 게임 상옵으로 돌아가고 초록색 불빛 나오는 커스텀 수랭 PC 짜줘',
    );
    print('=== AI 기반 맞춤 견적 결과 ===');
    for (final estimate in estimates) {
      print('패키지: ${estimate.name}');
      print('총 예상 가격: ${estimate.totalPrice}원');
      print('노트: ${estimate.notes.join(', ')}');
      print('부품 목록: ${estimate.parts.map((p) => p['component']).toList()}');
      print('---');
    }
  } catch (e) {
    print('AI 요청 또는 견적 생성 중 오류가 발생했습니다: $e');
  }
}
