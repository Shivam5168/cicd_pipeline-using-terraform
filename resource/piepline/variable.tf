variable "project_id" {
  type = string
  description = "Your Project Id"
}

variable "name" {
  type = string
  description = "Your Devops Build Name"
}

variable "use_yaml" {
  type = bool
  description = "Is Yaml USE"  
}

variable "repo_type" {
  type = string
  description = "Your Repository Type"
}

variable "repo_id" {
  type = string
  description = "Your Repository Id"
}

variable "branch_name" {
  type = string
  description = "Your Repository Branch Name"
}

variable "yml_path" {
  type = string
  description = "Your YML File Path"
}

variable "github_id" {
  type = string
  description = "Your Github Id"
}

variable "include" {
  type = list(string)
  description = "Include"
}

variable "exclude" {
  type = list(string)
  description = "Exclude"
}

variable "days_to_build" {
  type = list(string)
  description = "Total Days to build"
}



