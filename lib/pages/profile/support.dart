import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/screen_size.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/widget/button.dart';
import 'package:tezda/widget/navigation_box.dart';
import 'package:tezda/widget/textform.dart';

class Support extends StatelessWidget {
  const Support({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController complain = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: Row(
          children: [
            NavigationBox(onTap: () => Navigator.pop(context)),
            const SizedBox(width: 20),
            Text(
              'Support',
              style: style.copyWith(
                fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 30,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),

            Text(
              'We really look forward to hearing from you and answering your questions.',
              style: style.copyWith(color: AppColor.darkGrey, fontSize: 15),
            ),
            SizedBox(height: SizeConfig(context).deviceWidth * 0.12),

            RichText(
              text: TextSpan(
                text: 'Full Name',
                style: style.copyWith(
                  color: AppColor.darkGrey,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(text: '*', style: style.copyWith(color: Colors.red))
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
                width: SizeConfig(context).deviceWidth,
                child: MyTextForm(
                  controller: name,
                  obscureText: false,
                  labelText: 'John Doe',
                  onChanged: (p0) {},
                )),

            // Email
            SizedBox(
              height: SizeConfig(context).deviceHeight * 0.02,
            ),

            RichText(
              text: TextSpan(
                text: 'Email Address',
                style: style.copyWith(
                  color: AppColor.darkGrey,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: '*',
                    style: style.copyWith(color: Colors.red),
                  )
                ],
              ),
            ),

            const SizedBox(height: 8),
            SizedBox(
                width: SizeConfig(context).deviceWidth,
                child: MyTextForm(
                  controller: email,
                  obscureText: false,
                  labelText: 'John@gmail.com',
                  onChanged: (p0) {},
                )),

            // Complaain
            SizedBox(
              height: SizeConfig(context).deviceHeight * 0.02,
            ),
            RichText(
              text: TextSpan(
                text: 'Message/Complaint',
                style: style.copyWith(
                  color: AppColor.darkGrey,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: '*',
                    style: style.copyWith(color: Colors.red),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
                width: SizeConfig(context).deviceWidth,
                child: MyTextForm(
                  controller: complain,
                  obscureText: false,
                  labelText: 'Message/Complaint',
                  maxLine: 5,
                  onChanged: (p0) {},
                )),
            SizedBox(
              height: SizeConfig(context).deviceHeight * 0.08,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MainButton(
                borderColor: Colors.transparent,
                backgroundColor: AppColor.primaryColor,
                onTap: () {},
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
