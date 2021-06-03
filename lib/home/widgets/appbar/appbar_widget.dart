import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(200),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 161,
                    width: double.maxFinite,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: 'Olá, ',
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                  text: 'Glauco',
                                  style: AppTextStyles.titleBold,
                                )
                              ]),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://scontent.fpoo2-1.fna.fbcdn.net/v/t1.6435-9/58600086_2188791984541189_4677879156745175040_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeFxtISFL1NmANkWjF6L6-46fuXoLayFejd-5egtrIV6Nx2tFtkQ-elTFJvXtaytvbej20a7YwcIlEnQGA6kAcId&_nc_ohc=ucK4ez1pjfsAX90haOS&tn=f9gPHuDjcE_rIkYN&_nc_ht=scontent.fpoo2-1.fna&oh=fa9c867081bf22d3208830dd6b147a1c&oe=60DC1FC3',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment(0.0, 1.0), child: ScoreCardWidget())
                ],
              ),
            ));
}
