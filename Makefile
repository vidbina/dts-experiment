%-00A0.dtbo: %.dts
	dtc -O dtb -o $@ -b 0 -@ $<

# Update the slots by either supplying a string to represent the slot
# to insert or a negative integer to represent the slot number to remove
update:
	sudo ITEM=${ITEM} SLOTS=${SLOTS} ./update_slots.sh

link:
	echo "cp ${ITEM} /lib/firmware/"
	sudo cp ${ITEM} /lib/firmware/

test: pinctrl-test-7-00A0.dtbo
test-link:
	ITEM=pinctrl-test-7-00A0.dtbo make link
test-update:
	ITEM=pinctrl-test-7 SLOTS=${SLOTS} make update

.PHONY: test test-link
