import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/view/home/provider/home_provider.dart';
import 'package:shoppe/widgets/loading_indicator_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: products.loading
          ? Center(child: LoadingWidget())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15).r,
              child: Column(
                children: [
                  50.verticalSpace,
                  searchRow(context),
                  10.verticalSpace,
                  Expanded(
                    child: Consumer<HomeProvider>(
                      builder: (context, value, child) => GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.productCategory.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => Text(
                          value.productCategory[index] ?? "NO",
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget searchRow(BuildContext context) {
    return Row(
      children: [
        Text(
          "Shop",
          style: TextTheme.of(
            context,
          ).displaySmall?.copyWith(fontWeight: FontWeight.w500),
        ),
        25.horizontalSpace,
        Expanded(
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt_outlined, color: AppColor.primary),
              ),
              hintText: "Search here",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary),
                borderRadius: BorderRadius.circular(22).r,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 0,
              ).r,
              filled: true,
              fillColor: AppColor.smallBtnPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
