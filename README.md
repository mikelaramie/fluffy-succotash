# fluffy-succotash

This is a demo environment that will spin up a project that will spin up two Windows hosts - one with an unmanaged browser and one with a managed browser.  The goal is to demonstrate the differences in Context-Aware Access leveraging BeyondCorp Enterprise.

Currently the code requires you to manually create the project to be used.

This code will deploy resources that incur costs while running.

## TODO
- Add project creation
- Add IAP
- Automate chrome management token
- Automate access level creation## Requirements

## Requirements
No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.76.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow-rdp](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.managed_vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_instance.unmanaged_vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_network.bce-demo-network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_project_service.gcp_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.compute_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chrome_enrollment_token"></a> [chrome\_enrollment\_token](#input\_chrome\_enrollment\_token) | Chrome Enterprise enrollment token | `string` | n/a | yes |
| <a name="input_gcp_service_list"></a> [gcp\_service\_list](#input\_gcp\_service\_list) | The list of apis necessary for the project | `list(string)` | <pre>[<br>  "cloudresourcemanager.googleapis.com",<br>  "compute.googleapis.com",<br>  "iam.googleapis.com"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project to deploy resources within | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Default region to use for resources | `string` | `"us-central1"` | no |
| <a name="input_vm_user_name"></a> [vm\_user\_name](#input\_vm\_user\_name) | User name to use for VM connectivity | `string` | `"bce_demo"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Default zone to use for resources | `string` | `"us-central1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_managed_vm_info"></a> [managed\_vm\_info](#output\_managed\_vm\_info) | n/a |
| <a name="output_unmanaged_vm_info"></a> [unmanaged\_vm\_info](#output\_unmanaged\_vm\_info) | n/a |
