data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
    actions
  }
}

resource "aws_iam_role" "eks_node_group_role" {
    name               = var.eks_cluster.node_group.role_name
    assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
}
resource "aws_iam_role_policy_attachment" "eks_node_AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role       = aws_iam_role.eks_node_group_role.name
}
