import 'package:alrwad/appCubit/app_cubit.dart';
import 'package:alrwad/appCubit/app_states.dart';
import 'package:alrwad/components/components.dart';
import 'package:alrwad/models/mainServicesModel/mainServicesModel.dart';
import 'package:alrwad/modules/contactUsScreen/contactUs.dart';
import 'package:alrwad/network/endpoints.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({Key? key, required this.serviceData})
      : super(key: key);
  final ServesData serviceData;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
        condition: state is! AppGetAboutUsDataLoadingState,
        fallback: (context) => const Center(child: CircularProgressIndicator()),
        builder: (context) => Scaffold(
          drawer: defaultDrawer(context),
          appBar: defaultAppBar(context, serviceData.name!, false),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 8,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      imagesLink + (serviceData.img!),
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          serviceData.details!,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'اذا احتاجت اي مساعدة يمكنك التواصل معنا',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultButton(
                            onPress: () {
                              navigateTo(context, ContactUsScreen());
                            },
                            text: 'تواصل معنا')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
