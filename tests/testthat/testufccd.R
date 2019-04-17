library(DoE.multi.response)
context("UF - CCD")

x<-matrix(c(1,1,1,0,0,
            0,1,1,1,0,
            1,0,1,0,1,
            1,0,0,1,0), nrow = 4,byrow = TRUE)
ufccdx<-ufccd(x)

test_that("correct number of axial points", {
  expect_equal(sum(ufccdx[,-1]>1)  ,5)
  expect_equal(sum(ufccdx[,-1]< -1),5)
  expect_equal(sum(ufccdx[,2]>1)   ,1)
  expect_equal(sum(ufccdx[,2]< -1) ,1)
})

test_that("correct number of cube points", {
  expect_equal(sum(ufccdx[,-1]==1)  ,40)
  expect_equal(sum(ufccdx[,-1]== -1),40)
  expect_equal(sum(ufccdx[,2]==1)   ,8)
  expect_equal(sum(ufccdx[,2]== -1) ,8)
})


test_that("correct aliasing", {
  expect_equal(ufccdx$X2  ,ufccdx$X5)
})
