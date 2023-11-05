import 'package:demo_products_apple/common/constans/colors.dart';
import 'package:demo_products_apple/features/home/widget/category_widget.dart';
import 'package:demo_products_apple/features/home/widget/panner_title.dart';
import 'package:demo_products_apple/features/home/widget/top_bar.dart';
import 'package:demo_products_apple/features/providers/tabs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(categoryProvider);
  }

  @override
  Widget build(BuildContext context) {
    final categoryProviderr = ref.watch(categoryProvider);
    final productsProvider = ref.watch(productProvider);
    final fillterNotiferr = ref.watch(fillterProvider.notifier);
    final fillterProviderr = ref.watch(fillterProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.firstDarkColor,
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // row top bar
              TopBar(),

              SizedBox(
                height: 18,
              ),
              // banner title
              // please mr.Mohammed optmize this widget
              BannerTitle(),

              SizedBox(
                height: 17,
              ),
              // list view to type product
              Container(
                height: 95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProviderr.length,
                  itemBuilder: ((context, index) {
                    return CategoryWidget(
                      categoryModel: categoryProviderr[index],
                      index: index,
                    );
                  }),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: fillterProviderr.values.isNotEmpty
                      ? fillterProviderr.values.first.length
                      : 0,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 120,
                      width: 120,
                      color: Colors.amber,
                      child: Text(
                        fillterProviderr.values.isNotEmpty
                            ? fillterProviderr.values.first[index].name
                            : 'null',
                        style: TextStyle(fontSize: 39),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
