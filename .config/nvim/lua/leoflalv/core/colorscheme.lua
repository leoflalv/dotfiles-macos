local status, _ = pcall(vim.cmd, "colorscheme ayu-mirage")
if not status then
  print("Color scheme not found")
  return
end
