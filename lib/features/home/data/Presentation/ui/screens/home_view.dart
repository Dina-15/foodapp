import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/login_screen.dart';
import 'package:foodapp/utils/context_extension.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../core/common_widgets/custom_bottom_navigation_bar.dart';
import '../../../../../../core/common_widgets/custom_floating_action_button.dart';
import '../../../../../../core/common_widgets/items_grid_view.dart';
import '../../../../../../cubits/logout_cubit/logout_cubit.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
  static String id= 'HomeView';
   bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return BlocConsumer<LogoutCubit, LogoutStates>(
      listener:(context, state)
      {
        if(state is LogoutLoading) {
          isLoading = true;
        } else if(state is LogoutSuccess) {
          isLoading = false;
          context.showSnackBar('User Logged out Successfully!');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LogInScreen()));
        } else if(state is LogoutFailure) {
          isLoading = false;
          context.showSnackBar(state.message);
        }
      },
      builder:(context, state)=> ModalProgressHUD(
      inAsyncCall: isLoading,
      child:Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const SizedBox(height: 10,),
                const Text(
                  "Foodgo",
                  style: TextStyle(fontSize: 45, fontFamily: 'Lobster'),
                ),
                const Text(
                  "Order your favourite food!",
                  style: TextStyle(
                      color: Colors.grey, fontSize: 18, fontFamily: 'Poppins'),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 28,
                        )),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                  ),
                ),
                    const SizedBox(height: 20,)
              ]),
            ),
           ItemsGridView(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: const CustomFloatingActionButton(),
      bottomNavigationBar:  CustomBottomNavigationBar(email: email) ,
      ),)
    );
  }
}
