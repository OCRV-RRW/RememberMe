components {
  id: "cell"
  component: "/main/cell.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"cell\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/cell.atlas\"\n"
  "}\n"
  ""
}
