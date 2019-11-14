#' Init write-good
#'
#' @import V8
#' @export
init_write_good <-  function(){
  ct <- v8()
  ct$source(system.file("bundle.js", package="gramr"))
  return(ct)
}

#' Message on init
#'
#' @export
init_msg <- function(){
  ct <- init_write_good()
  global_keys <- ct$get(JS('Object.keys(global)'))
  ifelse(global_keys[length(global_keys)] == "writeGood",
       "write-good has been loaded and is ready to use",
       "write-good has not been loaded, there is a problem. Sorry :(")

}

#' show a status msg on pkg load
#' @noRd
.onAttach <- function(libname, pkgname) {
  msg <- init_msg()
  packageStartupMessage(msg)
}


# How I bundled write-good with this pkg

# Linux terminal:
# apt-get install node.js
# apt-get install npm
# sudo npm install -g write-good

# Test from terminal:
# write-good --text="It should have been defined there."

# Now to bundle it up for the R package, following the V8 vignette, with some minor variations:

# sudo npm install -g browserify
# sudo ln -s /usr/bin/nodejs /usr/bin/node
# browserify -s /home/ben/node_modules/write-good -s > bundle.js

# sudo apt-get install libv8-3.14-dev -y

# Now in R:

# install.packages("V8")

# library(V8)
# ct <- v8()
# ct$source("bundle.js")
# ct$get(JS('Object.keys(global)'))

# test <- "It should have been defined there. But it wasn't suddenly."
# write_good_test <- ct$call("writeGood", test)
# str(write_good_test)
# write_good_test

# Put this bundle.js in inst so the pkg can use it

