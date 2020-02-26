terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "imjohnbo-test"
    
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
  name = "octozen"

  repo {
    repo_branch = "style/inverse"
    repo_path   = "imjohnbo/octozen"
    provider    = "github"
  }
}
