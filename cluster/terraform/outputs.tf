output "schematic_comparison" {
  value = format(
    "Prior UUID was %s, Current ID is %s, The match is %s",
    var.talosos_prior_uuid,
    module.talosos.schematic_id,
    var.talosos_prior_uuid == module.talosos.schematic_id ? "true" : "false"
  )
}
