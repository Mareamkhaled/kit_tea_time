import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/widgets/custom_box_shadow.dart';

class CatFactCard extends StatelessWidget {
  const CatFactCard({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [customBoxShadow()],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE5F9F7),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.auto_awesome,
                                  color: Color(0xFF00BFA5),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  text,
                                  style: AppStyle.lemon300Style12Grey.copyWith(
                                    color: AppColors.myBlack,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
  }
}