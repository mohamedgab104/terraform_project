<h1>Project Structure</h1>
<p>terraform_project/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── vpc.tf
├── frontend.tf
└── backend.tf
</p>
<h1> Terraform Project Description </h1>
<p># Terraform Multi-Tier Application Deployment

## Overview

This Terraform project automates the deployment of a multi-tier application architecture on AWS. It provisions a scalable web application setup consisting of a frontend and backend, leveraging Amazon EC2 instances, an S3 bucket for static content, and Elastic Load Balancers (ELB) for distributing incoming traffic.

### Architecture Diagram

```plaintext
                        +-------------------+
                        |   User Requests    |
                        +-------------------+
                                 |
                                 v
                    +--------------------------+
                    |   Elastic Load Balancer   |
                    +--------------------------+
                                 |
               +----------------+----------------+
               |                                 |
               v                                 v
    +-------------------+               +-------------------+
    |  EC2 Frontend 1   |               |  EC2 Frontend 2   |
    +-------------------+               +-------------------+
               |                                 |
               +-------------------+----------------+
                                   |
                                   v
                     +------------------------------+
                     |   Elastic Load Balancer       |
                     +------------------------------+
                                   |
               +-------------------+-------------------+
               |                                       |
               v                                       v
    +-------------------+                       +-------------------+
    |  EC2 Backend 1    |                       |  EC2 Backend 2    |
    +-------------------+                       +-------------------+
                                   |
                                   v
                            +----------------+
                            |   S3 Bucket    |
                            +----------------+
</p>
