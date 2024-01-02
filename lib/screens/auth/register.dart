// import 'package:flutter/material.dart';
// import 'package:flutter_praktek_dokter/widget/custom_dialog/custom_dialog.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:flutter_praktek_dokter/widget/custom_text_field/custom_text_field.dart';
// import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
// import 'package:flutter_praktek_dokter/widget/custom_drop_down.dart/custom_drop_down.dart';

// class RegisterScreen extends StatelessWidget {
//   RegisterScreen({super.key});

//   final RegisterHelper _registerHelper = Get.put(RegisterHelper());

//   @override
//   Widget build(BuildContext context) {
//     var steps = [
//       Step(
//         title: const Text("DataDiri"),
//         content: LayoutBuilder(builder: (context, constraints) {
//           double maxWidth =
//               constraints.maxWidth > 500 ? 500 : constraints.maxWidth * 0.8;
//           var constrained = BoxConstraints(
//             maxWidth:
//                 constraints.maxWidth > 500 ? 500 : constraints.maxWidth * 0.8,
//             minWidth:
//                 constraints.maxWidth > 500 ? 500 : constraints.maxWidth * 0.8,
//           );

//           return Obx(() => Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Center(
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Column(
//                           children: [
//                             CustomTextField(
//                               label: "NIK",
//                               constraints: constrained,
//                               onChanged: (value) =>
//                                   _registerHelper.setRegisterData(
//                                 "NIK",
//                                 _registerHelper.nikControler.text,
//                                 _registerHelper.nikControler.text.length == 16,
//                               ),
//                               controller: _registerHelper.nikControler,
//                               verification:
//                                   _registerHelper.nikVerification.value,
//                               errorText: "NIK harus Memiliki Panjang 16 Digit",
//                               type: TextInputType.number,
//                             ),
//                             const Gap(10.0),
//                             CustomTextField(
//                                 label: "Nama Lengkap",
//                                 constraints: constrained,
//                                 onChanged: (value) => {},
//                                 controller: _registerHelper.namaControler,
//                                 verification:
//                                     _registerHelper.namaVerification.value,
//                                 errorText: "Wajib Di Isi"),
//                           ],
//                         ),
//                         const Gap(10.0),
//                         Column(
//                           children: [
//                             CustomTextField(
//                               label: "Tempat Lahir",
//                               constraints: constrained,
//                               onChanged: (value) => {},
//                               controller: _registerHelper.tempatlahirControler,
//                               verification:
//                                   _registerHelper.tanggallairVerification.value,
//                               errorText: "Wajib Di Isi",
//                               type: TextInputType.datetime,
//                             ),
//                             const Gap(10.0),
//                             CustomTextField(
//                                 label: "Tanggal Lahir",
//                                 constraints: constrained,
//                                 onChanged: (value) => {},
//                                 controller:
//                                     _registerHelper.tanggallahirControler,
//                                 verification: _registerHelper
//                                     .tanggallairVerification.value,
//                                 errorText: "Wajib Di Isi"),
//                           ],
//                         ),
//                         const Gap(10.0),
//                         Column(
//                           children: [
//                             CustomDropDown(
//                               width: maxWidth,
//                               label: "Jenis Kelamin",
//                               list: const [
//                                 "Tidak Diketauhi",
//                                 "Laki-Laki",
//                                 "Perempuan",
//                                 "Tidak Dapat Ditentukan",
//                                 "Tidak Mengisi"
//                               ],
//                               controller: _registerHelper.jeniskelaminControler,
//                               verification: _registerHelper
//                                   .jeniskelaminVerification.value,
//                               errorText: "Wajib Di Isi",
//                             ),
//                             const Gap(10.0),
//                             CustomDropDown(
//                               width: maxWidth,
//                               label: "Agama",
//                               list: const [
//                                 "Buddha",
//                                 "Kristen(Protestan)",
//                                 "Katolik",
//                                 "Hindu",
//                                 "Konghucu",
//                                 "islam",
//                                 "Penghayat",
//                               ],
//                               controller: _registerHelper.agamaControler,
//                               verification:
//                                   _registerHelper.agamaVerification.value,
//                               errorText: "Wajib Di Isi",
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ));
//         }),
//       ),
//       Step(
//         title: const Text("Alamat Lengkap"),
//         content: LayoutBuilder(
//           builder: (context, constraints) {
//             var constrained = BoxConstraints(
//               maxWidth: constraints.maxWidth > constraints.maxWidth * 0.25
//                   ? constraints.maxWidth * 0.239
//                   : constraints.maxWidth * 0.8,
//               minWidth: constraints.maxWidth > constraints.maxWidth * 0.25
//                   ? constraints.maxWidth * 0.239
//                   : constraints.maxWidth * 0.8,
//             );
//             return Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Center(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Gap(10.0),
//                       Row(
//                         children: [
//                           CustomTextField(
//                               label: "RT(Rukun Tetangga)",
//                               constraints: constrained,
//                               onChanged: (value) => {},
//                               controller: _registerHelper.rtControler,
//                               verification:
//                                   _registerHelper.rtVerification.value,
//                               errorText: "Wajib Di Isi"),
//                           const Gap(10.0),
//                           CustomTextField(
//                               label: "RW(Rukun Warga)",
//                               constraints: constrained,
//                               onChanged: (value) => {},
//                               controller: _registerHelper.rwControler,
//                               verification:
//                                   _registerHelper.rwVerification.value,
//                               errorText: "Wajib Di Isi"),
//                           const Gap(10.0),
//                           CustomTextField(
//                               label: "Kelurahan/Desa",
//                               constraints: constrained,
//                               onChanged: (value) => {},
//                               controller: _registerHelper.desaControler,
//                               verification:
//                                   _registerHelper.desaVerification.value,
//                               errorText: "Wajib Di Isi"),
//                           const Gap(10.0),
//                           CustomTextField(
//                               label: "Kecamatan",
//                               constraints: constrained,
//                               onChanged: (value) => {},
//                               controller: _registerHelper.kecamatanControler,
//                               verification:
//                                   _registerHelper.kecamatanVerification.value,
//                               errorText: "Wajib Di Isi"),
//                         ],
//                       ),
//                       const Gap(10.0),
//                       Row(
//                         children: [
//                           CustomTextField(
//                               label: "Kota/Kabupaten",
//                               constraints: constrained,
//                               onChanged: (value) => {},
//                               controller: _registerHelper.kabupatenControler,
//                               verification:
//                                   _registerHelper.kabupatenVerification.value,
//                               errorText: "Wajib Di Isi"),
//                           const Gap(10.0),
//                           CustomTextField(
//                               label: "KodePos",
//                               constraints: constrained,
//                               onChanged: (value) => {},
//                               controller: _registerHelper.kodeposControler,
//                               verification:
//                                   _registerHelper.kodeposVerification.value,
//                               errorText: "Wajib Di Isi"),
//                           const Gap(10.0),
//                           CustomTextField(
//                               label: "Provinsi",
//                               constraints: constrained,
//                               onChanged: (value) => {},
//                               controller: _registerHelper.provinsiControler,
//                               verification:
//                                   _registerHelper.provinsiVerification.value,
//                               errorText: "Wajib Di Isi"),
//                           const Gap(10.0),
//                           CustomTextField(
//                               label: "Negara",
//                               constraints: constrained,
//                               onChanged: (value) => {},
//                               controller: _registerHelper.negaraControler,
//                               verification:
//                                   _registerHelper.negaraVerification.value,
//                               errorText: "Wajib Di Isi"),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       const Step(
//         title: Text(":v"),
//         content: TextField(
//           decoration: InputDecoration(
//             label: Text("3"),
//           ),
//         ),
//       )
//     ];
//     return Obx(() => Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Stepper(
//             type: StepperType.horizontal,
//             elevation: 0.0,
//             currentStep: _registerHelper.index.value,
//             onStepCancel: () =>
//                 _registerHelper.onStepCancel(_registerHelper.index.value),
//             onStepContinue: () => _registerHelper.onStepContinue(steps.length),
//             onStepTapped: (value) =>
//                 _registerHelper.onStepTapped(_registerHelper.index.value),
//             steps: steps,
//             controlsBuilder: (BuildContext context, ControlsDetails details) {
//               return Container(
//                 margin: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 child: Row(
//                   children: [
//                     details.currentStep < steps.length - 1
//                         ? FilledButton.icon(
//                             icon: const Icon(Icons.navigate_next_rounded),
//                             onPressed: details.onStepContinue,
//                             label: const Text('Next'),
//                             style: ButtonStyle(
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                               ),
//                             ),
//                           )
//                         : TextButton.icon(
//                             icon: const Icon(Icons.save),
//                             onPressed: details.onStepContinue,
//                             label: const Text('Submit'),
//                             style: ButtonStyle(
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                               ),
//                             ),
//                           ),
//                     const Gap(5.0),
//                     details.currentStep > 0
//                         ? TextButton(
//                             onPressed: details.onStepCancel,
//                             style: ButtonStyle(
//                               visualDensity: VisualDensity.comfortable,
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                               ),
//                             ),
//                             child: const Text('Cancel'),
//                           )
//                         : const Text(""),
//                     const Gap(5.0),
//                     OutlinedButton.icon(
//                       icon: const Icon(Icons.help),
//                       onPressed: () => Get.dialog(
//                         CustomDialog(
//                           title: "Help",
//                           content: const Text("Help"),
//                           actions: [
//                             TextButton(
//                                 onPressed: () {
//                                   Get.back();
//                                 },
//                                 child: const Text("Back"))
//                           ],
//                         ),
//                       ),
//                       label: const Text("Help"),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ));
//   }
// }
