#!/usr/bin/env python3
import matplotlib.pyplot as plt
import matplotlib.patches as patches
from matplotlib.patches import FancyBboxPatch
import numpy as np

# Criar figura
fig, ax = plt.subplots(1, 1, figsize=(14, 10))
ax.set_xlim(0, 10)
ax.set_ylim(0, 8)
ax.axis('off')

# Cores
vpc_color = '#E8F4FD'
public_color = '#90EE90'
private_color = '#FFB6C1'
gateway_color = '#FFD700'

# VPC
vpc_box = FancyBboxPatch((0.5, 1), 9, 6, boxstyle="round,pad=0.1", 
                         facecolor=vpc_color, edgecolor='blue', linewidth=2)
ax.add_patch(vpc_box)
ax.text(5, 7.3, 'VPC (10.0.0.0/16)', ha='center', va='center', fontsize=14, fontweight='bold')

# Internet Gateway
igw_box = FancyBboxPatch((4.2, 7.5), 1.6, 0.4, boxstyle="round,pad=0.05",
                         facecolor=gateway_color, edgecolor='orange', linewidth=2)
ax.add_patch(igw_box)
ax.text(5, 7.7, 'Internet Gateway', ha='center', va='center', fontsize=10, fontweight='bold')

# Public Subnets
pub_subnet1 = FancyBboxPatch((1, 5.5), 3.5, 1.2, boxstyle="round,pad=0.05",
                             facecolor=public_color, edgecolor='green', linewidth=2)
ax.add_patch(pub_subnet1)
ax.text(2.75, 6.1, 'Public Subnet 1\n(us-east-1a)\n10.0.1.0/24', ha='center', va='center', fontsize=9)

pub_subnet2 = FancyBboxPatch((5.5, 5.5), 3.5, 1.2, boxstyle="round,pad=0.05",
                             facecolor=public_color, edgecolor='green', linewidth=2)
ax.add_patch(pub_subnet2)
ax.text(7.25, 6.1, 'Public Subnet 2\n(us-east-1b)\n10.0.2.0/24', ha='center', va='center', fontsize=9)

# NAT Gateway
nat_box = FancyBboxPatch((2, 4.8), 1.5, 0.4, boxstyle="round,pad=0.05",
                         facecolor=gateway_color, edgecolor='orange', linewidth=2)
ax.add_patch(nat_box)
ax.text(2.75, 5, 'NAT Gateway\n+ EIP', ha='center', va='center', fontsize=9, fontweight='bold')

# Private Subnets
priv_subnet1 = FancyBboxPatch((1, 2.5), 3.5, 1.2, boxstyle="round,pad=0.05",
                              facecolor=private_color, edgecolor='red', linewidth=2)
ax.add_patch(priv_subnet1)
ax.text(2.75, 3.1, 'Private Subnet 1\n(us-east-1a)\n10.0.3.0/24', ha='center', va='center', fontsize=9)

priv_subnet2 = FancyBboxPatch((5.5, 2.5), 3.5, 1.2, boxstyle="round,pad=0.05",
                              facecolor=private_color, edgecolor='red', linewidth=2)
ax.add_patch(priv_subnet2)
ax.text(7.25, 3.1, 'Private Subnet 2\n(us-east-1b)\n10.0.4.0/24', ha='center', va='center', fontsize=9)

# Internet
ax.text(5, 8.5, '🌐 INTERNET', ha='center', va='center', fontsize=16, fontweight='bold')

# Setas
# Internet -> IGW
ax.arrow(5, 8.3, 0, -0.5, head_width=0.1, head_length=0.1, fc='black', ec='black')

# IGW -> Public Subnets
ax.arrow(4.8, 7.5, -1.5, -1, head_width=0.1, head_length=0.1, fc='green', ec='green')
ax.arrow(5.2, 7.5, 1.5, -1, head_width=0.1, head_length=0.1, fc='green', ec='green')

# Public Subnet -> NAT
ax.arrow(2.75, 5.5, 0, -0.3, head_width=0.1, head_length=0.1, fc='orange', ec='orange')

# NAT -> Private Subnets
ax.arrow(2.5, 4.8, -0.5, -1, head_width=0.1, head_length=0.1, fc='red', ec='red')
ax.arrow(3, 4.8, 3.5, -1, head_width=0.1, head_length=0.1, fc='red', ec='red')

# Legenda
legend_elements = [
    patches.Patch(color=public_color, label='Public Subnets'),
    patches.Patch(color=private_color, label='Private Subnets'),
    patches.Patch(color=gateway_color, label='Gateways'),
    patches.Patch(color=vpc_color, label='VPC')
]
ax.legend(handles=legend_elements, loc='lower right', bbox_to_anchor=(0.98, 0.02))

# Título
plt.title('AWS VPC Architecture - Terraform Module', fontsize=16, fontweight='bold', pad=20)

# Salvar
plt.tight_layout()
plt.savefig('/home/bruno/bruno/terraform-vpc/vpc/vpc-architecture.png', dpi=300, bbox_inches='tight')
plt.show()