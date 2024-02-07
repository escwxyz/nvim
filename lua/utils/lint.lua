local function get_linters_by_ft()
  local filetypes = require("configs.langs").filetypes

  local linters_by_ft = {}

  for ft, config in pairs(filetypes) do
    local linters = config.linters
    if linters and next(linters) ~= nil then
      local linter_list = {}
      for linter, _ in pairs(linters) do
        table.insert(linter_list, linter)
      end
      linters_by_ft[ft] = linter_list
    end
  end
  return linters_by_ft
end

return {
  get_linters_by_ft = get_linters_by_ft,
}
