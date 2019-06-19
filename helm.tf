
#To get the cluster config file on which the helm chart are installed.
data "ibm_container_cluster_config" "cluster_config" {
 
 cluster_name_id = "${var.cluster_name}"
 config_dir      = "/tmp"

}

provider "helm" {
    kubernetes {
          config_path = "${data.ibm_container_cluster_config.cluster_config.config_file_path}"     
    }
}

resource "helm_release" "my_database" {

    name      = "${var.release_name}"
    chart     = "/go/src/github.com/IBM/charts/stable/${var.chart_name}"
    namespace = "${var.namespace}"

   #Override values in values.yaml
    values = [
      "${file("override.yaml")}"
  ]

}

