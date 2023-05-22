import 'package:doctor_hunt/features/book_feature/presentation/view/widgets/slot_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/text_styles.dart';

class SlotList extends StatefulWidget {
  const SlotList({
    Key? key,
    required this.slots,
    required this.type,
    required this.selectedTime,
  }) : super(key: key);

  final List<String> slots;
  final String type;

  final void Function(String) selectedTime;

  @override
  State<SlotList> createState() => _SlotListState();
}

class _SlotListState extends State<SlotList> {
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${widget.type} ${widget.slots.length} slots',
            style: TextStyles.titleStyle18),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 20.h,
          child: widget.slots.isNotEmpty
              ? GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 1,
                  ),
                  itemCount: widget.slots.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: SlotItem(
                          time: widget.slots[index],
                          onTap: () {
                            setState(() {
                              if(selectedItem==index){
                                selectedItem=-1;
                                widget.selectedTime('');
                              }else{
                                selectedItem = index;
                                widget.selectedTime(widget.slots[index]);
                              }
                            });

                          },
                          backgroundColor: selectedItem == index
                              ? ColorManager.green
                              : ColorManager.green.withOpacity(0.1),
                          textColor: selectedItem == index
                              ? ColorManager.white
                              : ColorManager.green,
                        ),
                      ))
              : const Center(
                  child: Text('not available', style: TextStyles.titleStyle16),
                ),
        ),
      ],
    );
  }
}
