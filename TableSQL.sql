CREATE TABLE "Game" ( --SQL of table Game
	"game_id"	INTEGER,
	"category_id"	INTEGER,
	"game_name"	TEXT DEFAULT NULL,
	FOREIGN KEY("category_id") REFERENCES "Game_category"("game_category_id"),
	PRIMARY KEY("game_id")
);

CREATE TABLE "Game_category" ( --SQL of table Game_category
	"game_category_id"	INTEGER,
	"catagory_name"	TEXT DEFAULT NULL,
	PRIMARY KEY("game_category_id")
);

CREATE TABLE "Game_platform" ( --SQL of table Game_platform
	"game_platform_id"	INTEGER,
	"game_publisher_id"	INTEGER DEFAULT NULL,
	"platform_id"	INTEGER DEFAULT NULL,
	"release_year"	INTEGER DEFAULT NULL,
	FOREIGN KEY("platform_id") REFERENCES "Platform"("platform_id"),
	FOREIGN KEY("game_publisher_id") REFERENCES "Game_platform",
	PRIMARY KEY("game_platform_id")
);

CREATE TABLE "Game_publisher" ( --SQL of table Game_publisher
	"game_publisher_id"	INTEGER,
	"game_id"	INTEGER DEFAULT NULL,
	"publisher_id"	INTEGER DEFAULT NULL,
	FOREIGN KEY("game_id") REFERENCES "Game"("game_id"),
	FOREIGN KEY("publisher_id") REFERENCES "Publisher"("publisher_id"),
	PRIMARY KEY("game_publisher_id")
);

CREATE TABLE "Platform" ( --SQL of table Platform
	"platform_id"	INTEGER,
	"platform_name"	TEXT DEFAULT NULL,
	PRIMARY KEY("platform_id")
);

CREATE TABLE "Publisher" ( --SQL of table Publisher
	"publisher_id"	INTEGER,
	"publisher_name"	TEXT DEFAULT NULL,
	PRIMARY KEY("publisher_id")
);

CREATE TABLE "Region" ( --SQL of table Region
	"region_id"	INTEGER,
	"region_name"	TEXT DEFAULT NULL,
	PRIMARY KEY("region_id")
);

CREATE TABLE "Region_sales" ( --SQL of table Region_sales
	"region_id"	INTEGER DEFAULT NULL,
	"game_platform_id"	INTEGER DEFAULT NULL,
	"num_sales"	REAL,
	FOREIGN KEY("game_platform_id") REFERENCES "Game_platform"("game_platform_id"),
	FOREIGN KEY("region_id") REFERENCES "Region"("region_id")
);