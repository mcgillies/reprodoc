library(testthat)
stopifnot(classify_penguin(40, 210) == "Gentoo")
expect_equal(classify_penguin(40, 210), "Gentoo")
expect_equal(classify_penguin(40, 200), "Adelle")
