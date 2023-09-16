resource "local_file" "productos" {
  count = 5
  content  = "Lista de productos septiembre 2023"
  filename = "productos-${random_string.sufijo[count.index].id}.txt"
}
