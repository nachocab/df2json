# df2json
df2json is an R package to convert a dataframe to a JSON object.

It handles numerics, characters, factors, and logicals.

## Install
```
install.packages("devtools")
library(devtools)
install_github("df2json","nachocab")
```

## Usage

```
library(df2json)
df <- data.frame(name=c("a", "b", "c"), x=c(NA, 2 ,3), y=c(10, 20, -Inf), show=c(TRUE, FALSE, TRUE))
df2json(df)
```

The result is
```
[{"name":"a","x":null,"y":10,"show":true},
 {"name":"b","x":2,"y":20,"show":false},
 {"name":"c","x":3,"y":null,"show":true}]
```
