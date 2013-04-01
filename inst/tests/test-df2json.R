context("df2json")

test_that("df2json converts a data frame to JSON", {
    expect_equal("[{}]", df2json(data.frame()))
    expect_equal("[{\"x\":1}]", df2json(data.frame(x=1)))
    expect_equal("[{\"x\":1,\"y\":4},\n{\"x\":2,\"y\":5}]", df2json(data.frame(x=c(1,2), y=c(4,5))))
    expect_equal("[{\"x\":true,\"y\":4},\n{\"x\":false,\"y\":5}]", df2json(data.frame(x=c(TRUE,FALSE), y=c(4,5))))
    expect_equal("[{\"x\":\"a\",\"y\":4},\n{\"x\":\"b\",\"y\":5}]", df2json(data.frame(x=factor(c("a","b")), y=c(4,5))))
    expect_equal("[{\"x\":1,\"y\":\"don't\"},\n{\"x\":2,\"y\":\"a\"}]", df2json(data.frame(x=c(1,2), y=c("don't","a"))))
    expect_equal("[{\"x\":1,\"y\":null,\"z\":null},\n{\"x\":null,\"y\":null,\"z\":3}]", df2json(data.frame(x=c(1,-Inf), y=c(Inf,NaN), z=c(NA,3))))
})

test_that("matrix2json converts a matrix to JSON", {
    data <- matrix(1:9, byrow = TRUE, nrow=3)
    translated_data <- matrix2json(data)
    expect_equal(translated_data, "[[1,2,3],[4,5,6],[7,8,9]]")
})