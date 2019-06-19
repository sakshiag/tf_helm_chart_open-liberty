# Shared Variables
variable "bluemix_api_key" {
}

variable "region" {
}

variable "cluster_name" {
    default = "helm-demo-cluster"
}

variable "release_name" {
    default = "ibm-open-liberty"

}

variable "chart_name" {
    default = "ibm-open-liberty"

}

variable "namespace" {
    default = "default"

}


