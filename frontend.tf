resource "aws_launch_configuration" "frontend" {
  name          = "frontend-launch-configuration"
  image_id     = var.ami_id
  instance_type = var.frontend_instance_type
  security_groups = [aws_security_group.frontend_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "frontend" {
  desired_capacity     = 2
  max_size            = 2
  min_size            = 2
  vpc_zone_identifier = var.subnet_ids
  launch_configuration = aws_launch_configuration.frontend.id

  tag {
    key                 = "Name"
    value               = "FrontendInstance"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "frontend_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "frontend_load_balancer" {
  name               = "frontend-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.frontend_sg.id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  idle_timeout {
    timeout = 60
  }
}

resource "aws_lb_listener" "frontend_listener" {
  load_balancer_arn = aws_lb.frontend_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend_target_group.arn
  }
}

resource "aws_lb_target_group" "frontend_target_group" {
  name     = "frontend-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "frontend_attachment" {
  count               = 2
  target_group_arn    = aws_lb_target_group.frontend_target_group.arn
  target_id           = aws_autoscaling_group.frontend.instances[count.index]
  port                = 80
}

output "load_balancer_dns" {
  value = aws_lb.frontend_load_balancer.dns_name
}

