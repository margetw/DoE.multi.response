library(DoE.multi.response)
context("Helper Functions")

#run test with "Ctrl/Cmd + Shift + T" or "devtools::test()"

x<-matrix(c(1,1,1,0,0,
            0,1,1,1,0,
            1,0,1,0,1,
            1,0,0,1,0), nrow = 4,byrow = TRUE)


test_that("checkuf returns a logical indicator of wheather an existing unique facor can be used",{
  expect_true(checkuf(x,c(0,0,1,0)))
  expect_true(checkuf(x,c(0,0,1,1)))
  expect_true(checkuf(x,c(0,0,0,1)))
  expect_true(checkuf(x,c(0,1,0,0)))
  expect_true(checkuf(x[,1:4],x[,5]))
  expect_false(checkuf(x[,1],x[,2]))
  expect_false(checkuf(x[,1:2],x[,3]))
  expect_false(checkuf(x[,1:3],x[,4]))
})

test_that("minwhichuf returns minimum available existing unique factors that can been assigned", {
  expect_equal(minwhichuf(x,c(0,0,1,0)),2)
  expect_equal(minwhichuf(x,c(0,0,1,1)),2)
  expect_equal(minwhichuf(x,c(0,0,0,1)),2)
  expect_equal(minwhichuf(x,c(1,0,1,0)),4)
  expect_equal(minwhichuf(x,c(0,1,0,0)),1)
  expect_equal(minwhichuf(x[,2],c(0,0,1,0)),1)
  expect_equal(minwhichuf(x[,1:4],x[,5]),2)
})

x5to2<-matrix(c(1,1,1,0,
                0,1,1,1,
                1,1,1,0,
                1,0,0,1), nrow = 4,byrow = TRUE)


x5to4<-matrix(c(1,1,1,0,
                0,1,1,1,
                1,0,1,1,
                1,0,0,1), nrow = 4,byrow = TRUE)


test_that("addtouf adds a factor to a unique factor", {
  expect_equal(addtouf(x[,1:4],x[,5],2),x5to2)
  expect_equal(addtouf(x[,1:4],x[,5],4),x5to4)
  expect_equal(addtouf(c(1,0,0,1),c(0,1,0,0),1),c(1,1,0,1))
  expect_equal(addtouf(c(0,0,1,0),c(1,0,0,0),1),c(1,0,1,0))
})
