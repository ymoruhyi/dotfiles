------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({
	output = "eDP-1",
	mode = "2880x1920@120.00000",
	position = "0x0",
	scale = "2", -- this is the default scale if set to "auto"
})

-- my monitor at home - desc:Dell Inc. DELL S3222DGM 98R7KK3
hl.monitor({
	output = "DP-1",
	mode = "2560x1440@120.00Hz",
	position = "-560x-1440", -- centered above, x = (2880/2 - 2560/1) /2; where eDP-1 width 2880 / 2 (scale)
	scale = "1",
})
