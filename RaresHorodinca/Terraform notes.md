# Terraform Notes

## Securing Keys
Set environment variables like `AWS_ACCESS_KEY` with `export`.

## Strings
Variables are a way of setting a value we can use multiple times.

Example:
```hcl
variable "region" {
  description = "The region in which to deploy resources."
  type        = string
  default     = "europe-west1"  # Update if needed
}
```

## List
```hcl
variable "mylist" {
  type    = list(string)
  default = ["value1", "value2"]
}
```
Lists always start at index 0.

## Maps
```hcl
variable "mymap" {
  type = map
  default = {
    key1 = "Value1"
    key2 = "Value2"
  }
}
```

## How to Use Your Variables
- For strings:
  ```hcl
  project = var.project_id
  ```

- For lists:
  ```hcl
  Name = var.mylist[4]
  ```

- For maps:
  ```hcl
  Name = var.mymap["Key2"]
  ```

## Input Variables
```hcl
variable "inputname" {
  type        = string
  description = "Set the name of the VPC"
}
```
When you have an `inputname` variable, running `terraform plan` will prompt you to set the value of `inputname`.

## Output & Attributes
```hcl
output "vpcid" {
  value = aws_vpc.myvpc.id
}
```
Where `vpcid` is the attribute.

## Dynamic Blocks
**Note:** Don't use them too much as they can complicate the code.

Dynamic blocks allow us to reuse code.

```hcl
variable "ingress_rules" {
  type    = list(number)
  default = [25, 80, 8080]
}

variable "egress_rules" {
  type    = list(number)
  default = [4000, 443]
}

resource "aws_security_group" "web_traffic" {
  name = "Secure Server"
  
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks  = ["0.0.0.0/0"]
    }
  }
  
  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks  = ["0.0.0.0/0"]
    }
  }
}
```

Add the security group:
Inside the resource add:
```hcl
security_groups = [aws_security_group.web_traffic.name]
```

## Tuples
```hcl
variable "mytuple" {
  type    = tuple([string, number])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "TJ"
    port = [22, 25, 80]
  }
}
```

## Dependencies
```hcl
resource "aws_vpc" "main" {  
  cidr_block = "10.0.0.0/16"  
}  

resource "aws_subnet" "main" {  
  vpc_id     = aws_vpc.main.id  
  cidr_block = "10.0.1.0/24"  
}  
```
In this example, `aws_subnet.main` depends on `aws_vpc.main` because it references `aws_vpc.main.id`. Terraform will create the VPC first and then the subnet.

```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  # Explicit dependency
  depends_on = [aws_vpc.main]
}
```

## Terraform Graph
You can visualize the dependencies using the `terraform graph` command, which outputs the dependency graph in DOT format.

## Data Sources
**Key Points:**
- **Read-Only:** Data sources do not create or change resources; they only read information.
- **Dynamic Data:** They allow you to use the latest state of your infrastructure.
- **Interoperability:** They can fetch data from the same or different providers.

### Example: Fetching an AWS AMI
```hcl
# Define the data source for AWS AMI  
data "aws_ami" "example" {  
  most_recent = true  

  filter {  
    name   = "name"  
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]  
  }  

  filter {  
    name   = "virtualization-type"  
    values = ["hvm"]  
  }  

  owners = ["137112412989"] # Amazon's AMI account ID  
}  

# Use the retrieved AMI ID in an EC2 instance resource  
resource "aws_instance" "example" {  
  ami           = data.aws_ami.example.id  
  instance_type = "t2.micro"  
}  
```

## Built-in Functions
Use them in your configuration:
- `file`: Read the contents of a file.
- `element`: Retrieves a single element from a list.
- `values`: Returns values from keys.
- `flatten`: Flattens multiple lists into one.

## Modules
Modules allow us to create blocks of code.

### Create a Module:
Put resources in a directory.

Example:
**main.tf**
```hcl
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}
```

**variables.tf**
```hcl
variable "ami" {}  
variable "instance_type" {}  
```

### Reference the Module:
Use it in your root configuration.
```hcl
module "example_instance" {  
  source        = "./path/to/module"  
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"  
}  
```
