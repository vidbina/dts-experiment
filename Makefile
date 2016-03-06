%-00A0.dtbo: %.dts
	dtc -O dtb -o $@ -b 0 -@ $<

test: pinctrl-test-7-00A0.dtbo

.PHONY: test 
