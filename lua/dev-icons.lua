require'nvim-web-devicons'.setup {
 override = {
  dockerfile = {
    icon = Preferences.designSystem.icons.docker,
    color = "#458ee6",
    cterm_color = "68",
    name = "Dockerfile"
  }
 };
 override_by_filename = {
  ["docker-compose.yml"] = {
    icon = Preferences.designSystem.icons.docker,
    color = "#458ee6",
    cterm_color = "68",
    name = "Dockerfile"
  },
  [".dockerignore"] = {
    icon = Preferences.designSystem.icons.docker,
    color = "#458ee6",
    cterm_color = "68",
    name = "Dockerfile"
  },
  ["build"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Build"
  }
 };

 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
}
