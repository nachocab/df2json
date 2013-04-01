is.valid <- function(x){
    !is.na(x) & !is.nan(x) & !is.infinite(x)
}

quote_for_JSON <- function(element){
    paste0("\"", element, "\"")
}

translate_to_JSON <- function(value){
    if (!is.valid(value)){
        value <- "null"
    } else if (is.logical(value)){
        value <- if (value)  "true" else "false"
    } else if (is.character(value)){
        value <- quote_for_JSON(value)
    } else if (is.factor(value)){
        value <- quote_for_JSON(as.character(value))
    } else {
        # numeric, don't do anything
    }

    value
}

prepare_for_JSON <- function(data){
    data <- lapply(colnames(data), function(key){
        sapply(data[, key], function(value){
            key <- quote_for_JSON(key)
            value <- translate_to_JSON(value)
            paste0(key, ':', value)
        })
    })
    as.data.frame(data)
}


#' Convert a dataframe to JSON
#'
#'
#' @param df input dataframe object
#' @export
#' @examples library(df2json)
#' df <- data.frame(name=c("a", "b", "c"), x=c(NA, 2 ,3), y=c(10, 20, -Inf), show=c(TRUE, FALSE, TRUE))
#' df2json(df)
df2json <- function(df){
    df <- prepare_for_JSON(df)
    objects <- apply(df, 1, function(row) {paste(row, collapse = ',')})
    objects <- paste0('{', objects, '}')
    objects <- paste0('[', paste(objects, collapse = ',\n'), ']')

    objects
}

#' Convert a matrix to JSON
#'
#'
#' @param mat input matrix object
#' @export
#' @import rjson
#' @examples library(df2json)
#' df <- m <- matrix(1:9, byrow = TRUE, nrow=3)
#' matrix2json(df)
matrix2json <- function(mat){
    mat <- as.list(as.data.frame(t(mat)))
    names(mat) <- NULL
    toJSON(mat)
}