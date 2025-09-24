local M = {}

-- Nord palette for dark theme
M.dark_colors_table = {
  '#8FBCBB',
  '#88C0D0',
  '#81A1C1',
  '#5E81AC',
  '#BF616A',
  '#D08770',
  '#EBCB8B',
  '#A3BE8C',
  '#B48EAD',
  '#ECEFF4',
  '#E5E9F0',
  '#D8DEE9',
  '#4C566A',
  '#434C5E',
  '#3B4252',
  '#2E3440'
}

-- Nord-inspired light theme (adjusted for better visibility)
M.light_colors_table = {
  '#8FBCBB',
  '#88C0D0',
  '#81A1C1',
  '#5E81AC',
  '#BF616A',
  '#D08770',
  '#EBCB8B',
  '#A3BE8C',
  '#B48EAD',
  '#ECEFF4',
  '#E5E9F0',
  '#D8DEE9',
  '#E5E9F0',
  '#D8DEE9',
  '#ECEFF4',
  '#2E3440'
}

-- Factors that can be adjusted to get a better color matching
M.factors = {
  lightness = 1.75,
  chroma = 1,
  hue = 1.25,
}

-- Precise search can result in better colors matching
--   by automatically tweaking the factors
M.precise_search = {
  enabled = true,
  iteration = 10,
  precision = 20,
  threshold = 23,
}

return M
