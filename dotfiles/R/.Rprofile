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
	.libPaths("/home/meme/R/site-library")
	## ANYTHING PLACED HERE CAN BE EXTREMELY BAD FOR COMPILATION
}

# Complete pack names
utils::rc.settings(ipck=TRUE)

#library(colorout,lib.loc = "/home/meme/R/site-library")
#cat(sprintf("R %s.%s",R.version$major,R.version$minor),"\n")

# Use cairo as a default devide + specify a nice family of fonts which ideally supports
# greek letters (e.g. Hack)
setHook(packageEvent("grDevices", "onLoad"),
function(...) grDevices::X11.options(type='cairo',symbolfamily="Hack",family="Hack"))

#general options
options(
	#nvimcom.verbose = 1,
	#prompt        = "> ",
	continue      = "... ",
	max.print     = 1e3,
	device="x11",
	width         = 80,
	Ncpus         = 4,
	menu.graphics = FALSE,
	#Ncpus         = 4,
	#browser = "google-chrome",
	browser = "/home/meme/bin/reload_chrome",
	pdfviewer="/usr/bin/zathura"
	)
#if (interactive()) library("prompt",lib.loc = "/home/meme/R/site-library/"); prompt::set_prompt(prompt::prompt_fancy)

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



