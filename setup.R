# install rix
# install.packages("rix", repos = "https://cloud.r-project.org")

# trouble shooting
# nix-shell default.nix --keep-failed 2>&1 | grep -A 20 <failed install packages name>

library(rix)
rix::available_r()

r.ver = "4.5.1"

cran_pkgs = c(
  #general
  "tidyverse", "doParallel", "assertr", "BiocManager",
  )

git_pkgs = list(
  list(
    package_name = "ecolymate",
    repo_url = "https://github.com/hiroakif93/ecolymate",
    commit = "2e16eab"
  )
)


#  Build ------------------------------------------------------------------

rix(
    r_ver = r.ver,
    r_pkgs = cran_pkgs,
    system_pkgs = c("git"),
    git_pkgs = git_pkgs,
    ide = "none",
    shell_hook = NULL,
    project_path = ".",
    overwrite = TRUE,
    print = TRUE
)
