
resource "aws_eip" "eip" {
   
   tags = {
     Name = var.eip_for_nat
   }
}



