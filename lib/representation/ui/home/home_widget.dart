import 'package:carousel_slider/carousel_slider.dart';
import 'package:cotton_app/constant/global_variable.dart';
import 'package:cotton_app/data/model/product/product_modal.dart';
import 'package:cotton_app/data/services/home/home_services.dart';
import 'package:cotton_app/provider/user_provider.dart';
import 'package:cotton_app/representation/ui/detail/productDetail_page.dart';
import 'package:cotton_app/representation/ui/home/category_deals.dart';
import 'package:cotton_app/representation/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget AddressBox(BuildContext context) {
  final user = Provider.of<UserProvider>(context).user;

  return Container(
    height: 40,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 162, 236, 233),
        ],
        stops: [0.5, 1.0],
      ),
    ),
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Delivery to ${user.name} - ${user.address}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 5,
            top: 2,
          ),
          child: Icon(
            Icons.arrow_drop_down_outlined,
            size: 18,
          ),
        )
      ],
    ),
  );
}


Widget CarouselImage(BuildContext context) {
  return CarouselSlider(
    items: GlobalVariables.carouselImages.map(
          (i) {
        return Builder(
          builder: (BuildContext context) => Image.asset(
            i,
            fit: BoxFit.cover,
            height: 200,
            width: MediaQuery.sizeOf(context).width
          )

        );
      },
    ).toList(),
    options: CarouselOptions(
      viewportFraction: 1,
      height: 200,
    ),
  );
}

class DealOfDay extends StatefulWidget {
  const
  DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailPage.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
        ? const SizedBox()
        : GestureDetector(
      onTap: navigateToDetailScreen,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the day',
              style: TextStyle(fontSize: 20),
            ),
          ),
          
          

          // Container(
          //   padding: const EdgeInsets.only(left: 15),
          //   alignment: Alignment.topLeft,
          //   child: const Text(
          //     'Rs$product!.price[0]',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.topLeft,
          //   padding:
          //   const EdgeInsets.only(left: 15, top: 5, right: 40),
          //   child: const Text(
          //     'Yatmesh',
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //   ),
          // ),

          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              'See all deals',
              style: TextStyle(
                color: Colors.cyan[800],
              ),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 400,
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: product!.images
                        .map(
                          (e) => Image.network(
                        e,
                        fit: BoxFit.fitWidth,
                        width: 100,
                        height: 100,
                      ),
                    )
                        .toList(),
                  ),

                ],
              ),
            ),
          ),




        ],
      ),
    );
  }
}



class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: GlobalVariables.categoryImages.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToCategoryPage(
              context,
              GlobalVariables.categoryImages[index]['title']!,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}