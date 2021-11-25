# Which mirror I do want to use
local(
      {
	      r <- getOption("repos")
	      r["CRAN"] <- "https://cloud.r-project.org/"
	      options(repos=r)
      }
)
# And where the packages are stored (this setup is for a Mac M1 which is arm based. Therefore R uses different paths for folders etc, and it is better to leave it as it is)
#https://mac.r-project.org/#M1
.First = function(){
}

# Complete pack names
utils::rc.settings(ipck=TRUE)
suppressMessages(prettycode::prettycode())
prettycode::prettycode()

#general options
options(prompt        = "> ",
	continue      = "... ",
	max.print     = 1e3,
	width         = 80,
	menu.graphics = FALSE,
	#browser = "google-chrome",
	Ncpus         = 4
	)

#+++++++++++++++++++++
# for future reference
#+++++++++++++++++++++
# Linking BLAS or other libraries is quite straightforward
# Install clang and fortran as in https://mac.r-project.org/#M1

# xcode-select --install

# brew install openblas

# than is is just a matter of linking (make a bakup first)

# Bakup of R internal (CRUCIAL)
# cp /Library/Frameworks/R.framework/Resources/lib/libRblas.dylib /Library/Frameworks/R.framework/Resources/lib/libRblasOLD_dylib
#ln -sf ${HOME}/opt/OpenBLAS/lib/libopenblas.dylib /Library/Frameworks/R.framework/Resources/lib/libRblas.dylib
# the path might also be /opt/homebrew/opt/openblas/lib/libblas.dylib 
# or /opt/homebrew/Cellar/openblas/0.3.17/lib/libopenblasp-r0.3.17.dylib (depending on your version)

# works faster with 4 threads.
# export OPENBLAS_NUM_THREADS=4


#OR, even better (15% faster)
#https://mac.r-project.org/libs-4/libRblas-vecLib-signed.tar.gz



# open mp: https://mac.r-project.org/openmp/
# broke with 4.1.2. Works smoothly w 4.1.0
# older versions: https://cran.r-project.org/bin/macosx/big-sur-arm64/base/

