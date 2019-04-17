library(DoE.multi.response)
context("Unique Factors")

#run test with "Ctrl/Cmd + Shift + T" or "devtools::test()"

x<-matrix(c(1,1,1,0,0,
            0,1,1,1,0,
            1,0,1,0,1,
            1,0,0,1,0), nrow = 4,byrow = TRUE)

ex1<-matrix(c(1,1,1,1,1,0,0,0,0,0,
              0,0,1,0,1,1,1,0,0,0,
              0,0,1,1,0,0,1,1,0,0,
              0,0,0,1,0,0,0,1,1,1), nrow = 4, byrow = TRUE)

ex2<-matrix(c(1,1,1,1,1,0,0,0,0,0,0,0,
              0,1,1,1,0,1,1,0,0,0,0,0,
              0,1,1,0,0,0,0,1,1,0,0,0,
              0,0,1,1,0,1,0,0,0,1,0,0,
              0,0,0,0,0,1,0,0,1,1,1,0,
              0,0,0,0,1,1,1,0,0,0,0,0,
              0,0,0,0,0,0,0,1,0,0,0,1), nrow = 7, byrow = TRUE)

ex3<-matrix(c(1,1,1,1,1,1,1,1,0,0,0,0,0,
              0,0,0,0,0,1,1,1,1,1,0,0,0,
              0,0,0,1,1,0,0,1,0,0,1,1,0,
              0,0,0,0,1,0,0,0,0,0,0,1,1,
              0,0,0,0,0,0,1,0,0,0,0,1,0), nrow = 5, byrow = TRUE)


test_that("unique factor list is correct", {
  expect_equal(ufactors(x),c(1,2,3,4,2))
  expect_equal(ufactors(ex1),c(1,2,3,4,5,1,2,1,2,3))
  expect_equal(ufactors(ex2),c(1,2,3,4,5,1,6,1,4,2,3,2))
  expect_equal(ufactors(ex3),c(1,2,3,4,5,6,7,8,1,2,1,2,1))
})
