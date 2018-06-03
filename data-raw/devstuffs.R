colin::fill_desc("handydandy", "Easy CSS Styling for Shiny",
                 "Object Oriented package,for easy css manipulation.", "handydandy")

colin::init_docs()
colin::new_r_file("dandy")

usethis::use_package("R6")
usethis::use_package("htmltools")

dir.create("readme-fig")
usethis::use_build_ignore("readme-fig")

usethis::use_test("R6")
