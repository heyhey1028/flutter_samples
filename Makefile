init_melos:
	dart pub global activate melos
	melos bootstrap

create_new_sample:
	cd samples && mason make toybox_template