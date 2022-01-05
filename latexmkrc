#=======================================================================
#     latexmkrc
#
#     Configuration file for LaTeX compilation using Latexmk.
#
#     This is a configuration file for Latexmk v4.51 or later.
#     Copyright 2022 Tom M. Ragonneau.
#=======================================================================

# Generate pdf using xelatex
$pdf_mode = 5;
$postscript_mode = 0;
$dvi_mode = 0;

# Remove extra extensions on clean
$clean_ext = "bbl run.xml xdv";
