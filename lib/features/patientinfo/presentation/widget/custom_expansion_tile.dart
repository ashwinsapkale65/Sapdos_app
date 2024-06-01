import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/features/patientinfo/presentation/bloc/custom_expansion_tile_boc.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class CustomExpansionTile extends StatelessWidget {
  final Widget title;
  final Widget content;
  final CustomExpansionTileBloc bloc;
  final Icon icon;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.content,
    required this.bloc,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomExpansionTileBloc, CustomExpansionTileState>(
      bloc: bloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                bloc.toggleState();
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    icon,
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(child: title),
                    Icon(
                      state == CustomExpansionTileState.collapsed
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
              ),
            ),
            if (state == CustomExpansionTileState.expanded) content,
          ],
        );
      },
    );
  }
}
