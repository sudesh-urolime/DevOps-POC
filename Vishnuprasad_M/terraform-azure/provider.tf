# provider "azurerm" {
#     features {
#         prevent_deletion_if_contains_resources = false
#     }
#     subscription_id = "fee0a4d2-474e-4e15-b0ec-73784ba20743"
# }
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "fee0a4d2-474e-4e15-b0ec-73784ba20743"
}