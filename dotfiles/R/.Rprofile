# Which mirror I do want to use
local(
      {
	      r <- getOption("repos")
	      r["CRAN"] <- "https://cloud.r-project.org/"
	      options(repos=r)
      }
)
# And where the packages are stored

.First = function(){
}

# Complete pack names
utils::rc.settings(ipck=TRUE)

#general options
options(prompt        = "> ",
	continue      = "... ",
	max.print     = 1e3,
	width         = 80,
	menu.graphics = FALSE,
	browser = "google-chrome",
	Ncpus         = 4
	)

#+++++++++++++++++++++
# for future reference
#+++++++++++++++++++++
# COMPILE FLAGS FOR R
# --with-cairo implicitly checks for libcairo2 or similar.
# --with-libraries uses sytem default (update-alternatives)

# ./configure --with-lapack --with-blas --with-cairo

#  Config options should be
#  Interfaces supported:        X11, tcltk
#  External libraries:          pcre2, readline, BLAS(OpenBLAS), LAPACK(in blas), curl
#  Additional capabilities:     PNG, JPEG, TIFF, NLS, cairo, ICU
#  Options enabled:             R profiling
#
#  Capabilities skipped:

# tcltk / tiff missing can be fixed installing tk-dev tf-dev libtiff-dev etc


# R-studio            
# ./configure --with-lapack --with-blas --with-cairo --enable-R-shlib                                            
# specifcy R version at rstudio startup
#export RSTUDIO_WHICH_R=/home/meme/GIT/R/R-shlib/bin/R



