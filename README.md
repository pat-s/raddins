# raddins

Personal RStudio addins and convenience functions.

The main purpose of addins is to use them in combination with keybindings.

## Examples

| Name                | Effect                                                                                     | Example Keybinding |
|---------------------|--------------------------------------------------------------------------------------------|--------------------|
| View Object         | Opens the object under the cursor in RStudio                                               | CTRL + Shift + V   |
| git pull            | Pulls from git (and prunes branches)                                                       | Alt + Shift + P    |
| git push            | Pushes to git                                                                              | CTRL + Shift + P   |
| git add             | Stages the currently active file                                                           | CTRL + Shift + A   |
| git status          | Executes `gert::git_status()` in the console                                               | CTRL + Shift + S   |
| git commit          | Executes `gert::git_commit()` with an interactive commit message popup                     | CTRL + Shift + C   |
| Reload RStudio      | Reloads RStudio and clears all Terminals                                                   | Cmd + R            |
| Insert dashes to 80 | Inserts dashes until column 80 in the editor (which creates a heading in the outline view) | CTRL + 8           |

For example, binding the "View Object" addin to `CTRL + Shift + V` opens the respective object under the cursor in RStudio.

## Installation

``` r
remotes::install_github("pat-s/raddins")
```

Please note that the 'raddins' project is released with a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.

## Acknowledgement

The "Insert dashes to 80" addin was borrowed from [mine-cetinkaya-rundel/addmins](https://github.com/mine-cetinkaya-rundel/addmins):

`rs_get_symbol_at_cursor` was borrowed from [{drake}](https://github.com/ropensci-books/drake).
