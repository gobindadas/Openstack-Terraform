from python_terraform import Terraform

class TerraformTest:
    def execute(self):
        print("Execute....")
        variables = {
            "auth_url": "http://ip:35357/v3",
            "user_name": "admin",
            "password": "passwd",
            "tenant_id": "f5ea74b26ec848d68e7a02fdab9ca39f",
            "domain_name": "default",
            "instance_count": 1
        }
        tfproject = Terraform("/home/gobinda/Gobinda/Work/Ericssion/devstack-practice/Terraform")

        # Apply the terraform manifest and print the start times and durations.
        #tfproject.apply()
        #print(tfproject.state)
        # Print the current state after apply() is called.
        #tfproject.state()

        tfproject.destroy()

obj =  TerraformTest()
obj.execute()
