@default_files = ('document.tex');
$pdf_mode = 4;
$recorder = 1;
$lualatex = 'lualatex %O --shell-escape %S';
$out_dir = "./output";
$pdf_previewer = "zathura";

push @generated_exts, "cb", "cb2", "spl", "nav", "snm", "bbl";
push @generated_exts, "tdo", "nmo", "brf", "nlg", "nlo";
push @generated_exts, "nls", "auxlock", "synctex.gz", "run.xml";

# for nomenclature
add_cus_dep("nlo", "nls", 0, "nlo2nls");
sub nlo2nls {
    system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}
