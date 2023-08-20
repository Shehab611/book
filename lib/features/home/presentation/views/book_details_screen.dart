import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/components/texts.dart';
import 'package:book/features/home/presentation/components/image_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var x=ModalRoute.of(context)!.settings.arguments;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageItem(
                  height: screenSize.height * .42,
                  width: screenSize.width * .64,
                  imagePath:
                      'http://books.google.com/books/content?id=GsPDEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                ),
                const TextWidget(
                    aboveText: 'The Last Thing He Told Me',
                    bottomText: 'Ali Ahmed',
                    aboveTextAlign: TextAlign.center,
                    crossAxisAlignment: CrossAxisAlignment.center),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kDefaultColor.withOpacity(.2)),
                  child: Text(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.libreCaslonText(
                          color: kColor,
                          fontWeight: FontWeight.w700,
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium?.fontSize),
                      'This is an open access book. We are pleased to announce our 3rd International Conference on Bioinformatics and Data Science (ICBDS – 2022) and 9th International Conference on Public Mental Health and Neurosciences (ICPMN – 2022) which was a unique conference where we connectted Biological Function through Computational Genomics to the world of integrated medicine and therapeutics. Functional genomics is a field of molecular biology that attempts to describe gene (and protein) functions and interactions. This science aims to understand the complex relationship between genotype and phenotype on a global (genome-wide) scale of different biological processes. Most researchers now study genes or regions on a “genome-wide” scale (i.e. all or multiple genes/regions at the same time), with the hope of narrowing them down to a list of candidate genes or regions to analyze in more detail. There are several specific functional genomics approaches depending on what we are focused on DNA level (genomics and epigenomics), RNA level (transcriptomics)'),
                ),
                SizedBox(height:screenSize.height * .09 ,)
              ],
            ),
          ),
          Container(
            height: screenSize.height * .1,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: kDefaultColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 6.3,
                    ),
                    Text(
                      3.5.toString(),
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Opacity(
                      opacity: .5,
                      child: Text(
                        '(80)',
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: screenSize.width /2.5,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Preview Link',
                            style: GoogleFonts.libreCaslonText(
                                color: kColor,
                                fontSize:
                                    Theme.of(context).textTheme.bodyMedium?.fontSize),
                          )),
                    ),

                    SizedBox(
                      width: screenSize.width /2.5,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Save Book',
                            style: GoogleFonts.libreCaslonText(
                                color: kColor,
                                fontSize:
                                    Theme.of(context).textTheme.bodyMedium?.fontSize),
                          )),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
