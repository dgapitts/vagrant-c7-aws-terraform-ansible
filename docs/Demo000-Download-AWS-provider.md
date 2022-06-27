## Demo000 download the specfic aws provider - using terraform init

The [first demo](https://gitlab.com/mvandongen/tfworks/-/tree/main/01) starts with adding wit `aws_sns_topic`.


```
[c7-master:vagrant:~/tfworks/01/workdir] # cat main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Owner = "dgapitts@gmail.com"
      Stack = var.stack
    }
  }
}

variable "stack" {
	default = "davep-step1"
}

variable "environment" {
	default = "sbx"
}

locals {
	prefix = "${var.stack}-${var.environment}"
  suffix = "20220622001"
}

resource "aws_sns_topic" "topic" {
	name = "${local.prefix}-topic-${local.suffix}"

	tags = {
		Name = "${local.prefix}-topic-${local.suffix}"
	}
}
```


However the very first step is to download the specfic aws provider i.e. `hashicorp/aws`

```
[c7-master:vagrant:~/tfworks/01/workdir] # terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v3.75.2

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

as above, we can see `Using previously-installed hashicorp/aws v3.75.2` so this part was already in place.