#' @title Install RStudio
#' @description Installs the latest RStudio daily version based on the operating system
#' @export
install_rstudio_daily <- function() {
  switch(Sys.info()[["sysname"]],
    "Linux" = {
      system2("wget", c("https://rstudio.org/download/latest/daily/desktop/bionic/rstudio-latest-amd64.deb"))
      system("sudo -kS dpkg -i rstudio-latest-amd64.deb", input = rstudioapi::askForPassword("sudo password"))
      system2("rm", c("rstudio-latest-amd64.deb"))
      rstudioapi::openProject()
    },
    "Darwin" = {
      system2("brew", c("cask", "reinstall", "rstudio-daily"))
    },
    "Windows" = {
      system2("scoop", c("update"))
      system2("scoop", c("update", "rstudio-daily"))
    }
  )
}
