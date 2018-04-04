provider "aws" {
  region = "${var.AWS_REGION}"
}

# DB instance
resource "aws_instance" "ec2_db" {
  ami           = "ami-1853ac65"
  instance_type = "t2.micro"
  key_name      = "ec2_keyPair"

  tags {
    Name = "db_TRF"
  }

  user_data = "${file("sqlScript.sh")}"
}

# template
data "template_file" "test" {
  template = "${file("testWordPressScriptTPL.sh")}"

  vars {
    db_public_ip = "${aws_instance.ec2_db.public_ip}"
  }
}

# Web _ TestWordPress instance
resource "aws_instance" "ec2_web" {
  ami           = "ami-1853ac65"
  instance_type = "t2.micro"
  key_name      = "ec2_keyPair"

  tags {
    Name = "web_TRF"
  }

  user_data = "${data.template_file.test.rendered}"
}
