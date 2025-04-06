import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/model/hadeth_model.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  HadethItem({super.key, required this.index});
  int index;

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      decoration: BoxDecoration(
        color: AppColors.primarycolor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(AppAssets.hadethBgCard))
      ),
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.blackBgColor,
              ),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.hadethBglet,
                      width: width * 0.15,
                    ),
                    Expanded(
                        child: Text(
                      hadeth?.title ?? "",
                      style: AppStyles.bold24Black,
                      textAlign: TextAlign.center,
                    )),
                    Image.asset(
                      AppAssets.hadethBgright,
                      width: width * 0.15,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth?.content ?? "",
                      style: AppStyles.bold16Black,
                    ),
                  ),
                ),
                Image.asset(AppAssets.hadethMosque),
              ],
            ),
    );
  }

  void loadHadethFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/Hadeeth/h$index.txt');
    int fileLinesIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    setState(() {});
  }
}
