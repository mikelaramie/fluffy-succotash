terraform {
  backend "gcs" {
    bucket = "mikelaramie-sadacedemos-tf-state"
    prefix = "fluffy-succotash/"
  }
}