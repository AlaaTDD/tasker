import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasker/bloc/subtask/subtask_cubit.dart';
import 'package:tasker/customs/custom_text_field.dart';
import 'package:tasker/customs/need_bloc.dart';
import 'package:tasker/helper/sizeandprecentfile.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../customs/constants.dart';
import '../../customs/custom_text.dart';
import '../../models/subtask_model.dart';
import '../../provider/confirm_task.dart';

class ConfirmTask extends StatelessWidget {
  DatumSub datumSub;
  ConfirmTask({super.key,required this.datumSub});
 TextEditingController note=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<SubtaskCubit,SubtaskState>(
     builder: (BuildContext context, state) {
     return CustomWidget(text: AppStringsDir.Approval(context),
      widget: Column(
       children: [
         buildHeader(context),
         const SizedBox(height: 80,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 40.0),
           child: CustomText(name: AppStringsDir.comments(context),
               fontWeight: FontWeight.w700,
               font: 16,
               color: ColorManager.blacktowhite(context).withOpacity(0.7),
               alignmentGeometry: AppStringsDir.rtl(context)),
         ),
         CustomTextFormFeldnote(textInputType: TextInputType.text,
             ii: 340,
             controller: note,
             line: 5,
             i: 10,
             color: ColorManager.blackColor,
             colorr: ColorManager.blackColor,
             isStwich: false),
         const SizedBox(height: 80,),
         Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               InkWell(
                 onTap: () {
                  SubtaskCubit.get(context).updatedata(datumSub.id, "rejection",[datumSub.description.first.toString(),note.text]);
                 },
                 child: CircleAvatar(
                   radius: 35,
                   backgroundColor: ColorManager.redColor,
                   child: Image.asset("assets/icons/close.png", height: 30,
                       color: ColorManager.whiteColor),
                 ),
               ),
               InkWell(
                 onTap: () {
                   SubtaskCubit.get(context).updatedata(datumSub.id, "approve",[datumSub.description.toString(),note.text]);

                 },
                 child: CircleAvatar(
                   radius: 35,
                   backgroundColor: ColorManager.greenColor,
                   child: Image.asset("assets/icons/Line 2.png",),
                 ),
               ),

             ]),
         const SizedBox(height: 30,),
       ],
     ));
   }, listener: (BuildContext context, Object? state) {
          if(state is updatetaskload){
            NeedBloc.showDelogTask(context, () {});
          }
          if(state is updatetasksucc){
            note.clear();
            navigatToback(context);
            navigatToback(context);
          }
          if(state is updatetasksucc2){
            navigatToback(context);
          }
   },);
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            )
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomText(name: datumSub.title,
                  fontWeight: FontWeight.w600,
                  font: 24,
                  color: ColorManager.blacktowhite(context).withOpacity(0.7),),
              ),
              const SizedBox(height: 40,),
              CustomText(name: AppStringsDir.Theattachedfile(context),
                  onPressed: () async {},
                  fontWeight: FontWeight.w600,
                  font: 15,
                  color: ColorManager.blacktowhite(context).withOpacity(0.7),
                  alignmentGeometry: AppStringsDir.rtl(context)),
              const SizedBox(height: 20,),
              BuildDownload(AppStringsDir.Download(context), context),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildDownload(String down, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:datumSub.fileUpload.length,
      itemBuilder: (BuildContext context, int index) {
        final v=Provider.of<Confirm>(context);
        return FutureBuilder(
            future: FileHelper.getFileSizeFromLink(
                "${AppStringsDir.urlbase}/subtasks/${datumSub.fileUpload[index]}"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Image.asset("assets/icons/pdf.png"),
                      SizedBox(width: 15,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextPoppins(name: "User-Journey.pdf",
                                    fontWeight: FontWeight.w600,
                                    font: 10,
                                    color: ColorManager.blacktowhite(context)
                                        .withOpacity(0.7),
                                    alignmentGeometry: Alignment.centerRight),
                                CustomTextPoppins(name: snapshot.data.toString(),
                                    fontWeight: FontWeight.w600,
                                    font: 10,
                                    color: ColorManager.blacktowhite(context)
                                        .withOpacity(0.7),
                                    alignmentGeometry: Alignment.centerRight),
                                CustomText(name: down,
                                    onPressed: () {
                                      Provider.of<Confirm>(context,listen: false).changeIndex(index);
                                      Provider.of<Confirm>(context,listen: false).downloadFile("${AppStringsDir
                                          .urlbase}/subtasks/${datumSub.fileUpload[index]}");
                                    },
                                    fontWeight: FontWeight.w600,
                                    font: 10,
                                    color: ColorManager.blacktowhite(context)
                                        .withOpacity(0.7),
                                    alignmentGeometry: Alignment.centerRight),
                              ],
                            ),
                            SizedBox(height: 10),
                            LinearProgressIndicator(
                              value: v.index==index? v.progres:0,
                              minHeight: 7,
                              backgroundColor: ColorManager.greenColor1
                                  .withOpacity(0.4),
                              color: ColorManager.greenColor1,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }
        );
      },);
  }
}

