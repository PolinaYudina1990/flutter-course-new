import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_app_course/task-11/data.dart';
import 'package:flutter_app_course/task-11/product_entity.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import '../strings/assets_strings.dart';
import '../strings/colors.dart';
import '../strings/fonts.dart';
import '../strings/strings.dart';

List<ProductEntity> sortedList = List.from(dataForStudents);
SortList _sortList = SortList.none;

enum SortList {
  none,
  sortTitle,
  sortTitleReverced,
  sortPrice,
  sortPriceReverced,
  sortType,
  sortTypeReverced
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

bool isLoading = true;

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 3;

  final _controller = PageController(
    initialPage: 3,
  );

  loadData() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  initState() {
    loadData();
    super.initState();
  }

  setSelectedRadioTile(SortList val) {
    setState(() {
      _sortList = val;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Stack(
              children: [
                Opacity(
                  opacity: 0.8,
                  child: ModalBarrier(dismissible: false, color: Colors.white),
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            )
          : PageView(
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              controller: _controller,
              children: const [
                CatalogScreen(),
                SearchScreen(),
                BasketScreen(),
                PersonalScreen(),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: AppTypography.fontForBottom
            .copyWith(color: AppColors.forSelectedGreen),
        unselectedLabelStyle: AppTypography.fontForBottom,
        unselectedItemColor: AppColors.forBottom,
        selectedItemColor: AppColors.forSelectedGreen,
        currentIndex: _currentIndex,
        onTap: (int index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: SvgIcon(icon: SvgIconData(AppAssets.article)),
            label: AppStrings.bottomAppBar1,
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(icon: SvgIconData(AppAssets.search)),
            label: AppStrings.bottomAppBar2,
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(icon: SvgIconData(AppAssets.mall)),
            label: AppStrings.bottomAppBar3,
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(icon: SvgIconData(AppAssets.personOutline)),
            label: AppStrings.bottomAppBar4,
          ),
        ],
      ),
    );
  }
}

void totalCosts() {
  var sumCosts = 0;
  dataForStudents.forEach((e) => sumCosts += e.price);
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.titleForEmptyScreen,
          style: AppTypography.fontForEmptyScreen),
    );
  }
}

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.titleForEmptyScreen,
          style: AppTypography.fontForEmptyScreen),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.titleForEmptyScreen,
          style: AppTypography.fontForEmptyScreen),
    );
  }
}

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: AppColors.forSelectedGreen),
          onPressed: () {},
        ),
        title: const Column(
          children: [
            Text(
              AppStrings.titleAppBar1Line,
              style: AppTypography.fontForTitle,
            ),
            Text(
              AppStrings.titleAppBar2Line,
              style: AppTypography.fontForSubtitleAppBar,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowWithFilter(context),
            listProducts(context),
            const SizedBox(
              height: 11,
            ),
            const Divider(),
            totalResult(),
          ],
        ),
      ),
    );
  }

// Строка с фильтром и вызов ModalBottomSheet
  Widget rowWithFilter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          AppStrings.rowList,
          style: AppTypography.fontForTitle,
        ),
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 3),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24.0)),
                    ),
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return const ModalBottomSheet();
                    }).whenComplete(() {
                  setState(() {});
                });
              },
              child: const Icon(Icons.sort_rounded,
                  size: 24, color: AppColors.darkGrey),
            ),
          ),
        ),
      ],
    );
  }

// Список продуктов
  Widget listProducts(BuildContext context) {
    Map<String, List<ProductEntity>> groupItemsByCategory(
        List<ProductEntity> items) {
      return groupBy<ProductEntity, String>(
          items, (item) => item.category.name);
    }

    Map<String, List<ProductEntity>> groupedItems =
        groupItemsByCategory(sortedList);

    return Expanded(
      child: _sortList != SortList.sortType &&
              _sortList != SortList.sortTypeReverced
          ? listBuilder(sortedList)
          : ListView.separated(
              physics: const ScrollPhysics(),
              itemCount: groupedItems.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                String category = groupedItems.keys.elementAt(index);
                List<ProductEntity> itemsInCategory = groupedItems[category]!;

                return Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 30.0),
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: double.infinity),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(category.toString(),
                            style: AppTypography.fontTitleCategory),
                        listBuilder(itemsInCategory),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}

Widget listBuilder(List<ProductEntity> list) {
  return ListView.builder(
    physics: const ScrollPhysics(),
    itemCount: list.length,
    shrinkWrap: true,
    itemBuilder: (
      BuildContext context,
      int index,
    ) {
      ProductEntity item = list[index];
      final price = (item.price / 100).ceil();
      final amount = item.amount.value;
      final amountToPrint =
          (amount / 1000).toString().replaceAll(RegExp(r'.0'), '');
      return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 30.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                height: 68,
                width: 68,
                item.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget image,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return image;
                  return SizedBox(
                    height: 68,
                    width: 68,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (_, __, ___) => Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    AppAssets.withoutPicture,
                    height: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: AppTypography.fontForListProduct),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                          item.amount is Grams
                              ? '$amountToPrint кг'
                              : '$amount шт',
                          style: AppTypography.fontForListProduct),
                      const Spacer(),
                      item.sale == 0
                          ? Text('$price' ' руб',
                              style: AppTypography.fontForListProduct
                                  .copyWith(fontWeight: FontWeight.w700))
                          : Row(
                              children: [
                                Text('$price' ' руб',
                                    style: AppTypography.fontForListProduct
                                        .copyWith(
                                            color: AppColors.lightGrey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                AppColors.lightGrey,
                                            fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 40,
                                ),
                                Text(
                                    '${((item.sale * price) / 100).ceil()}'
                                    ' руб',
                                    style: AppTypography.fontForListProduct
                                        .copyWith(
                                            color: AppColors.red,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

// Итоговые строки
Widget totalResult() {
  int sumCosts = 0;
  dataForStudents.forEach((e) => sumCosts += (e.price / 100).ceil());
  int sumSale = 0;
  dataForStudents
      .forEach((e) => sumSale += ((e.sale * e.price) / 10000).ceil());

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        textDirection: TextDirection.ltr,
        AppStrings.resultTitle,
        style: AppTypography.fontForResult,
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${dataForStudents.length} товаров',
              style: AppTypography.fontForListProduct),
          Text(
            '$sumCosts руб',
            style: AppTypography.fontForListProduct
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
      const SizedBox(
        height: 11,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              '${AppStrings.resultSale} ${(sumSale * 100 / sumCosts).ceil()} %',
              style: AppTypography.fontForListProduct),
          Text(
            '$sumSale руб',
            style: AppTypography.fontForListProduct
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
      const SizedBox(
        height: 11,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.resultTotSumTitle,
            style: AppTypography.fontForResult.copyWith(fontSize: 16),
          ),
          Text(
            '${(sumCosts - sumSale).round()} руб',
            style: AppTypography.fontForResult.copyWith(fontSize: 16),
          ),
        ],
      ),
    ],
  );
}

// ModalBottomSheet отдельным виджетом
class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    void filterList() {
      if (_sortList == SortList.none) {
        sortedList = List.from(dataForStudents);
      }
      if (_sortList == SortList.sortTitle) {
        sortedList.sort((a, b) => a.title.compareTo(b.title));
      }
      if (_sortList == SortList.sortTitleReverced) {
        sortedList.sort((a, b) => b.title.compareTo(a.title));
      }
      if (_sortList == SortList.sortPrice) {
        sortedList.sort((a, b) => a.price.compareTo(b.price));
      }
      if (_sortList == SortList.sortPriceReverced) {
        sortedList.sort((a, b) => b.price.compareTo(a.price));
      }
      if (_sortList == SortList.sortType) {
        sortedList.sort((a, b) => a.category.name.compareTo(b.category.name));
      }
      if (_sortList == SortList.sortTypeReverced) {
        sortedList.sort((a, b) => b.category.name.compareTo(a.category.name));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Row(
              children: [
                const Text(AppStrings.titleFilter,
                    style: AppTypography.fontTitleFilter),
                const Spacer(),
                IconButton(
                  iconSize: 24,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RadioListTile(
                  title: const Text(AppStrings.titleFilterWithoutSort),
                  activeColor: Colors.white,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  hoverColor: AppColors.forSelectedGreen,
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  value: SortList.none,
                  groupValue: _sortList,
                  onChanged: (SortList? value) {
                    setState(() {
                      _sortList = value!;
                    });
                  },
                ),
                const Divider(),
                const Text(AppStrings.mainTitleFilterName,
                    style: AppTypography.fontForListProduct),
                RadioListTile(
                  activeColor: Colors.white,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  hoverColor: AppColors.forSelectedGreen,
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  title: const Text(AppStrings.titleFilterFromAToZ),
                  value: SortList.sortTitle,
                  groupValue: _sortList,
                  onChanged: (SortList? value) {
                    setState(() {
                      _sortList = value!;
                    });
                  },
                ),
                RadioListTile(
                  activeColor: Colors.white,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  hoverColor: AppColors.forSelectedGreen,
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  title: const Text(AppStrings.titleFilterFromZToA),
                  value: SortList.sortTitleReverced,
                  groupValue: _sortList,
                  onChanged: (SortList? value) {
                    setState(() {
                      _sortList = value!;
                    });
                  },
                ),
                const Divider(),
                const Text(AppStrings.mainTitleFilterPrice,
                    style: AppTypography.fontForListProduct),
                RadioListTile(
                  activeColor: Colors.white,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  hoverColor: AppColors.forSelectedGreen,
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  title: const Text(AppStrings.titleFilterPrice),
                  value: SortList.sortPrice,
                  groupValue: _sortList,
                  onChanged: (SortList? value) {
                    setState(() {
                      _sortList = value!;
                    });
                  },
                ),
                RadioListTile(
                  activeColor: Colors.white,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  hoverColor: AppColors.forSelectedGreen,
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  title: const Text(AppStrings.titleFilterPriceRevert),
                  value: SortList.sortPriceReverced,
                  groupValue: _sortList,
                  onChanged: (SortList? value) {
                    setState(() {
                      _sortList = value!;
                    });
                  },
                ),
                const Divider(),
                const Text(AppStrings.mainTitleFilterType,
                    style: AppTypography.fontForListProduct),
                RadioListTile(
                  activeColor: Colors.white,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  hoverColor: AppColors.forSelectedGreen,
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  title: const Text(AppStrings.titleFilterType),
                  value: SortList.sortType,
                  groupValue: _sortList,
                  onChanged: (SortList? value) {
                    setState(() {
                      _sortList = value!;
                    });
                  },
                ),
                RadioListTile(
                  activeColor: Colors.white,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  hoverColor: AppColors.forSelectedGreen,
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.forSelectedGreen),
                  title: const Text(AppStrings.titleFilterTypeRevert),
                  value: SortList.sortTypeReverced,
                  groupValue: _sortList,
                  onChanged: (SortList? value) {
                    setState(() {
                      _sortList = value!;
                    });
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.forSelectedGreen),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(
                          color: AppColors.forSelectedGreen,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    filterList();
                  },
                  child: const Text(AppStrings.titleFilterButton,
                      style: AppTypography.fontButton),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
