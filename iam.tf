

data "aws_iam_policy_document" "log_assume" {
  count = "${var.enabled == "true" ? 1 : 0}"

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "log" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role_policy" "log" {
  count  = "${var.enabled == "true" ? 1 : 0}"
  name   = "${module.vpc_label.id}"
  role   = "${aws_iam_role.log[count.index].id}"
  policy = "${data.aws_iam_policy_document.log.json}"
}

resource "aws_iam_role" "log" {
  count              = "${var.enabled == "true" ? 1 : 0}"
  name               = "${module.vpc_label.id}"
  assume_role_policy = "${data.aws_iam_policy_document.log_assume[count.index].json}"
}

data "aws_iam_policy_document" "kinesis_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["logs.${length(var.region) > 0 ? var.region: data.aws_region.default.name}.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "kinesis" {
  statement {
    actions = [
      "kinesis:PutRecord*",
      "kinesis:DescribeStream",
      "kinesis:ListStreams",
    ]

    resources = [
      "${aws_kinesis_stream.default.0.arn}",
    ]
  }
}

resource "aws_iam_role" "kinesis" {
  count              = "${var.enabled == "true" ? 1 : 0}"
  name               = "${module.kinesis_label.id}"
  assume_role_policy = "${data.aws_iam_policy_document.kinesis_assume.json}"
}

resource "aws_iam_role_policy" "kinesis" {
  count  = "${var.enabled == "true" ? 1 : 0}"
  name   = "${module.vpc_label.id}"
  role   = "${aws_iam_role.kinesis[count.index].id}"
  policy = "${data.aws_iam_policy_document.kinesis.json}"
}
