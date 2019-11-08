terraform {
  backend "remote" {
    workspaces {
      name = "octozen"
    }
  }
}

variable "netlify_token" {
  type = "string"
}

# Configure the Netlify Provider
provider "netlify" {
  token = "${var.netlify_token}"
}

# Define your site
resource "netlify_site" "main" {
  name = "vigilant-meme"

  repo {
    repo_branch   = "feature/test"
    repo_path     = "imjohnbo/octozen"
    provider      = "github"
  }
}
