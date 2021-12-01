create table race (
	id int  AUTO_INCREMENT PRIMARY KEY,
	type varchar(255),
	father_race varchar(255),
	languaje_number int,
	velocity float,
	dark_vision boolean,
	vision_num int,
	incantation_num int,
	ability_num int

);
create table abilities(
	id int  AUTO_INCREMENT PRIMARY KEY,
	ability_type varchar(255)
);

create table race_ability(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_race int, FOREIGN KEY(id_race) REFERENCES race(id),
	id_ability int, FOREIGN KEY(id_ability) REFERENCES abilities(id),	
	upgrade int

);
create table languajes(
	id int  AUTO_INCREMENT PRIMARY KEY,
	languaje int

);

create table race_languaje(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_race int, FOREIGN KEY (id_race) REFERENCES race(id),
	id_languaje int, FOREIGN KEY (id_languaje) REFERENCES languajes(id)

);
create table class(
	id int  AUTO_INCREMENT PRIMARY KEY,
	type varchar(255),
	num_tools int,
	num_skills int,
	damage_points int,
	damage_device varchar(255),
	salvation_number int,
	traits_numbers int
);
create table tools(
	id int AUTO_INCREMENT PRIMARY KEY,
	tool varchar(255),
	type varchar(255)
);
create table weapons(
	id int  AUTO_INCREMENT PRIMARY KEY,
	name_weapon varchar(255),
	property_weapon varchar(255),
	damage_number int
	
);
create table class_tools(
	id int AUTO_INCREMENT PRIMARY KEY,
	id_race int,FOREIGN KEY (id_race) REFERENCES race(id),
	id_tools int,FOREIGN KEY (id_tools) REFERENCES tools(id)
);

create table class_weapons(
	id int AUTO_INCREMENT PRIMARY KEY,
	id_class int, FOREIGN KEY (id_class) REFERENCES class(id),
	id_weapons int,FOREIGN KEY (id_weapons) REFERENCES weapons(id)

);
create table skills(
	id int  AUTO_INCREMENT PRIMARY KEY,
	skill varchar(255)
);
create table class_skills(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_class int,FOREIGN KEY (id_class) REFERENCES class(id),
	id_skills int,FOREIGN KEY (id_skills) REFERENCES skills(id)
);


create table armour(
	id int  AUTO_INCREMENT PRIMARY KEY,
	name_armour varchar(255),
	property_armour varchar(255),   
	class_armour int
	
);
create table class_armour(
	id int AUTO_INCREMENT PRIMARY KEY,
	id_class int,FOREIGN KEY (id_class) REFERENCES class(id),
	id_armour int,FOREIGN KEY (id_armour) REFERENCES armour(id)
);
create table traits(
	id int  AUTO_INCREMENT PRIMARY KEY,
	name_trait varchar(255),
	value_trait int,
	damage_trait_number int,
	dice_roll varchar(5)
);

create table background_class(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_languaje int,FOREIGN KEY (id_languaje) REFERENCES languajes(id),
	languaje_num int,
	type varchar(255)

);

create table background_types(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_background_class int,FOREIGN KEY (id_background_class) REFERENCES background_class(id),
	type varchar(255)
);
create table background(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_background_types int,FOREIGN KEY (id_background_types) REFERENCES background_types(id),
	value varchar(255)
);
create table equipment(
	id int  AUTO_INCREMENT PRIMARY KEY,
	name varchar(255)
);
create table background_equipment(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_background int,FOREIGN KEY (id_background) REFERENCES background(id),
	id_equipment int,FOREIGN KEY (id_equipment) REFERENCES equipment(id)
);
create table class_equipment(
	id int AUTO_INCREMENT PRIMARY KEY,
	id_class int,FOREIGN KEY (id_class) REFERENCES class(id),
	id_equipment int,FOREIGN KEY (id_equipment) REFERENCES equipment(id)
);
create table incantation_tricks(
	id int  AUTO_INCREMENT PRIMARY KEY,
	name varchar(255),
	type varchar(255),
	description varchar(255),
	time float,
	scope int
);

create table salvation(
	 id int  AUTO_INCREMENT PRIMARY KEY,
	 type varchar(255)
);

create table users(
	id int  AUTO_INCREMENT PRIMARY KEY,
	username varchar(255) UNIQUE,
	password varchar(255)
);
create table sheet(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_user int,FOREIGN KEY (id_user) REFERENCES users(id),
	level int,
	name varchar(255),
	race varchar(255),
	class varchar(255),
	alingment varchar(255),
	dice_hit varchar(255),
	dmg_points int,
	armour_class int,
	iniciative int,
	velocity int,
	personality varchar(255),
	aspiration varchar(255),
	tie varchar(255),
	defect varchar(255),
	special varchar(255),
	amour varchar(255),
	armour_type varchar(255),
	strength int,
	dexterity int,
	constitution int,
	intelligence int,
	wisdom int,
	charisma int
);
create table sh_incantation_tricks(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_sheet int,FOREIGN KEY (id_sheet) REFERENCES sheet(id),
	id_incantation_tricks int,FOREIGN KEY (id_incantation_tricks) REFERENCES incantation_tricks(id)
);
create table sh_languaje(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_sheet int,FOREIGN KEY (id_sheet) REFERENCES sheet(id),
	id_languaje int,FOREIGN KEY (id_languaje) REFERENCES languajes(id)

);

create table sh_trait(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_sheet int,FOREIGN KEY (id_sheet) REFERENCES sheet(id),
	id_traits int,FOREIGN KEY (id_traits) REFERENCES traits(id)
);

create table sh_weapon(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_sheet int,FOREIGN KEY (id_sheet) REFERENCES sheet(id),
	id_weapon int,FOREIGN KEY (id_weapon) REFERENCES weapons(id)

);
create table sh_equip(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_sheet int,FOREIGN KEY (id_sheet) REFERENCES sheet(id),
	id_equipment int,FOREIGN KEY (id_equipment) REFERENCES equipment(id)
);
create table sh_tool(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_sheet int,FOREIGN KEY (id_sheet) REFERENCES sheet(id),
	id_tool int,FOREIGN KEY (id_tool) REFERENCES tools(id)

);
create table sh_ability(
	id int  AUTO_INCREMENT PRIMARY KEY,
	id_sheet int,FOREIGN KEY (id_sheet) REFERENCES sheet(id),
	id_ability int,FOREIGN KEY (id_ability) REFERENCES abilities(id),
	value int,
	choose boolean
);