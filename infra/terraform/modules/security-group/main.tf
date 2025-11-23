resource "aws_security_group" "ecs" {
  name        = "${var.environment}-ecs-sg"
  description = "ECS service security group"
  vpc_id      = var.vpc_id

  # Inbound rules abiertas SOLO dentro de la VPC (todo el tráfico interno)
  ingress {
    description = "Allow all internal VPC traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  # Inbound rule para que el ALB acceda al puerto 8000
  ingress {
    description     = "Allow traffic from ALB to ECS containers"
    from_port       = 8000
    to_port         = 8000
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]  # referencia al SG del ALB
  }

  # Outbound: todo permitido
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-ecs-sg"
    Environment = var.environment
  }
}

resource "aws_security_group" "alb" {
  name        = "${var.environment}-alb-sg"
  description = "Security Group for Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-alb-sg"
    Environment = var.environment
  }
}
