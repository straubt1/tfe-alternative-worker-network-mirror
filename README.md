# Terraform Enterprise Network Mirror - `>= 0.13.x`

This repository demonstrates how to modify the [Alternative Worker Image](https://www.terraform.io/docs/enterprise/install/installer.html#alternative-terraform-worker-image) to leverage a Network Mirror for hosting Terraform Providers.

This configuration is required to be set in the CLI configuration `provider_installation` block, which can be a challenge within Terraform Enterprise since each run creates it's own CLI configuration.

https://www.terraform.io/docs/internals/provider-network-mirror-protocol.html

## How this works

Using the [Init Script](https://www.terraform.io/docs/enterprise/install/installer.html#initialize-script) that runs before each run, we adjust the CLI configuration and inject our network mirror configuration.

This will append the following:

```hcl
provider_installation {
  network_mirror {
    url = "https://tf-network-mirror-demo.s3.ca-central-1.amazonaws.com/"
  }
}
```

`ca-certificates.crt` - place as many private Certificate Authorities you need to trust during a Workspace Run. Can be empty, but default the standard public CA's will be trusted.

## To Build this Docker Image

```
docker build -t tfe-alt-worker .
```
