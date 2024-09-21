import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:truck_app/pages/home/body.dart';

import 'appbar.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final searchValue = useState('');

    final onSearchChanged = useCallback((val) {
      searchValue.value = val;
      print(val);
    }, [searchValue]);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(56.0),
                child: Appbar(
                  onSearchChanged: onSearchChanged,
                  searchValue: searchValue,
                )),
            body: Body()),
      ),
    );
  }
}
