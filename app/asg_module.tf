module "n.virginia_asg" {
  source = "./module"
  region = "us-east-1"
}


module "london_asg" {
  source = "./module"
  region = "eu-west-2"
}
