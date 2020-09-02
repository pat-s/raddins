update_rstudio_daily <- function() {
  switch (Sys.info()[["sysname"]],
    "Linux" = {
      system2("wget", c("https://rstudio.org/download/latest/daily/desktop/bionic/rstudio-latest-amd64.deb"))
      system2("sudo", c("dpkg", "-i", "rstudio-latest-amd64.deb"))
      system2("rm", c("rstudio-latest-amd64.deb"))
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
