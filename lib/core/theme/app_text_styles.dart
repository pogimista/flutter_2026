import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // --- Grid card ---
  static TextStyle get pokemonId => GoogleFonts.nunito(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.secondary,
      );

  static TextStyle get pokemonName => GoogleFonts.nunito(
        fontSize: 13,
        fontWeight: FontWeight.w700,
      );

  // --- Detail screen ---
  static TextStyle get detailId => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.secondary,
      );

  static TextStyle get detailName => GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get typeChip => GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 0.5,
      );

  static TextStyle get infoValue => GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get infoLabel => GoogleFonts.nunito(
        fontSize: 13,
        color: AppColors.secondary,
      );

  static TextStyle get sectionTitle => GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get statLabel => GoogleFonts.nunito(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.secondary,
      );

  static TextStyle get statValue => GoogleFonts.nunito(
        fontSize: 13,
        fontWeight: FontWeight.w700,
      );
}
