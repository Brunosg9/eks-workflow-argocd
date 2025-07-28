resource "aws_eks_node_group" "this" {
    cluster_name    = "${aws_eks_cluster.this.name}"
    node_group_name = "${var.eks_cluster.name}-node-group"
    node_role_arn   = aws_iam_role.eks_node_group_role.arn
    subnets_ids     = data.terraform_remote_state.eks.outputs.private_subnet_ids
    capacity_type   = var.eks_cluster.node_group.capacity_type
}