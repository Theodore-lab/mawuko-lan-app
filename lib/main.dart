import 'package:flutter/material.dart';
import 'package:flutter_p2p_connection/flutter_p2p_connection.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MaterialApp(home: MawukoLAN()));

class MawukoLAN extends StatefulWidget {
  @override
  _MawukoLANState createState() => _MawukoLANState();
}

class _MawukoLANState extends State<MawukoLAN> {
  final _p2p = FlutterP2pConnection();
  List<DiscoveredPeers> peers = [];

  @override
  void initState() {
    super.initState();
    _askPermissions();
  }

  // Request hardware access for the "Invisible Cable"
  void _askPermissions() async {
    await [Permission.location, Permission.nearbyWifiDevices].request();
    await _p2p.initialize();
  }

  // The "Shouting" code - find other nodes in the air
  void _startDiscovery() {
    _p2p.discover();
    _p2p.streamPeers().listen((p) => setState(() => peers = p));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mawuko LAN Infrastructure")),
      body: Column(
        children:.deviceName),
                subtitle: Text("Hardware Address: ${peers[i].deviceAddress}"),
                onTap: () => _p2p.connect(peers[i].deviceAddress),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
