require("relative-motions"):setup({ show_numbers="relative_absolute", show_motion = true, enter_mode ="first" })

local nordyatline = require("nord-yatline"):setup()


require("yatline"):setup({
	theme = nordyatline,
	show_background = false,

	header_line = {
		left = {
			section_a = {
        			{type = "line", custom = false, name = "tabs", params = {"left"}},
			},
			section_b = {
			},
			section_c = {
			}
		},
		right = {
			section_a = {
        			{type = "string", custom = false, name = "date", params = {"%A, %d %B %Y"}},
			},
			section_b = {
        			{type = "string", custom = false, name = "date", params = {"%X"}},
			},
			section_c = {
			}
		}
	},

	status_line = {
		left = {
			section_a = {
        			{type = "string", custom = false, name = "tab_mode"},
			},
			section_b = {
        			{type = "string", custom = false, name = "hovered_size"},
			},
			section_c = {
        			{type = "string", custom = false, name = "hovered_path"},
			--	{type = "coloreds", custom = false, name = "count"},
				{type = "coloreds", custom = false, name = "githead"},
			}
		},
		right = {
			section_a = {
        			{type = "string", custom = false, name = "cursor_position"},
			},
			section_b = {
        			{type = "coloreds", custom = false, name = "created_time"},
        			{type = "coloreds", custom = false, name = "page_count"},
			},
			section_c = {
        			{type = "string", custom = false, name = "hovered_file_extension", params = {true}},
        			{type = "coloreds", custom = false, name = "permissions"},
			}
		}
	},
})

require("yatline-created-time"):setup()
require("yatline-page-counter"):setup({
	page_color = "white",      -- Color for page count display
	show_icon = true,         -- Show document icon
	icon = "📄",             -- Icon to display
})
require("yatline-githead"):setup()


--require("eza-preview"):setup()


