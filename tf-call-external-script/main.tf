terraform {
  required_providers {
    external = {
      source = "hashicorp/external"
      version = "2.3.3"
    }
   }
}

provider "external" {
}

locals {
    local_time = formatdate("YYYY-MM-DD'T'23:00", timeadd(timestamp(), "150h"))
    local_timezone = "Europe/London"
}


#
# the following resource prevents a constant re-evaluation of the external.datetime_utc_converter function
#
resource "terraform_data" "times" {
  input = {
    local_time = local.local_time
  }

  lifecycle {
    ignore_changes = [ input ]
#    replace_triggered_by = [ terraform_data.other_resource ]
  }
}

data "external" "datetime_utc_converter" {
  program = ["bash", "${path.module}/convert-local-datetime-to-utc.sh"]

   query = {
    datetime_in_local_time = "${terraform_data.times.output.local_time}"
    timezone = "${local.local_timezone}"
  }
}

output "utc_time" {
  value = data.external.datetime_utc_converter.result.datetime_in_utc
}
