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
}

#Complete pack names
utils::rc.settings(ipck=TRUE)
setHook(packageEvent("grDevices", "onLoad"),
function(...) grDevices::X11.options(type='cairo'))

#general options
options(prompt        = "> ",
	continue      = "... ",
	max.print     = 1e3,
	device="x11",
	width         = 80,
	menu.graphics = FALSE,
	#Ncpus         = 4,
	browser = "chromium-browser",
	#browser = "/home/meme/bin/reload_surf"
	Ncpus         = 4
	)
