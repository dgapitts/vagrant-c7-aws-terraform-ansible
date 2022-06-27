## Demo001 Simple SNS topic setup - using terraform plan and terraform apply

The [first demo](https://gitlab.com/mvandongen/tfworks/-/tree/main/01) starts with adding wit `aws_sns_topic`

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

and running `terraform plan`

```
[c7-master:vagrant:~/tfworks/01/workdir] # time terraform plan
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Enter a value: us-east-1


Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_sns_topic.topic will be created
  + resource "aws_sns_topic" "topic" {
      + arn                         = (known after apply)
      + content_based_deduplication = false
      + fifo_topic                  = false
      + id                          = (known after apply)
      + name                        = "davep-step1-sbx-topic-20220622001"
      + name_prefix                 = (known after apply)
      + owner                       = (known after apply)
      + policy                      = (known after apply)
      + tags                        = {
          + "Name" = "davep-step1-sbx-topic-20220622001"
        }
      + tags_all                    = {
          + "Name" = "davep-step1-sbx-topic-20220622001"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

real	0m13.448s
user	0m3.773s
sys	0m0.887s
```


and lastly `terraform apply`

```
[c7-master:vagrant:~/tfworks/01/workdir] # time terraform apply
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Enter a value: us-east-1


Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_sns_topic.topic will be created
  + resource "aws_sns_topic" "topic" {
      + arn                         = (known after apply)
      + content_based_deduplication = false
      + fifo_topic                  = false
      + id                          = (known after apply)
      + name                        = "davep-step1-sbx-topic-20220622001"
      + name_prefix                 = (known after apply)
      + owner                       = (known after apply)
      + policy                      = (known after apply)
      + tags                        = {
          + "Name" = "davep-step1-sbx-topic-20220622001"
        }
      + tags_all                    = {
          + "Name" = "davep-step1-sbx-topic-20220622001"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_sns_topic.topic: Creating...
aws_sns_topic.topic: Creation complete after 4s [id=arn:aws:sns:us-east-1:827589484650:davep-step1-sbx-topic-20220622001]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

real	0m19.239s
user	0m3.774s
sys	0m1.164s
```