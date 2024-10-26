# IAM role/Instance profile /Policies


resource "aws_iam_role" "ec2_role" {

 name = "ey-lamtech-ec2-role"
 assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "iam_profile" {
    name = "ey-lamtech-ec2-instance-profile"
    role = aws_iam_role.ec2_role.id
}
