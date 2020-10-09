#' Git Push
#'
#' Calls `gert::git_push()`
#'
#' @keywords internal
#' @export
git_push <- function() {

  gert::git_push()
}

#' Git Pull
#'
#' Calls `gert::git_pull()`
#'
#' @keywords internal
#' @export
git_pull <- function() {

  gert::git_pull(prune = TRUE)
}

#' Stage the current file
#'
#' @keywords internal
#' @export
git_add_current_file <- function() {
test
  # Get active document context
  file <- rstudioapi::getActiveDocumentContext()$path
  # get current project name
  proj_name <- basename(getwd())
  # create relative path
  path_relative <- strsplit(file, paste0(proj_name, "/"))[[1]][2]
  cli::cli_text("{.pkg git}: Staging {.file {path_relative}}")
  gert::git_add(path_relative)
}

#' Stage and commit the current file
#'
#' @keywords internal
#' @export
git_commit_current_file <- function() {

  # Get active document context
  file <- rstudioapi::getActiveDocumentContext()$path
  # get current project name

  proj_name <- basename(getwd())
  # create relative path
  path_relative <- strsplit(file, paste0(proj_name, "/"))[[1]][2]

  commit_message = rstudioapi::showPrompt("", "Enter git commit message")
  cli::cli_text("{.pkg git}: Staging {.file {path_relative}}")
  cli::cli_text("{.pkg git}: Committing {.file {path_relative}} with message
                '{.pkg {commit_message}}'.")
  gert::git_add(path_relative)
  gert::git_commit(message = commit_message)
}

#' Commit all staged files
#'
#' @keywords internal
#' @export
git_commit <- function() {

  commit_message = rstudioapi::showPrompt("", "Enter git commit message")
  files = gert::git_status()$file
  commit_info = function() {
    cli::cli_par()
    cli::cli_text("{.pkg git}: Committing")
    cli::cli_end()
    cli::cli_par()
    cli::cli_ul(files)
    cli::cli_end()
    cli::cli_par()
    cli::cli_text("with message '{.pkg {commit_message}}'.")
    cli::cli_end()
  }
  commit_info()
  gert::git_commit(message = commit_message)
}

#' Show git status
#'
#' @export
git_status <- function() {
  gert::git_status()
}

#' Add and commit all modified files in the index
#'
#' @keywords internal
#' @export
git_commit_all <- function() {
  commit_message = rstudioapi::showPrompt("", "Enter git commit message")
  files = gert::git_status()$file
  commit_info = function() {
  cli::cli_par()
  cli::cli_text("{.pkg git}: Committing")
  cli::cli_end()
  cli::cli_par()
  cli::cli_ul(files)
  cli::cli_end()
  cli::cli_par()
  cli::cli_text("with message '{.pkg {commit_message}}'.")
  cli::cli_end()
  }
  commit_info()
  gert::git_commit_all(message = commit_message)
}
